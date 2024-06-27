<!DOCTYPE html>
<html>
<head>
    <title>Generate Report</title>
</head>
<body>
    <h2>Generate Report</h2>
    <form action="GenerateReportServlet" method="post">
        Report Type:
        <select name="report_type">
            <option value="attendance">Attendance Report</option>
            <option value="grades">Grades Report</option>
        </select><br>
        Date From: <input type="date" name="date_from"><br>
        Date To: <input type="date" name="date_to"><br>
        <input type="submit" value="Generate Report">
    </form>
</body>
</html>
