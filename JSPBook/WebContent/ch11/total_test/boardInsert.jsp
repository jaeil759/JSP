<%@page import="dto.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.BoardRepository"%>
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
	넘겨받은 게시글 데이터를 이용하여 게시글 등록을 진행해주세요.
	등록이 실패하여 에러가 발생 할 경우, exceptionBoard_error.jsp 페이지로 이동할 수 있게 해주세요.
	
	등록이 완료되면 작성한 게시글 상세정보 페이지(boardView)로 이동해주세요.
	이동하여 새롭게 작성된 게시글 내용으로 상세정보 페이지를 보여주세요.
 -->
 <%
 	BoardRepository dao = BoardRepository.getInstance();
 	request.setCharacterEncoding("UTF-8");
 	
	String bo_title = request.getParameter("title");
	String bo_writer = request.getParameter("writer");
	String bo_content = request.getParameter("content");
	String bo_id = String.valueOf(dao.clickcount()); 
	Date date = new Date();
	SimpleDateFormat dtf = new SimpleDateFormat("yy-MM-dd");
	String bo_date = dtf.format(date);
	String bo_hit = "0";
	
	BoardVO newBoard = new BoardVO();
	newBoard.setBo_content(bo_content);
	newBoard.setBo_date(bo_date);
	newBoard.setBo_hit(bo_hit);
	newBoard.setBo_id(bo_id);
	newBoard.setBo_title(bo_title);
	newBoard.setBo_writer(bo_writer);
		
	dao.addBoard(newBoard);
	request.getRequestDispatcher("boardView.jsp?id="+bo_id).forward(request, response);
 %>
 
</body>
</html>