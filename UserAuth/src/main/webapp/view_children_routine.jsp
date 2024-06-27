<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Children Routine</title>
</head>
<body>
    <h2>View Children Routine</h2>
    <%
        int parentId = Integer.parseInt(request.getParameter("parent_id"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "password");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM timetables WHERE class_id IN (SELECT class_id FROM students WHERE parent_id = ?)");
            ps.setInt(1, parentId);
            ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Day</th>
            <th>Time</th>
            <th>Class ID</th>
            <th>Subject ID</th>
            <th>Teacher ID</th>
        </tr>
        <% 
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getString("day") %></td>
            <td><%= rs.getString("time") %></td>
            <td><%= rs.getInt("class_id") %></td>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getInt("teacher_id") %></td>
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
