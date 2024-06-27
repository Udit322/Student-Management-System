package com.udi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GenerateReportServlet")
public class GenerateReportServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("report_type");
        String dateFrom = request.getParameter("date_from");
        String dateTo = request.getParameter("date_to");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            String query = "";
            if ("attendance".equals(reportType)) {
                query = "SELECT * FROM attendance WHERE date BETWEEN ? AND ?";
            } else if ("grades".equals(reportType)) {
                query = "SELECT * FROM grades WHERE exam_date BETWEEN ? AND ?";
            }

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, dateFrom);
            ps.setString(2, dateTo);
            ResultSet rs = ps.executeQuery();

            request.setAttribute("resultSet", rs);
            request.getRequestDispatcher("report.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("generate_report.jsp?error=1");
        }
    }
}
