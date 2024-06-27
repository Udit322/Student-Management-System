<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Events</title>
</head>
<body>
    <h2>Manage Events</h2>
    <a href="add_event.jsp">Add Event</a><br><br>

    <table border="1">
        <tr>
            <th>Event ID</th>
            <th>Event Name</th>
            <th>Date</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM events");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("event_id") %></td>
            <td><%= rs.getString("event_name") %></td>
            <td><%= rs.getString("event_date") %></td>
            <td><%= rs.getString("event_description") %></td>
            <td>
                <a href="edit_event.jsp?event_id=<%= rs.getInt("event_id") %>">Edit</a> |
                <a href="DeleteEventServlet?event_id=<%= rs.getInt("event_id") %>">Delete</a>
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
