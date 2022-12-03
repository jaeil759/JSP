<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "loginForm_process.jsp">
		<p> 이름 : <input type = "text" name = "id"/></p>
		<p> 비밀번호 : <input type = "text" name = "passwd"></p>
		<input type = "submit" value = "전송"/>
	</form>
</body>
</html>