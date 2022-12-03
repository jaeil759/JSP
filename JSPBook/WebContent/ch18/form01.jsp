<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/JSPBook/ch18/insert.do" method="post">
   <p>제목 <input type="text" name="title"></p>
   <p>내용 <input type="text" name="content"></p>
   <p>작성자 <input type="text" name="writer"></p>
   <input type="submit" value="전송"/>
</form>
</body>
</html>