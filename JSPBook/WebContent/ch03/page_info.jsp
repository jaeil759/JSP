<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 웹페이지의 설명을 설정하기위해 page 디렉티브태그의 info속성을 작성 -->
	<%@ page info="Date 클래스를 이용한 날짜 출력하기" %>
	<!-- 현재 날짜를 출력하도록 표현문의  -->
	Today is <%= new java.util.Date() %>
</body>
</html>