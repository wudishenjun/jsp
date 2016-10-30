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
Statement st=conn.createStatement();
String id=request.getParameter("id");
String sql="select * from student where id="+id;
ResultSet rs=st.executeQuery(sql);
String name="";
String sex="";
int age=0;
while(rs.next()){
	name=rs.getString("name");
	sex=rs.getString("sex");
	age=rs.getInt("age");
}
%>
<form action="update.jsp" method="post">
    <p>学号：<input type="hidden" name="id" value='<%=id%>'></p>
    <p>姓名：<input type="text" name="name" value='<%=name%>'></p>
    <p>性别：<input type="text" name="sex" value='<%=sex%>'></p>
    <p>年龄：<input type="text" name="age" value='<%=age%>'></p>
    <p><input type="submit" value="提交"></p>
</form>


</body>
</html>