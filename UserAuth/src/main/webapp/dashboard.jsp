<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
                  background: url('images/cesar-couto-TIvFLeqZ4ec-unsplash.jpg') no-repeat center ;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
            width: 100%;
            position: fixed;
            top: 0;
        }

        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar .right {
            float: right;
        }

        .main-content {
            display: flex;
            width: 100%;
            padding-top: 60px; /* Adjust for navbar height */
        }

        .image-container {
            flex: 1;
            background: url('images/blank-792125_1280.jpg') no-repeat center center;
            background-size: cover;
        }

        .content-container {
            flex: 1;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        .link-container a {
            display: block;
            width: fit-content;
            padding: 10px 15px;
            margin: 10px 0;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
        }

        .link-container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#">Welcome User</a>
        <a href="about_us.jsp" class="right">About Us</a>
    </div>

    <div class="main-content">
        <div class="image-container"></div>
        <div class="content-container">
            <h2>Welcome to the Dashboard</h2>
            <div class="link-container">
                <%
                    String role = (String) session.getAttribute("role");
                    if ("admin".equals(role)) {
                %>
                    <a href="manage_users.jsp">Manage Users</a>
                    <a href="manage_classes.jsp">Manage Classes</a>
                    <a href="manage_subjects.jsp">Manage Subjects</a>
                    <a href="manage_exams.jsp">Manage Exams</a>
                    <a href="manage_grades.jsp">Manage Grades</a>
                    <a href="manage_attendance.jsp">Manage Attendance</a>
                    <a href="manage_events.jsp">Manage Events</a>
                <%
                    } else if ("teacher".equals(role)) {
                %>
                    <a href="manage_students.jsp">Manage Students</a>
                    <a href="manage_exams.jsp">Manage Exam Marks</a>
                    <a href="manage_materials.jsp">Provide Study Materials</a>
                    <a href="manage_attendance.jsp">Manage Attendance</a>
                <%
                    } else if ("student".equals(role)) {
                %>
                    <a href="view_class_routine.jsp">View Class Routine</a>
                    <a href="view_children_marks.jsp">View Exam Marks</a>
                    <a href="view_attendance.jsp">View Attendance Status</a>
                    <a href="download_materials.jsp">Download Study Materials</a>
                    <a href="view_invoices.jsp">View Payment Invoices</a>
                    <a href="communicate_teacher.jsp">Communicate with Teachers</a>
                <%
                    } else if ("parent".equals(role)) {
                %>
                    <a href="view_children_marks.jsp">View Children's Marks</a>
                    <a href="view_children_invoices.jsp">View Children's Payment Invoices</a>
                    <a href="view_children_routine.jsp">View Children's Class Routine</a>
                    <a href="message_teacher.jsp">Message Teachers</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
