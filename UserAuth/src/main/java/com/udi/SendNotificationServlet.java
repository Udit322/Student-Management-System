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

@WebServlet("/SendNotificationServlet")
public class SendNotificationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int recipientId = Integer.parseInt(request.getParameter("recipient_id"));
        String message = request.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO notifications (recipient_id, message) VALUES (?, ?)");
            ps.setInt(1, recipientId);
            ps.setString(2, message);
            ps.executeUpdate();

            response.sendRedirect("send_notification.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("send_notification.jsp?error=1");
        }
    }
}

