<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- java.util.Date 패키지를 사용하기 위해 page 디렉티브 태그의 import 속성을 작성함  -->
	<%@ page import = "java.util.Date" %>
	Today is <%= new Date() %>
</body>
</html>