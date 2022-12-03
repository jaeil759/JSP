<%@page import="java.util.Date"%>
<%@page import="sun.util.calendar.CalendarSystem"%>
<%@page import = "java.util.Calendar"  %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
<!-- 현재 날짜를 출력하도록 표현문 태그를 작성함 -->
	<%-- <p> Current Time : <%=  %></p> --%>
	
	
	Current Time : <%= java.util.Calendar.getInstance().getTime() %>
	
	
	<%	Calendar cal=Calendar.getInstance();	
	Date now=new Date();%>
	오늘은 	
	<%= cal.get(Calendar.YEAR)%>
	년	
	<%= cal.get(Calendar.MONTH)+1%>
	월	
	<%= cal.get(Calendar.DATE)%>일입니다.
	현재시각: <%=now%>
</body>
</html>