<!DOCTYPE html>
<html>
<head>
    <title>Communicate with Teacher</title>
</head>
<body>
    <h2>Communicate with Teacher</h2>
    <form action="SendMessageServlet" method="post">
        Student ID: <input type="text" name="student_id" required><br>
        Teacher ID: <input type="text" name="teacher_id" required><br>
        Message: <textarea name="message" required></textarea><br>
        <input type="submit" value="Send Message">
    </form>
</body>
</html>
