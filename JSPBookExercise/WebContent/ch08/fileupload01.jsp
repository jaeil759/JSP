<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileupload01_process.jsp" method="post" enctype="multipart/form-data" name="fileForm">
		<p>이름 : <input type = "file" name = "filename"/></p>
		<p><input type = "submit" value = "파일올리기"/></p>
	</form>
</body>
</html>