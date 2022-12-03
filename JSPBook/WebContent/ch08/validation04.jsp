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
	function checkLogin(){
		
		var form = document.loginForm;
		if(form.id.value.length > 0){
			for(i = 0; i < form.id.value.length; i++){
				// 내가 만약에 adminid 라고 입력하게되면 
				// a d m i n i d 로 하나씩 쪼개서 ch에 담긴다
				var ch = form.id.value.charAt(i);
				
				if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')){
					alert("아이디는 영문 소문자로만 입력 가능 합니다.");
					form.id.select();
					return;	
				}
			}
		}else{
			alert("아이디를 입력해주세요");
			form.id.select();
			return;
		}
		if(isNaN(form.pw.value)){
			alert("비밀번호는 숫자로만 입력 가능합니다");
			form.pw.select();
			return;
		}
		form.submit();
	}
</script>
<body>
	<p> JavScript 버전</p>
	<form action = "validation04_process.jsp" name = "loginForm" method = "POST">
		<p>아이디 : <input type = "text" name = "id"/></p>
		<p>비밀번호 : <input type = "text" name = "pw"/></p>
		<p><input type = "button" value = "전송" onclick="checkLogin()"></p>
	</form>
	<hr>
<p> jQuery 버전</p>
	<form action = "validation04_process.jsp" name = "loginForm2" id = "loginForm2">
		<p>아이디 : <input type = "text" name = "id2" id = "id2"/></p>
		<p>비밀번호 : <input type = "text" name = "pw2" id = "pw2"/></p>
		<p><input type = "button" value = "전송" id = "loginBtn"></p>
	</form>
	<hr>
</body>
</html>