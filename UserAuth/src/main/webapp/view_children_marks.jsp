<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Children Marks</title>
</head>
<body>
    <h2>View Children Marks</h2>
    <%
        int parentId = Integer.parseInt(request.getParameter("parent_id"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "password");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM marks WHERE student_id IN (SELECT student_id FROM students WHERE parent_id = ?)");
            ps.setInt(1, parentId);
            ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Mark ID</th>
            <th>Student ID</th>
            <th>Subject ID</th>
            <th>Marks</th>
        </tr>
        <% 
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getInt("mark_id") %></td>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getInt("marks") %></td>
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
