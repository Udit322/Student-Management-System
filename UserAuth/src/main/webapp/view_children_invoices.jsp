<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Children Invoices</title>
</head>
<body>
    <h2>View Children Invoices</h2>
    <%
        int parentId = Integer.parseInt(request.getParameter("parent_id"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "password");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM invoices WHERE student_id IN (SELECT student_id FROM students WHERE parent_id = ?)");
            ps.setInt(1, parentId);
            ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Invoice ID</th>
            <th>Student ID</th>
            <th>Date</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>
        <% 
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getInt("invoice_id") %></td>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getDouble("amount") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <% 
            } 
        %>
    </table>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
