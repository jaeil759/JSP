<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	공지사항 게시판을 만들어주세요.
	JDBC를 이용하여 CRUD를 진행해주세요.
	
	NOTICE 테이블을 작성해주세요.
	BO_NO NUMBER(8) NOT NULL PK
	BO_TITLE VARCHAR2(150) NOT NULL
	BO_CONTENT VARCHAR2(2000) NOT NULL
	BO_WRITER VARCHAR2(150) NOT NULL
	BO_DATE DATE NOT NULL
	BO_HIT NUMBER(8) NOT NULL
	
	SEQUENCE SEQ_NOTICE 1부터 시작, 1씩 증가, CACHE 사용안함
	
	공지사항 게시판 리스트를 만들어주세요.
	
		번호		제목			작성자	작성일		조회수
	────────────────────────────────────────────────────────────
		1		제목입니다11111		ADMIN	2022-12-12		1
		...
	────────────────────────────────────────────────────────────	
	등록
	
 -->
 <%@ include file = "../dbconn.jsp" %>
 	<table border = "1px">
 		<tr>
 			<td>번호</td>
 			<td>제목</td>
 			<td>작성자</td>
 			<td>작성일</td>
 			<td>조회수</td>
 		</tr>
 		<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "SELECT * from NOTICE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
		while(rs.next()){
			String bo_no = rs.getString("BO_NO");
			String bo_title = rs.getString("BO_TITLE");
			String bo_writer = rs.getString("BO_WRITER");
			String bo_date = rs.getString("BO_DATE");
			String bo_hit = rs.getString("BO_HIT");
	%>
		
		<tr>
			<td><%=bo_no %></td>
			<td><a href="detail.jsp?no=<%=bo_no %>"><%=bo_title %></a></td>
			<td><%=bo_writer %></td>
			<td><%=bo_date %></td>
			<td><%=bo_hit %></td>
		</tr>
		<%
		}
		}catch(SQLException e){
			out.println("NOTICE테이블 호출이 실패하였습니다.<br/>");
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