<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Materials</title>
</head>
<body>
    <h2>Manage Materials</h2>
    <a href="add_material.jsp">Add Material</a><br><br>

    <table border="1">
        <tr>
            <th>Material ID</th>
            <th>Class ID</th>
            <th>Subject ID</th>
            <th>Description</th>
            <th>File Path</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM materials");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("material_id") %></td>
            <td><%= rs.getInt("class_id") %></td>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getString("description") %></td>
            <td><a href="<%= rs.getString("file_path") %>">Download</a></td>
            <td>
                <a href="edit_material.jsp?material_id=<%= rs.getInt("material_id") %>">Edit</a> |
                <a href="DeleteMaterialServlet?material_id=<%= rs.getInt("material_id") %>">Delete</a>
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
