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

@WebServlet("/AddTimetableServlet")
public class AddTimetableServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int classId = Integer.parseInt(request.getParameter("class_id"));
        int subjectId = Integer.parseInt(request.getParameter("subject_id"));
        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
        String day = request.getParameter("day");
        String time = request.getParameter("time");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO timetables (class_id, subject_id, teacher_id, day, time) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, classId);
            ps.setInt(2, subjectId);
            ps.setInt(3, teacherId);
            ps.setString(4, day);
            ps.setString(5, time);
            ps.executeUpdate();

            response.sendRedirect("manage_timetables.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_timetables.jsp?error=1");
        }
    }
}
