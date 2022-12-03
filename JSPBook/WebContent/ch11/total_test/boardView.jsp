<%@page import="dto.BoardVO"%>
<%@page import="dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	BoardRepository dao = BoardRepository.getInstance();
	request.setCharacterEncoding("utf-8");	
	String id = request.getParameter("id");
	
	BoardVO board = dao.getBoardById(id);
	String hit = board.getBo_hit();
	String newHit = String.valueOf((Integer.parseInt(hit) + 1));
	board.setBo_hit(newHit);
	boolean realflag = false;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var delButton = document.querySelector('#del');
	delButton.addEventListener('click', del);
	
	function del(){
 		var flag = false;
		flag = confirm("삭제 ㄱ?")
		
		if(flag){
			location.href='boardRemove.jsp?id=<%=id %>';	
			
		}
	}
	
</script>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<!-- 
	리스트에서 선택한 해당 게시글 1개의 데이터를 출력해주세요.
	넘겨받은 게시판 데이터 객체를 코어태그에 저장하고 코어 태그를 이용해서 출력해주세요.
	c:set, c:out 등등 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	수정 삭제 목록
	
	1) 수정 버튼을 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 넘어가서 수정을 진행 할 수 있도록 해주세요.
	
	2) 삭제 버튼을 클릭 시, "정말로 삭제하시겠습니까?" 라는 알림창이 뜨고 [확인]을 클릭 했을 때
	   삭제(boardRemove.jsp)를 진행해주세요. 삭제 후, 게시판 목록 페이지(boardList.jsp)로 이동해주세요.
	   
	3) 목록 버튼을 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요.
 -->
 
<%@ include file = "menu.jsp" %>
		<c:set value="<%= board %>" var="board"/>
		
	<h2>게시판 상세보기</h2>
		<hr/>
		<p>제목 : <c:out value="${board.bo_title }"/>
		<p>
		작성자 : <c:out value="${board.bo_writer }"/>
		작성일 : <c:out value="${board.bo_date }"/>
		조회수 : <c:out value="${board.bo_hit }"/>
		</p>
		<hr>
		<p>내용<br>
		<c:out value="${board.bo_content }"/></p>
		<hr>
		<br>
		<input type="button" value="수정" onclick="location.href='boardUpdateForm.jsp?id=${board.bo_id}'"/>
		<input type="button" id="del"	 value="삭제" onclick="del()">
		<input type="button" value="목록" onclick="location.href='boardList.jsp'"/>
</body>
<%@ include file = "footer.jsp" %>
</html>