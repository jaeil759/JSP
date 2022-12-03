<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<%
		// 지역변수a, b 에 값을 저장되도록 스크립트를 ㄴ
		int a = 2;
		int b = 2;
		int sum = a+b;
		out.println("2 + 3 = " + sum);
	%>
	
	<hr/>
	<%
		a++;
		b++;
		sum = a+b;
		out.println("3 + 4 = " + sum);
		
	%>
</body>
</html>