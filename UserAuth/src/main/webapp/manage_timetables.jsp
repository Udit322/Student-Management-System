<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Timetables</title>
</head>
<body>
    <h2>Manage Timetables</h2>
    <a href="add_timetable.jsp">Add Timetable</a><br><br>

    <table border="1">
        <tr>
            <th>Timetable ID</th>
            <th>Class ID</th>
            <th>Subject ID</th>
            <th>Teacher ID</th>
            <th>Day</th>
            <th>Time</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM timetables");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("timetable_id") %></td>
            <td><%= rs.getInt("class_id") %></td>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getInt("teacher_id") %></td>
            <td><%= rs.getString("day") %></td>
            <td><%= rs.getString("time") %></td>
            <td>
                <a href="edit_timetable.jsp?timetable_id=<%= rs.getInt("timetable_id") %>">Edit</a> |
                <a href="DeleteTimetableServlet?timetable_id=<%= rs.getInt("timetable_id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
