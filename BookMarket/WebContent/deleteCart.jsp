<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	if(id == null || id.equals("")){
		response.sendRedirect("cart.jsp");
		return;
	}
	session.invalidate();
	response.sendRedirect("cart.jsp");
%>