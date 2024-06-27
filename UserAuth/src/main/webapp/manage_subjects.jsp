<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Subjects</title>
</head>
<body>
    <h2>Manage Subjects</h2>
    <a href="add_subject.jsp">Add Subject</a><br><br>

    <table border="1">
        <tr>
            <th>Subject ID</th>
            <th>Subject Name</th>
            <th>Class ID</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM subjects");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getString("subject_name") %></td>
            <td><%= rs.getInt("class_id") %></td>
            <td>
                <a href="edit_subject.jsp?subject_id=<%= rs.getInt("subject_id") %>">Edit</a> |
                <a href="DeleteSubjectServlet?subject_id=<%= rs.getInt("subject_id") %>">Delete</a>
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
