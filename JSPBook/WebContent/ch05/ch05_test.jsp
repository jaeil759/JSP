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
      아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 입력받는 폼 양식을 구성하고
      ch05_test_process.jsp 로 method=post방식으로 전송해주세요
      
      입력양식 : input type = "text" 로 작성
      전송 방식 : post
      
      작성을 완료했으면, ch05_test_process.jsp로 넘어가 후처리를 작성하세요
    -->
    <form action = "ch05_test_process.jsp" method = "POST">
    	<p>아이디 : <input type = "text" name = "id"></p>
		<p>비밀번호 : <input type = "text" name = "pw"></p>
		<p>이름 : <input type = "text" name = "name"></p>
		<p>성별 : <input type = "text" name = "gender"></p>
		<p>핸드폰번호 : <input type = "text" name = "phone"></p>
		<p>주소 : <input type = "text" name = "addr"></p>
		<p><input type = "submit" value = "전송"></p>
    </form>
</body>
</html>