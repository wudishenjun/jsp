<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.sql.*,java.io.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据库连接页面</title>
</head>
<body>
<%
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=softwaer";
   Connection conn=java.sql.DriverManager.getConnection(connectSQL,"sa","133113");
   Statement stmt=conn.createStatement();
   ResultSet rs=stmt.executeQuery("select * from student");
   
   out.println("<table>");
   while(rs.next()){
	   out.println("<tr>");
	   out.println("<td>"+rs.getInt("id")+"<td>");
	   out.println("<td>"+rs.getString("name")+"<td>");
	   out.println("<td>"+rs.getInt("age")+"<td>");
	   out.println("<td>"+rs.getString("major")+"<td>");
	   out.println("<tr>");
   }
   out.println("</table>");
%>
<h1>按照年龄来查询:</h1>  
<%
   int age=Integer.parseInt(request.getParameter("age"));
   String sql="select * from student where age=?";
   PreparedStatement st=conn.prepareStatement(sql);
   st.setInt(1,age);
   rs=st.executeQuery();
  
  out.println("<table>");
  while(rs.next()){
	   out.println("<tr>");
	   out.println("<td>"+rs.getInt("id")+"<td>");
	   out.println("<td>"+rs.getString("name")+"<td>");
	   out.println("<td>"+rs.getInt("age")+"<td>");
	   out.println("<td>"+rs.getString("major")+"<td>");
	   out.println("<tr>");
  }
  out.println("</table>");
  
  rs.close();
  stmt.close();
  conn.close();
%>
</body>
</html>