<%@page import="ch18.com.model.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>로그인 성공했습니다.</p>
	<p>
	<%
		LoginBean loginBean = (LoginBean)request.getAttribute("bean");
		out.println("아이디 : " + loginBean.getId());
	%>
</body>
</html>