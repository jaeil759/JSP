<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "exceptionNoProcudtId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<script>
function addToCart(){
	if(confirm("상품을 장바구니 추가하시겠습니까?")){
		document.addForm.submit();
}else{
		document.addform.reset();
	}
}
</script>
<body>
	<%@ include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품정보</h1>
		</div>
	</div>
	<%@ include file = "dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
		String sql = "SELECT * FROM PRODUCT WHERE P_ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
		
	%>	
	<div class = "container">
		<div class = "row">
		<div class = "col-md-5">
			<img src = "./resources/images/<%=rs.getString("P_FILENAME") %>" style = "width:100%"/>
		</div>
			<div class = "com-mb-6">
				<h3><%=rs.getString("P_NAME") %></h3>
				<p><%=rs.getString("P_DESCRIPTION") %></p>
				<p><b>상품코드 : </b><span class = "badge badge-danger"><%=rs.getString("P_ID") %></span></p>
				<p><b>제조사 : </b><%=rs.getString("P_MANUFACTURER") %></p>
				<p><b>분류 : </b><%=rs.getString("P_CATEGORY") %></p>
				<p><b>재고 수 : </b><%=rs.getLong("P_UNITSINSTOCK") %></p>
				<h4><%=rs.getInt("P_UNITPRICE") %>원</h4>	
				
				<form name = "addForm" action = './addCart.jsp?id=<%=rs.getString("P_ID") %>' method = "post">
				   <a href = "#" class = "btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
				   <a href = "./cart.jsp" class = "btn btn-info">장바구니 &raquo;</a>
				   <a href = "./products.jsp" class = "btn btn-secondary">상품 목록&raquo;</a>
				</form>
				   
			</div>
		</div>
		<hr/>
	</div>
	  <%
      }
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close();
      if(conn != null) conn.close();
   %>
   <%@ include file = "footer.jsp" %>
</body>
</html>