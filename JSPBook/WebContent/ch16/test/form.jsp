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
	제목, 내용, 작성자를 입력하고 게시글을 등록해주세요.
	날짜는 오늘 날짜가 자동으로 들어가도록 해주세요.
	조회수는 기본 0이 들어갑니다.
	게시글 번호는 시퀀스가 1씩 증가하여 들어갑니다.
	
	제목 : 
	내용 : 
	작성자 : 
	
	등록  목록	
 -->
 	<form action = "insert_process.jsp" method = "post">
 		<p>제목 : <input type = "text" name = "title"/></p>
 		<p>내용 : <input type = "text" name = "content"/></p>
 		<p>작성자 : <input type = "text" name = "writer"/></p>
 		<p><input type = "submit" value = "전송"/></p>
 		<a href = "list.jsp">등록목록</a>
 	
 	</form>
</body>
</html>