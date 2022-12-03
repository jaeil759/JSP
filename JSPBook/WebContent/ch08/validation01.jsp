<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(function(){
	var submitBtn = $("#submitBtn");
	
	// 방법 1
	/* submitBtn.on("click", CheckFormTojQuery); */
	
	// 방법2
	submitBtn.on("click",function(event){
		event.preventDefault();
		alert("아이디 : " + $("#id").val() + "\n" + "비밀번호 : " + $("#pw").val());
	});
	
	function CheckFormTojQuery(){
		alert("아이디 : " + $("#id").val() + "\n" + 
				"비밀번호 : " + $("#pw").val());
	}
	
});
// 방법 3
LoginForm2.submit(function(event){
   event.preventDefault();
   console.log('click 이벤트 발생[방법2]')
   alert("아이디 : " + $('#id').val() + "\n"
         + "비밀번호" + $('#pw').val());
});


	function CheckForm(){
		alert("아이디 : " + document.LoginForm.id.value + "\n" + 
				"비밀번호 : " + document.LoginForm.pw.value);
	}
</script>
<body>
<p> JavScript 버전</p>
	<form action = "" name = "LoginForm">
		<p>아이디 : <input type = "text" name = "id"/></p>
		<p>비밀번호 : <input type = "text" name = "pw"/></p>
		<p><input type = "submit" value = "전송" onclick="CheckForm()"></p>
	</form>
	<hr>
<p> jQuery 버전</p>
	<form action = "" name = "Loginform2" id = "LoginForm2">
		<p>아이디 : <input type = "text" name = "id" id = "id"/></p>
		<p>비밀번호 : <input type = "text" name = "pw" id = "pw"/></p>
		<p><input type = "submit" value = "전송" id = "submitBtn" onclick = "CheckFormTojQuery()"></p>
	</form>
	<hr>
</body>
</html>