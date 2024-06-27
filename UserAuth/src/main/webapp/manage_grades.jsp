
<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %><!DOCTYPE html>
<html>
<head>
    <title>Manage Grades</title>
</head>
<body>
    <h2>Manage Grades</h2>
    <a href="add_grade.jsp">Add Grade</a><br><br>

    <table border="1">
        <tr>
            <th>Grade ID</th>
            <th>Student ID</th>
            <th>Subject ID</th>
            <th>Exam ID</th>
            <th>Grade</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM grades");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("grade_id") %></td>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getInt("exam_id") %></td>
            <td><%= rs.getString("grade") %></td>
            <td>
                <a href="edit_grade.jsp?grade_id=<%= rs.getInt("grade_id") %>">Edit</a> |
                <a href="DeleteGradeServlet?grade_id=<%= rs.getInt("grade_id") %>">Delete</a>
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
