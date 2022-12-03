<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 출력 버퍼 크기를 16kb로 설정하기 위해 page 디렉티브 태그의 buffer 속성을 작성 -->
	<%@ page buffer="16kb" %>
	Today is <%=new java.util.Date() %>
</body>
</html>