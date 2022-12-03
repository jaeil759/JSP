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
	Cookie[] cookies = request.getCookies();
	cookies[0].setMaxAge(0);
	response.addCookie(cookies[0]);

	response.sendRedirect("cookie.jsp");
	%>
</body>
</html>