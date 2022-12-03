<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function check(){
		var str = /^(?=.*[a-zA-Z]{1,})(?=.*[!@#$%^*+=-]{1,})(?=.*[0-9]{1,}).{8,}$/;
		 if(!str.test(document.frm.passwd.value)){
			alert("영문+숫자+특수기호 8자리 이상으로 구성하여야합니다.");
			return false;
		} 
		return true;
	}
</script>
<body>
	<form action="validation01_process.jsp" name="frm">
	<p> 아이디 : <input type="text" name="id">
	<p> 비밀번호 : <input type="text" name="passwd">
	<p> 비밀번호 확인 : <input type="text" name="passwd2">
	<input type="submit" value="전송" onclick="return check();">
</form>
</body>
</html>