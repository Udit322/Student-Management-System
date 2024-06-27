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

@WebServlet("/SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
   
	private static final long serialVersionUID = 922300746729314996L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
        String message = request.getParameter("message");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)");
            ps.setInt(1, studentId);
            ps.setInt(2, teacherId);
            ps.setString(3, message);
            ps.executeUpdate();

            response.sendRedirect("communicate_teacher.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("communicate_teacher.jsp?error=1");
        }
    }
}
