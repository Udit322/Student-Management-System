<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Download Materials</title>
</head>
<body>
    <h2>Download Materials</h2>
    <%
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "password");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM materials WHERE class_id = (SELECT class_id FROM students WHERE student_id = ?)");
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Material ID</th>
            <th>Subject ID</th>
            <th>Description</th>
            <th>File</th>
        </tr>
        <% 
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getInt("material_id") %></td>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getString("description") %></td>
            <td><a href="<%= rs.getString("file_path") %>">Download</a></td>
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
