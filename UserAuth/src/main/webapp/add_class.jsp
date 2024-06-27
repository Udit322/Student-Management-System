<!DOCTYPE html>
<html>
<head>
    <title>Add Class</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .navbar {
            width: 100%;
            background-color: #333;
            overflow: hidden;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            padding: 14px 20px;
        }

        .navbar a {
            color: #f2f2f2;
            text-decoration: none;
            padding: 14px 20px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 80px;
            width: 300px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#">Home</a>
        <a href="about_us.jsp">About Us</a>
        <a href="logout.jsp" class="right">Logout</a>
    </div>

    <div class="container">
        <h2>Add Class</h2>
        <form action="AddClassServlet" method="post">
            <input type="text" name="class_name" placeholder="Class Name" required>
            <input type="submit" value="Add Class">
        </form>
    </div>
</body>
</html>
