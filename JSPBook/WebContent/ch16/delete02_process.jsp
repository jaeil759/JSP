<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>

<%
   request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("name");
   
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   
   try{
	   String sql = "SELECT MEM_NO, MEM_ID, MEM_PW, MEM_NAME FROM MEMBER WHERE MEM_ID='"+id+"'";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1,id);
	   rs = pstmt.executeQuery();
	   if(rs.next()){
		   String rId = rs.getString("MEM_ID");
		   String rPw = rs.getString("MEM_PW");
		   if(id.equals(rId) && pw.equals(rPw)){
			   sql = "DELETE FROM MEMBER WHERE MEM_ID = ? AND MEM_PW = ?";		   
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, id);
			  pstmt.setString(2, pw);
			  pstmt.executeUpdate();
			  out.println("MEMBER 테이블을 삭제했습니다.");
		   }else{
			   out.println("일치하는 비밀번호가 아닙니다");
		   }
	   }else{
		   out.println("MEMBER 테이블에 일치하는 아이디가 없습니다");
	   }
   }catch(SQLException e){
	   out.println("SQLException : " + e.getMessage());
   }finally{
	   if(rs != null) rs.close();
	      if(pstmt != null) pstmt.close();
	      if(conn != null) conn.close();
	   }
%>
</body>
</html>