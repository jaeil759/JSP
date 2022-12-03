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
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("id");
		String mem_pw = request.getParameter("pw");
		
	%>
	<p>아이디 : <% out.println(mem_id); %></p>
	<p>비밀번호 : <%out.println(mem_pw); %></p>
</body>
</html>