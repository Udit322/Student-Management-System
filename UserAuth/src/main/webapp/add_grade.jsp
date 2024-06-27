<!DOCTYPE html>
<html>
<head>
    <title>Add Grade</title>
</head>
<body>
    <h2>Add Grade</h2>
    <form action="AddGradeServlet" method="post">
        Student ID: <input type="text" name="student_id" required><br>
        Subject ID: <input type="text" name="subject_id" required><br>
        Exam ID: <input type="text" name="exam_id" required><br>
        Grade: <input type="text" name="grade" required><br>
        <input type="submit" value="Add Grade">
    </form>
</body>
</html>
