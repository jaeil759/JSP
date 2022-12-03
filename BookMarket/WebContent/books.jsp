<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "menu.jsp" %>
<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품목록</h1>
		</div>
	</div>
	<%
		BookRepository bookDAO = BookRepository.getInstance();
		ArrayList<Book> listOfProducts = bookDAO.getAllBooks();
	%>
	
	
	
	<div class = "container">
		<div class = "row" align = "center">
		<!-- 상품 목록을 띄울 공간 -->
			<%
				for(int i = 0; i < listOfProducts.size(); i++){
							Book book = listOfProducts.get(i);
			%>
			<div class = "col-md-4">
				<img src = "./resources/images/<%=book.getFileName() %>" style = "width:100%"/>
				<h3><%= book.getName() %></h3>	
				<p><%= book.getDescription() %></p>
				<p><%= book.getUnitPrice() %></p>
				<p><a href = "./book.jsp?id=<%=book.getBookId() %>" class = "btn btn-secondary" role = "button"> 상세정보&raquo;</a>
				</p>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>