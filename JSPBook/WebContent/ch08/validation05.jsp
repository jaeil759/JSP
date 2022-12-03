<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkMember(){
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	
	var regExpName = /^[가-힣]*$/;
	
	var regExpPw = /^[0-9]*$/;
	
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	// 이메일 형태인지, 검사하도록 정규 표현식 작성
	// 처음 시작이 숫자, 영소문자이고 특수문자-_\. 나올수도 있고 안나올수도 있고
	// 그 다음에 숫자, 영소문자가 0개 이상이 나온다. 그리고 @가 나옴
	// \.은 특수문자 .을 표현하기 위해 이스케이프로 .이 반드시
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var form = document.Member;
	var id = form.id.value;
	var name =form.name.value;
	var pw = form.pw.value;
	var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
	var email = form.email.value;
	
	if(!regExpId.test(id)){
		console.log(regExpId.test(id));
		alert("아이디는 문자로 시작해 주세요!");
		form.id.select();
		return;
	}
	if(!regExpId.test(name)){
		console.log(regExpId.test(name));
		alert("이름은 한글로만 입력해 주세요");
		form.name.select();
		return;
	}
	if(!regExpPhone.test(phone)){
		console.log(regExpId.test(phone));
		alert("연락처 입력을 확인해 주세요");
		form.phone.select();
		return;
	}
	if(!regExpId.test(email)){
		console.log(regExpId.test(email));
		alert("이메일 입력을 확인해  주세요");
		form.email.select();
		return;
	}
	form.submit();
}
</script>
<body>
	<h3>회원가입</h3>
	<form action = "validation05_process.jsp" method = "post" name = "Member">
		<p>아이디 : <input type = "text" name = "id"/></p>
		<p>비밀번호 : <input type = "text" name = "pw"/></p>
		<p>이름 : <input type = "text" name = "name"/></p>
		<p>
			연락처 : 
				<select name = "phone1">
					<option value = "010">010</option>
					<option value = "011">011</option>
					<option value = "016">016</option>
					<option value = "017">017</option>
					<option value = "019">019</option>
				</select>
				<input type = "text" maxlength = "4" size = "4" name = "phone2"/>
				<input type = "text" maxlength = "4" size = "4" name = "phone3"/>
		</p>
		<p>이메일 : <input type = "text" name = "email"/></p>
		<p><input type = "button" value = "가입하기" onclick = "checkMember()"></p>	
	</form>
</body>
</html>