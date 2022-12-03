<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품편집</title>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<script>
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니까?") == true){
			location.href = "./deleteProduct.jsp?id="+id;
		}else{
			return;
		}
	}
</script>
<%
	String edit = request.getParameter("edit");
%>
<body>
<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품편집</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				String sql = "SELECT * FROM PRODUCT";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("P_FILENAME")%>"
					style="width: 100%" />
				<h3><%=rs.getString("P_NAME")%></h3>
				<p><%=rs.getString("P_DESCRIPTION")%></p>
				<p><%=rs.getString("P_UNITPRICE")%></p>
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?id=<%=rs.getString("P_ID")%>"
						class="btn btn-success" role="button">수정&raquo;</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("P_ID")%>')"
						class="btn btn-danger" role="button">삭제&raquo;</a>
					<%
						}
					%>
				</p>
			</div>
			<%
				}
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			%>
		</div>
	</div>
</body>
</html>