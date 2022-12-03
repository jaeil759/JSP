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
	삭제할 게시글 정보를 넘겨받고, 삭제를 진행해주세요.
	삭제가 실패하여 에러가 발생 할 경우, exceptionBoard_error.jsp 페이지로 이동할 수 있게 해주세요.
	
	삭제 완료 후, 게시판 목록 페이지(boardList.jsp)로 이동해주세요.
 -->
 
 
 <%
	BoardRepository dao = BoardRepository.getInstance();
	String id = request.getParameter("id");
				
	BoardVO board = dao.getBoardById(id);

	boolean abc = dao.getBoardList().remove(board);
	if(abc){
		response.sendRedirect("boardList.jsp");
	}
%> 
</body>
</html>