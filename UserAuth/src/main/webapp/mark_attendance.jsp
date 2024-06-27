<!DOCTYPE html>
<html>
<head>
    <title>Mark Attendance</title>
</head>
<body>
    <h2>Mark Attendance</h2>
    <form action="MarkAttendanceServlet" method="post">
        Student ID: <input type="text" name="student_id" required><br>
        Date: <input type="date" name="date" required><br>
        Status:
        <select name="status">
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select><br>
        <input type="submit" value="Mark Attendance">
    </form>
</body>
</html>
