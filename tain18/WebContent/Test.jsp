<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>判断生活费</h1>
<c:set var="sc" scope="session" value="${1000}"/>
<c:if test="${sc<500}">
<h3>我是一个节约的好孩子</h3>
</c:if>
<c:if test="${sc>500 }">
<h3>我是一个节约的好土豪</h3>
</c:if>
<hr>
<h1>判断中下旬</h1>
<c:set var="zxx" scope="session" value="${10}"/>
<c:choose>
   <c:when test="${zxx>=10 }">
     这是上旬
   </c:when>
<c:when test="${zxx>10 && zxx<=20 }">
这是中旬
</c:when>
<c:otherwise>
这是下旬
</c:otherwise>
</c:choose>
<hr>
<h1>输出数组的所有值</h1>
<c:forEach var="i" begin="1" end="10">
<c:out value="${i}" />
</c:forEach>
<hr>
<h1>显示时间</h1>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="both" value="${now}" /></p>
</body>
</html>