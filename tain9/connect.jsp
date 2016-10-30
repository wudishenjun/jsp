<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>妈的智障</title>
</head>
<body>
<%


Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=xs";
Connection conn=java.sql.DriverManager.getConnection(connectSQL,"sa","936726");
String id = (String)request.getParameter("学号");
String sql = "select * from xsda where 学号 = ?";
PreparedStatement st = conn.prepareStatement(sql);
st.setString(1,id);
ResultSet rs = st.executeQuery();

out.println("<table>");
while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString("id")+"<td>");
	out.println("<td>"+rs.getString("name")+"<td>");
	out.println("<td>"+rs.getString("sex")+"<td>");
	out.println("<td>"+rs.getString("age")+"<td>");
	out.println("<tr>");
}
out.println("</table>");
%>
<hr>
<%
session.getAttribute("into");
%>
</body>
</html>