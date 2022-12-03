<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "webmarket";
	String password = "java";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,password);
	}catch(SQLException e){
		out.println("데이터베이스 연결이 실패했습니다.");
		out.println("SQLException : " + e.getMessage());
	}

%>