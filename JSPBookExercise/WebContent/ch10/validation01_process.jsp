<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>입력에 성공하셨습니다.</h3>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		// 자바스크립트 폼에서 넘어온 데이터
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
	%>
	<p> 아이디 : <%=id %> </p>
	<p> 비밀번호 : <%=pw %></p>
	<br/>
</body>
</html>