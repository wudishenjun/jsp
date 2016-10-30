<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    %>
    <%@page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charest=utf-8");
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String liujia="jdbc:sqlserver://localhost:1433;DatabaseName=xs";
Connection conn=java.sql.DriverManager.getConnection(liujia,"sa","");
String sql="update student set name=?,sex=?,age=? where id=?";
PreparedStatement st=conn.prepareStatement(sql);

String id=request.getParameter("id");
String name=request.getParameter("name");
String sex=request.getParameter("sex");
String age=request.getParameter("age");
st.setInt(1,Integer.parseInt(id));
st.setString(2,name);
st.setString(3,sex);
st.setInt(4,Integer.parseInt(age));
int result=st.executeUpdate();
st.close();
conn.close();
%>
<hr>
数据修改成功
<%
response.sendRedirect("connectjsp");
session.setAttribute("into","修改成功");
%>

</body>
</html>