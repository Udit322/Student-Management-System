<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Student Performance</title>
</head>
<body>
    <h2>View Student Performance</h2>
    <form action="ViewStudentPerformanceServlet" method="get">
        Student ID: <input type="text" name="student_id" required><br>
        <input type="submit" value="View Performance">
    </form>
    <%
        if (request.getParameter("student_id") != null) {
            try {
                int studentId = Integer.parseInt(request.getParameter("student_id"));
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

                PreparedStatement ps = con.prepareStatement(
                    "SELECT g.subject_id, g.grade, e.exam_name FROM grades g " +
                    "JOIN exams e ON g.exam_id = e.exam_id WHERE g.student_id = ?");
                ps.setInt(1, studentId);
                ResultSet rs = ps.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Subject ID</th>
            <th>Grade</th>
            <th>Exam Name</th>
        </tr>
        <%
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("subject_id") %></td>
            <td><%= rs.getString("grade") %></td>
            <td><%= rs.getString("exam_name") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
    </table>
</body>
</html>
