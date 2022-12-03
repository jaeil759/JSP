<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkLogin(){
	var form = document.loginForm;
	//아이디가 입력되었는지 검사한다
	// 아이디가 입력되지 않으면 오류 메세지를 출력하고 해당 입력 항ㅁ고에 커서가 놓인다
	if(form.id.value ==""){
		alert("아이디를 입력해주세요");
		form.id.focus();
		return false;
		
	// 비밀번호가 입력되었는지 검사한다
	// 비밀번호가 입력되지 않으면 오류 메세지를 출력하고 해당 입력 항목에 커서가 놓인다.
	}else if(form.pw.value == ""){
		alert("비밀번호를 입력해주세요")
		form.pw.focus();
		return false;
		
	}
	form.submit();
}
</script>
<body>
	<form action = "validation_process.jsp" name = "loginForm" method = "post">
	<p> 아이디 : <input type = "text" name = "id"></p>
	<p> 비밀번호 : <input type = "text" name = "pw"></p>
	<p><input type = "submit" value = "전송" onclick="checkLogin()"></p>
	</form>
</body>
</html>