<!DOCTYPE html>
<html>
<head>
    <title>Add Timetable</title>
</head>
<body>
    <h2>Add Timetable</h2>
    <form action="AddTimetableServlet" method="post">
        Class ID: <input type="text" name="class_id" required><br>
        Subject ID: <input type="text" name="subject_id" required><br>
        Teacher ID: <input type="text" name="teacher_id" required><br>
        Day: <input type="text" name="day" required><br>
        Time: <input type="text" name="time" required><br>
        <input type="submit" value="Add Timetable">
    </form>
</body>
</html>
