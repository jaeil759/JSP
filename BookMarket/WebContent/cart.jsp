<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<%
	String cartId = session.getId();
%>
<body>
	<%@ include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = display-3>장바구니</h1>
		</div>
	</div>
	<div class = "container">
		<div class = "row">
			<table width = "100%">
				<tr>
					<td align = "left">
						<a href = "./deleteCart.jsp?Id=<%=cartId %>" class = "btn btn-danger">삭제하기</a>
					</td>
					<td align = "right">
						<a href = "./shoppingInfo.jsp?cartId=<%=cartId %>" class = "btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		<div style = "padding-top:50px;">
			<table class = "table table-hover">
				<tr>
					<td>상품</td>
					<td>가격</td>
					<td>수량</td>
					<td>소계</td>
					<td>비고</td>
				</tr>
				<%
					int sum = 0;
				ArrayList<Book>cartList = (ArrayList<Book>)session.getAttribute("cartList");
				if(cartList == null){
					cartList = new ArrayList<Book>();
				}
				for(int i = 0; i <cartList.size(); i++){
					Book book = cartList.get(i);
					int total = book.getUnitPrice() * book.getQuantity();
					sum = sum+total;
				
				%>
				<tr>
					<td><%=book.getBookId() %>-<%=book.getName() %></td>
					<td><%=book.getUnitPrice() %></td>
					<td><%=book.getQuantity() %></td>
					<td><%=total %></td>
					<td><a href = "./removeCart.jsp?id=<%=book.getBookId() %>" class = "badge badge-danger">삭제</a></td>
				</tr>
				<%} %>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum %></th>
					<th></th>
				</tr>
			</table>
			<a href = "./books.jsp" class = "btn btn-secondary">&laquo; 쇼핑계속하기</a>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>