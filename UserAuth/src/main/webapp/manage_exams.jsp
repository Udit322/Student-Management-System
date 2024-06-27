<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Exams</title>
</head>
<body>
    <h2>Manage Exams</h2>
    <a href="add_exam.jsp">Add Exam</a><br><br>

    <table border="1">
        <tr>
            <th>Exam ID</th>
            <th>Exam Name</th>
            <th>Class ID</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM exams");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("exam_id") %></td>
            <td><%= rs.getString("exam_name") %></td>
            <td><%= rs.getInt("class_id") %></td>
            <td><%= rs.getString("date") %></td>
            <td>
                <a href="edit_exam.jsp?exam_id=<%= rs.getInt("exam_id") %>">Edit</a> |
                <a href="DeleteExamServlet?exam_id=<%= rs.getInt("exam_id") %>">Delete</a>
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
