<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Classes</title>
</head>
<body>
    <h2>Manage Classes</h2>
    <a href="add_class.jsp">Add Class</a><br><br>

    <table border="1">
        <tr>
            <th>Class ID</th>
            <th>Class Name</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM classes");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("class_id") %></td>
            <td><%= rs.getString("class_name") %></td>
            <td>
                <a href="edit_class.jsp?class_id=<%= rs.getInt("class_id") %>">Edit</a> |
                <a href="DeleteClassServlet?class_id=<%= rs.getInt("class_id") %>">Delete</a>
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
