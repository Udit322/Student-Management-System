package com.udi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddGradeServlet")
public class AddGradeServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        int subjectId = Integer.parseInt(request.getParameter("subject_id"));
        int examId = Integer.parseInt(request.getParameter("exam_id"));
        String grade = request.getParameter("grade");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO grades (student_id, subject_id, exam_id, grade) VALUES (?, ?, ?, ?)");
            ps.setInt(1, studentId);
            ps.setInt(2, subjectId);
            ps.setInt(3, examId);
            ps.setString(4, grade);
            ps.executeUpdate();

            response.sendRedirect("manage_grades.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_grades.jsp?error=1");
        }
    }
}
