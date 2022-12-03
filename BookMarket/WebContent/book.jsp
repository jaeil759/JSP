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
<script>
	function addToCart(){
		if(confirm("상품을 장바구니 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<%@include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품정보</h1>
		</div>
	</div>
	<%
		// 상품 목록 페이지로부터 전달되는 상품 아이디를 전송 받도록 request 내장 객체의 getParameter() 메소드 작성
		String id = request.getParameter("id");
		BookRepository bookDAO = BookRepository.getInstance();
		Book book = bookDAO.getBookById(id);
	%>
	
	<div class = "container">
		<div class = "row">
		<div class = "col-md-5">
			<img src = "./resources/images/<%=book.getFileName() %>" style = "width:100%"/>
			</div>
			<div class = "com-mb-6">
				<h3><%=book.getName() %></h3>
				<p><b>도서코드 : </b><span class = "badge badge-danger"><%=book.getBookId() %></span></p>
				<p><b>출판사 : <%=book.getPublisher() %></b>
				<p><b>저자 : <%=book.getAuthor() %></b>
				<p><b>분류 : </b><%=book.getCategory() %></p>
				<p><b>재고 수 : </b><%=book.getUnitsInStock()%></p>
				<p><b>총 페이지 수 : <%=book.getTotalPages() %></b>
				<h4><%=book.getUnitPrice() %>원</h4>	
				   
				   <form name = "addForm" action = "./addBook.jsp?id=<%=book.getBookId() %>" method = "post">
				   <a href = "#" class = "btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
				   <a href = "./cart.jsp" class = "btn btn-info">장바구니 &raquo;</a>
				   <a href = "./books.jsp" class = "btn btn-secondary">상품 목록&raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>