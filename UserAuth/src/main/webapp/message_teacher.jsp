<!DOCTYPE html>
<html>
<head>
    <title>Message Teacher</title>
</head>
<body>
    <h2>Message Teacher</h2>
    <form action="SendMessageServlet" method="post">
        Parent ID: <input type="text" name="parent_id" required><br>
        Teacher ID: <input type="text" name="teacher_id" required><br>
        Message: <textarea name="message" required></textarea><br>
        <input type="submit" value="Send Message">
    </form>
</body>
</html>
