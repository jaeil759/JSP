<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
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
		String id=request.getParameter("id");
		BookRepository dao=BookRepository.getInstance();
		Book book=dao.getBookById(id);
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>[<%=book.getCategory()%>] <%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p><b>도서 코드:</b><span class="badge badge-danger">
				
				<%=book.getBookId() %></span>
				<p><b>출판사</b> : <%=book.getPublisher()%>
				<p><b>저자</b> : <%=book.getAuthor() %>
				<p><b>재고수</b> : <%=book.getUnitsInStock() %>
				<p><b>총 페이지수</b> : <%=book.getTotalPages() %>
				<p><b>출판일</b> : <%=book.getReleaseDate() %>
				<h4><%=book.getUnitPrice()%>원</h4>
				<p> <a href="#" class="btn btn-info"> 도서 주문&raquo</a>
				 <a href="./products.jsp" class="btn btn-secondary">도서 목록 &raquo</a>
			</div>
						
		</div> 
		<hr>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>