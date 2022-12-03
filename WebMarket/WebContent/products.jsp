<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
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
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품목록</h1>
		</div>
	</div>
	
	<div class = "container">
		<div class = "row" align = "center">
		<%@ include file = "dbconn.jsp" %>
			<%
				String sql = "SELECT * FROM PRODUCT";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
	
			<div class = "col-md-4">
				<img src = "./resources/images/<%=rs.getString("P_FILENAME") %>" style = "width:100%"/>
				<h3><%= rs.getString("P_NAME") %></h3>	
				<p><%= rs.getString("P_DESCRIPTION") %></p>
				<p><%= rs.getString("P_UNITPRICE") %></p>
				<p><a href = "./product.jsp?id=<%=rs.getString("P_ID") %>" class = "btn btn-secondary" role = "button"> 상세정보&raquo;</a>
				</p>
			</div>
			<%
			}
			  	if(rs != null) rs.close();
		      	if(pstmt != null) pstmt.close();
		      	if(conn != null) conn.close();
			%>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>