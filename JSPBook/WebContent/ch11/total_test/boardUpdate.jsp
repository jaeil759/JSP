<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.BoardVO"%>
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
	수정할 게시글 정보를 넘겨받고, 수정을 진행해주세요.
	수정이 실패하여 에러가 발생 할 경우, exceptionBoard_error.jsp 페이지로 이동할 수 있게 해주세요.
	
	수정 완료 후, 수정이 완료 된 게시판 상세보기 페이지(boardView.jsp)로 이동해주세요.
 -->
 
 <%
	request.setCharacterEncoding("utf-8");
 		
	BoardRepository dao = BoardRepository.getInstance();
	String id = request.getParameter("id");
	String bo_title = request.getParameter("title");
	String bo_writer = request.getParameter("writer");
	String bo_content = request.getParameter("content");
	Date date = new Date();
	SimpleDateFormat dtf = new SimpleDateFormat("yy-MM-dd");
	String bo_date = dtf.format(date);
	
	BoardVO board = dao.getBoardById(id);
	board.setBo_title(bo_title);
	board.setBo_content(bo_content);
	board.setBo_writer(bo_writer);
	board.setBo_date(bo_date);
	
	response.sendRedirect("boardView.jsp?id=" + id);
 	
%>
</body>
</html>