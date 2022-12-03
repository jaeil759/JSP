<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		response.setIntHeader("Refresh", 5);
		SimpleDateFormat sdf = new SimpleDateFormat("h:mm:ss a", Locale.ENGLISH);
	%>
	<p><%= sdf.format(java.util.Calendar.getInstance().getTime())%></p>
	<p><a href= "response_data.jsp"> Google홈페이지로 이동하기</a></p>
</body>
</html>	