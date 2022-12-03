<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
   
<%@ include file = "../dbconn.jsp"%>

<%
	String sql = "DELETE FROM MEMBER WHERE M_ID = ?"; 
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	int status = pstmt.executeUpdate();
	
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
    
    if(status > 0){
    	session.invalidate();
    	response.sendRedirect("resultMember.jsp");
    }
%>
