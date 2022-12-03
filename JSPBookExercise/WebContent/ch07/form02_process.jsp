<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        Enumeration em=request.getParameterNames();
        StringBuffer buffer = new StringBuffer();
        while(em.hasMoreElements())
        {
            String name=(String)em.nextElement();
            String pValue=request.getParameter(name);
            buffer.append(name+" : "+pValue + "<br>");
        }
        
    %>
</body>
</html>
