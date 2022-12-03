<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../dbconn.jsp" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	String sql = "SELECT * FROM MEMBER WHERE M_ID = ? and M_PASSWORD = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	rs = pstmt.executeQuery();
	
	if(rs !=null){
		if(rs.next()){
			String mem_id = rs.getString("M_ID");
			session.setAttribute("sessionId", id);
			response.sendRedirect("resultMember.jsp?msg=2");
		}else{
			response.sendRedirect("loginMember.jsp?error=1");
			
		}
	}else{
		response.sendRedirect("loginMember.jsp?error=1");	
	}
%>