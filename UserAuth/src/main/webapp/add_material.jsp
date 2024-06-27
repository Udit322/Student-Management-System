<!DOCTYPE html>
<html>
<head>
    <title>Provide Material</title>
</head>
<body>
    <h2>Provide Material</h2>
    <form action="AddMaterialServlet" method="post" enctype="multipart/form-data">
        Class ID: <input type="text" name="class_id" required><br>
        Subject ID: <input type="text" name="subject_id" required><br>
        Material: <input type="file" name="material" required><br>
        Description: <textarea name="description" required></textarea><br>
        <input type="submit" value="Add Material">
    </form>
</body>
</html>
