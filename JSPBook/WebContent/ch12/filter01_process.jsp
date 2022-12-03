<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");

%>
<p>filter01_process.jsp</p>
<p>입력된 name값 : <%=name %></p>
</body>
</html>