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
<%
String id = request.getParameter("id");
String pw = request.getParameter("passwd");

if(id.equals("admin") && pw.equals("admin1234")){
%>
<p> 로그인 성공
<%
}else{
%>
<p> 로그인 실패
<%
}
%>
		
</body>
</html>