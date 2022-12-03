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
<table width = "300px" border="1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
	</tr>
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "SELECT * from MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
		while(rs.next()){
			String id = rs.getString("MEM_ID");
			String pw = rs.getString("MEM_Pw");
			String name = rs.getString("MEM_NAME");
	%>
		
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
		</tr>
		<%
		}
		}catch(SQLException e){
			out.println("MEMBER테이블 호출이 실패하였습니다.<br/>");
			out.println("SQLExceptuion : " + e.getMessage());
		}finally{
			if(rs !=null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
		%>
</table>
</body>
</html>