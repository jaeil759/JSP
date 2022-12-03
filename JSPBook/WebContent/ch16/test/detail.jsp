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
	아래와 같이 출력하고, 수정 삭제 목록 기능을 작성해주세요.

	제목 : 제목입니다 1111
	내용 : 
	──────────────────────────────
	내용입니다 111111
	내용을 작성했습니다 11111
	──────────────────────────────
	작성자 : admin
	──────────────────────────────
	수정  삭제  목록
 -->
 <%@ include file = "../dbconn.jsp" %>
	<%
		String no = request.getParameter("no");
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "SELECT * from NOTICE where bo_no = '"+ no +"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
		while(rs.next()){
			String bo_no = rs.getString("BO_NO");
			String bo_title = rs.getString("BO_TITLE");
			String bo_content = rs.getString("BO_CONTENT");
			String bo_writer = rs.getString("BO_WRITER");
			String bo_date = rs.getString("BO_DATE");
			String bo_hit = rs.getString("BO_HIT");
	%>
		
		<h4>제목 :<%=bo_title %></h4>
		<p>내용 : </p>
		<hr>
		<p><%=bo_content %></p>
		<hr>
		<p>작성자 : <%=bo_writer %></p>
		<hr>
		<input type="button" value="수정" onclick="location.href='boardUpdateForm.jsp?id=<%=bo_no %>'"/>
		<input type="button" id="del"	 value="삭제" onclick="del()">
		<input type="button" value="목록" onclick="location.href='list.jsp'"/>
		
	<%-- 	<script>
	var delButton = document.querySelector('#del');
	delButton.addEventListener('click', del);
	
	function del(){
 		var flag = false;
		flag = confirm("삭제 ㄱ?")
		
		if(flag){
			location.href='boardRemove.jsp?id=<%=bo_no %>';	
			
		}
	}
</script> --%>
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
 		
</body>
</html>