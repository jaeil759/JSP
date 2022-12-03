<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<script>
function check(){
	if(continuous()){
		alert("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
		return false;
	}
	if(document.frm.passwd.value != document.frm.passwd2.value){
		alert("비밀번호 확인이 일치하지 않습니다.");
		return false;
	}
	return true;
}  

function continuous(){
	var pass = document.frm.passwd.value;
	
	for(var i=0; i<pass.length-3; i++){
		if(pass.charAt(i+1) == (pass.charAt(i)+pass.charAt(i+2))/2){
			return false;
		}
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