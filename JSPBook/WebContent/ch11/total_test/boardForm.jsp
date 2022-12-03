<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<!-- 
	게시판 FORM 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 
	작성자 : 
	내용 :
	─────────────────────────────
	등록 목록
	
	1) 등록 버튼을 클릭 시, 게시글 등록을 진행해주세요.
		등록을 위해 이동할 페이지(boardInsert.jsp)로 이동해서 등록 처리를 진행해주세요.
		등록이 완료되었다면 현재 등록된 상세정보 페이지(boardView)로 이동해주세요.
		
		(정규식)
		등록 시, 제목은 최소 모든 문자 5자에서 최대 30자까지로 설정가능하게 해주세요.
		작성자는 영소대문자, 한글만 가능하게 설정해주세요. 
		
	2) 목록 버튼을 클릭 시, 게시판 목록 페이지로 이동해주세요(boardList.jsp)

 -->
 <%@ include file = "menu.jsp" %>
 
 <script>
 	function addBoard(){
		var form = document.boardFrm;
		var title = form.title.value;
		var writer = form.writer.value;
		var writerExp = /^[a-zA-Zㄱ-힣]*$/;
		if(title.length < 5 || title.length > 30){
			alert("제목은 최소 모든 문자 5자에서 최대 30자까지!!");
			form.title.focus();
			return;
		}
		if(!writerExp.test(writer)){
			alert("작성자는 영소대문자, 한글만 가능!");
			form.writer.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>

<form action="boardInsert.jsp" method="post" name="boardFrm">
<br><br>
	<p>게시글 등록</p>
	<hr/>
	<p>제목 : <input type="text" name="title"/></p>
	<p>작성자 : <input type="text" name="writer"/></p>
	<p>내용 : <input type="text" name="content"/></p>
	<hr/>
	<input type="button" value="등록" onclick="addBoard()">
	<input type="button" value="목록" onclick="location.href='boardList.jsp'"/>
</form>


</body>
<%@ include file = "footer.jsp" %>
</html>