<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>

<%
Enumeration e = request.getParameterNames();
while(e.hasMoreElements()){
	String name = (String)e.nextElement();
	out.println(name + " = " + request.getParameter(name));
}
%>

</body>
</html>