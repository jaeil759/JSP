<%@page import="java.util.Enumeration"%>
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
		// 모든 헤더 이름을 가져오도록 request 내장객체의 getHeaderNames() 메소드를 작성하고
		// 이를 모두 저장하도록 Enumeration 객체 타입의 변수 en을 적용
			Enumeration en = request.getHeaderNames();
		// Enumeration 객체 타입의 변수 en의 hasMoreElements()메소드를 통해
		// 저장된 헤더이름이 있을 때까지 반복하도록 while문을 작성함
			while(en.hasMoreElements()){
				// 현재 헤더 이름을 가져오도록 Enumeration 객체 타입의 변수 en의 nextElement() 메소드를 작성함
				String headerName = (String) en.nextElement();
				// 설정된 헤더 이름의 값을 가져오도록 request 내장 객체의 getHeader() 메소드를 작성함
				String headerValue = request.getHeader(headerName);
			
		%>
		<!-- 현재 헤더 이름과 값을 출력하도록 표현문 태그를 작성함 -->
		<%=headerName %> : <%=headerValue %><br>
		<%
			}
		%>
</body>
</html>