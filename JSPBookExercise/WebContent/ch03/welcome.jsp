<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%@ include file = "menu.jsp" %>
		<%!
		String greeting = "도서 웹 쇼핑몰";
		%>
		<div class = "jumbotron">
			<div class=  "container">
				   <div class = "text-center">
						<h1 class = "container">
					<%=greeting %>
				</h1>
				</div>
			</div>
		</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>