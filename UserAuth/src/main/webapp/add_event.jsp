<!DOCTYPE html>
<html>
<head>
    <title>Add Event</title>
</head>
<body>
    <h2>Add Event</h2>
    <form action="AddEventServlet" method="post">
        Event Name: <input type="text" name="event_name" required><br>
        Date: <input type="date" name="event_date" required><br>
        Description: <textarea name="event_description" required></textarea><br>
        <input type="submit" value="Add Event">
    </form>
</body>
</html>
