<!DOCTYPE html>
<html>
<head>
    <title>Add Exam</title>
</head>
<body>
    <h2>Add Exam</h2>
    <form action="AddExamServlet" method="post">
        Exam Name: <input type="text" name="exam_name" required><br>
        Class ID: <input type="text" name="class_id" required><br>
        Date: <input type="date" name="date" required><br>
        <input type="submit" value="Add Exam">
    </form>
</body>
</html>
