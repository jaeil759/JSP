<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 서블릿 등록 및 LoginBean validation 설정에 따라 비밀번호가 admin인 경우 인증 성공 후, success.jsp 페이지로 이동한다. -->
	<form action="ControllerServlet" method="post">
   <p>아이디 <input type="text" name="id"></p>
   <p>비밀번호 <input type="text" name="pw"></p>
   <input type="submit" value="로그인"/>
</form>
</body>
</html>