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
      out.println("현재날짜 : " + new java.util.Date());
	%>
	<br>
	<%
		double result = Math.pow(5, 2);
		out.println("5의 제곱은 : " + result);
        			
	%>
</body>
</html>