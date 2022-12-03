<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>String Tag</title>
</head>
<body> 
	<%!
		// 전역 메소드 makeItLower()를 언언하기 위해 선언문 태그를 작성
		String makeItLower(String data){
		return data.toLowerCase();
	}
	
	%>
	<% 
		// println() 메소드로 makeItLower() 메소드를  호출하여 내용을 출력하도록 스크립플릿 태그를 작성합니다
		// println() 메소드는 선언문 태그에 선언된 
		out.println(makeItLower("HEllo world"));
	%>
</body>
</html>