<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<%! 
	
	//변수 data에 50을 저장하도록 선언 한 태그를 작성
	int data = 50; 
	%> 
	
	<% out.print("value of the vaiable is : " + data);
	
		// out 내장객체의 println() 메소드를 이용하여  내용을 출력하도록 스크립틀릿 태그를 작성합니다
	%>
</body>
</html>