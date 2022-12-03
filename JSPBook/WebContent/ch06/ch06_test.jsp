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
		1) ch06_test.jsp에 
		아이디, 비밀번호, 이름, 연락처, 성별, 취미, 소개를 입력하는 폼을 작성하세요
		아이디  		name = mem_id
		비밀번호 		name = mem_pw
		이름			name = mem_name
		연락처		name = mem_phone1, mem_phone2, mem_phone3
				[첫번째] 010, 011, 016, 017, 019, select 이용
				[두번째] type text size = 4
				[세번째] type text size = 4
		성별			name = mem_sex
				남자,여자
		취미			name = mem_hobby
				독서, 운동 음악감상 여행 영화감상
		소개	
				textarea 이용
				cols, row 자유롭게
				버튼은 submit, reset 작성
				submit 버튼은 전송하기로 생성
				reset 버튼은 취소하기로 생성
		2) ch06_text_process.jsp로 입력한 데이터를 전송해주세요
	--> 	
	<h3> 입력하든가 말든가 </h3>
	<form action = "ch06_test_process.jsp" name = "member" method = "post">
		<p>아이디 : <input type = "text" name = "mem_id" ></p>
		<p>비밀번호 : <input type = "password" name = "mem_pw" ></p>
		<p>이름 : <input type = "text" name = "mem_name" ></p>
		<p>연락처 : 
		<select name = "mem_phone1">
			<option>010</option>	
			<option>011</option>
			<option>016</option>
			<option>017</option>
			<option>019</option>
		</select>
		-<input type = "text" maxlength = "4" size = "4" name = "mem_phone2" >
		-<input type = "text" maxlength = "4" size = "4" name = "mem_phone3" >
		</p>
		<p>성별 : <input type = "radio" name = "mem_sex" value = "남성"/>남성
				<input type = "radio" name = "mem_sex" value = "여성"/>여성 
		</p>
		<p>취미 : 독서<input type = "checkbox" name = "mem_hobby" checked = "checked" value = "독서"/>
		 운동<input type = "checkbox" name = "mem_hobby" checked = "checked" value = "운동"/>
		 영화<input type = "checkbox" name = "mem_hobby" checked = "checked" value = "영화"/>
		</p>
		<textarea rows = "3" cols = "30" name = "mem_comment" placeholder="가입인사를 남겨주세요"></textarea>
		<p>
			<input type = "submit" value = "가입하기"/>
			<input type = "reset" value = "초기화"/>
		</p>
			
	</form>
	
	
	
	
	
</body>
</html>