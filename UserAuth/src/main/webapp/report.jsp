<%@ page import = " java.io.IOException, java.sql.SQLException,java.sql.Connection, java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.ResultSetMetaData" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report</title>
</head>
<body>
    <h2>Report</h2>
    <table border="1">
        <tr>
            <%
                ResultSet rs = (ResultSet) request.getAttribute("resultSet");
                if (rs != null) {
                    ResultSetMetaData rsmd = rs.getMetaData();
                    int columnCount = rsmd.getColumnCount();
                    for (int i = 1; i <= columnCount; i++) {
                        out.print("<th>" + rsmd.getColumnName(i) + "</th>");
                    }
            %>
        </tr>
        <%
                    while (rs.next()) {
        %>
        <tr>
            <%
                        for (int i = 1; i <= columnCount; i++) {
                            out.print("<td>" + rs.getString(i) + "</td>");
                        }
            %>
        </tr>
        <%
                    }
                }
        %>
    </table>
</body>
</html>
