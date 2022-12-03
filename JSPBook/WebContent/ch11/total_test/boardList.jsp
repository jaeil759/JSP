<%@page import="dto.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>

</head>
<body>
<%@ include file = "menu.jsp" %>
<%
	BoardRepository BoardDAO = BoardRepository.getInstance();
	ArrayList<BoardVO> listOfBoard = BoardDAO.getBoardList();
	request.setAttribute("listOfBoard", listOfBoard);
%>
<table border="1px">
<c:choose>
	<c:when test = "${listOfBoard == 'null' }">
		조회하실 게시글이 존재하지 않습니다.
	</c:when>
	<c:otherwise>
	<%
		for(BoardVO boardvo:listOfBoard){
			pageContext.setAttribute("boardvo", boardvo);
		}	
	%>
	<c:forEach items = "${listOfBoard }" var = "boardlist" begin ="0" step = "1" end = "${listOfBoard.size() }">
	<tr>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<tr>
		<td><a href="boardView.jsp?id=${board.bo_id }">${boardlist.bo_title }</a></td>
		<td>${boardlist.bo_writer }</td>
		<td>${boardlist.bo_date }</td>
		<td>${boardlist.bo_hit }</td>
	</tr>
	</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<input type = "button" value = "게시글 등록하기" onclick = "location.href='boardForm.jsp'">
<!-- 
	1. 게시판 리스트를 table로 만들어서 출력해주세요.
		- boardList.jsp 페이지에다 만들어주세요
		- 넘겨받은 리스트 데이터를 코어태그를 이용하여 출력해주세요.
		  > c:set 리스트 저장 후 사용
		  > c:choose, c:when, c:otherwise
		  > c:forEach
		
		** 초반 데이터는 없습니다.
					제목						작성자		작성일			조회수
	─────────────────────────────────────────────────────────────────────────────
						조회하실 게시글이 존재하지 않습니다.
	─────────────────────────────────────────────────────────────────────────────						
		
	
		** 데이터가 있는 경우 아래와 같이 출력됩니다.
				제목						작성자		작성일			조회수
	─────────────────────────────────────────────────────────────────────────────
		게시판 제목입니다......! 1			허나훔		2022-12-12		1245
		게시판 제목입니다......! 2			송서영		2022-12-12		1245
		게시판 제목입니다......! 3			채진영		2022-12-12		1245
		게시판 제목입니다......! 4			배영호		2022-12-12		1245
		게시판 제목입니다......! 5			조은혁		2022-12-12		1245
		게시판 제목입니다......! 6			조현수		2022-12-12		1245
		.....
	─────────────────────────────────────────────────────────────────────────────
	 게시글 등록하기
	 
	2. 등록하기 버튼을 누르면 시큐리티에 의해 보호자원으로 설정되어 있습니다.
		해당 게시글 등록하기는 역할명 admin의 username "administrator" password "a0011" 로 설정해주세요
		그리고 admin 역할명에 해당하는 역할 계정이 아니고서는 접근 불가능하게 해주세요.
		
	3. 게시판 리스트에서 내가 조회할 게시글 하나를 클릭 시, 게시판 상세보기 페이지로 이동합니다.
		- boardView.jsp 로 이동				
 -->
</body>
<%@ include file = "footer.jsp" %>
</html>