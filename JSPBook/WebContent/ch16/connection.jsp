<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	Connection conn = null;
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jspbook";
		String password = "java";
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		out.println("데이터베이스 연결이 성공적으로 이러어졌습니다.");
	}catch(SQLException e){
		out.println("데이터베이스 연결이 실패하였습니다.");
		out.println("SQLException : " + e.getMessage());
	}finally{
		if(conn!=null)
			conn.close();
	}
	
%>
</body>
</html>