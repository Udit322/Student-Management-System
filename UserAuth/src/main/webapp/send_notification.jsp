<!DOCTYPE html>
<html>
<head>
    <title>Send Notification</title>
</head>
<body>
    <h2>Send Notification</h2>
    <form action="SendNotificationServlet" method="post">
        Recipient ID: <input type="text" name="recipient_id" required><br>
        Message: <textarea name="message" required></textarea><br>
        <input type="submit" value="Send Notification">
    </form>
</body>
</html>
