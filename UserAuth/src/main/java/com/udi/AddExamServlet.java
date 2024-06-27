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

@WebServlet("/AddExamServlet")
public class AddExamServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String examName = request.getParameter("exam_name");
        int classId = Integer.parseInt(request.getParameter("class_id"));
        String date = request.getParameter("date");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO exams (exam_name, class_id, date) VALUES (?, ?, ?)");
            ps.setString(1, examName);
            ps.setInt(2, classId);
            ps.setString(3, date);
            ps.executeUpdate();

            response.sendRedirect("manage_exams.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_exams.jsp?error=1");
        }
    }
}
