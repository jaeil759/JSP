<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<body>
<%@ include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h2 class =	"alert alert-danger">해당 제품이 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class = "container">
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %></p>
		<p><a href = "books.jsp" class = "btn btn-secondary">상품목록&raquo;</a></p>
	</div>
</body>
</html>