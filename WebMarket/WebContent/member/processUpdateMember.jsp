<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");
	String birth = year + "/" + month + "/" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	
	Date currentDateTime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDateTime.getTime());
    java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDateTime.getTime());
	
	
	String sql = "UPDATE MEMBER SET M_PASSWORD = ?, M_NAME = ?, M_GENDER = ?, M_BIRTH = ?, M_MAIL = ?, M_PHONE = ?, M_ADDRESS = ?, M_DATE = SYSDATE WHERE M_ID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, password);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setString(4, birth);
	pstmt.setString(5, mail);
	pstmt.setString(6, phone);
	pstmt.setString(7, address);
	pstmt.setString(8, id);
	int status = pstmt.executeUpdate();
	
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
    
    if(status > 0 ){
    	response.sendRedirect("resultMember.jsp?msg=0");
    }
	
%>