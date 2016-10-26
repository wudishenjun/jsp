<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据处理页面</title>
</head>
<body bgcolor="pink">
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=softwaer";
Connection conn=java.sql.DriverManager.getConnection(connectSQL,"sa","133113");
   
    //String sql="delete from student where id='2016202'";
    //Statement st=conn.cretateStatement(sql);
   String sql="insert into student values(?,?,?,?)";
   PreparedStatement st=conn.prepareStatement(sql);
   
   
   String id=request.getParameter("id");
   String name=request.getParameter("name");
   String age=request.getParameter("age");
   String major=request.getParameter("major");
   
   st.setInt(1,Integer.parseInt(id));
   st.setString(2,name);
   st.setInt(3,Integer.parseInt(age));
   st.setString(4,major);
   
   st.executeUpdate();
   
  System.out.println(st.toString());
   
   st.close();
   conn.close();
    %>
    <div><font size="3" color="red"><STRONG>用户信息删除完成</STRONG></font></div>
</body>
</html>