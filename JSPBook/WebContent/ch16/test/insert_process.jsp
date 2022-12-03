<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	Statement stmt = null;
	
	try{
		String sql = "INSERT INTO NOTICE("+
					 " BO_NO,BO_TITLE, BO_CONTENT, BO_WRITER, BO_DATE,BO_HIT" +
					 ") VALUES("+
							 "SEQ_NOTICE.NEXTVAL, '"+ title + "', '" + content + "', '" + writer + "',SYSDATE,0)";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		out.println("NOTICE테이블 삽입이 성공했습니다.");
		response.sendRedirect("list.jsp");
	}catch(SQLException e){
		out.println("NOTICE 테이블 삽입이 실패했습니다");
		out.println("SQLException : " + e.getMessage());
	}finally{
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
	
%>
	
</body>
</html>