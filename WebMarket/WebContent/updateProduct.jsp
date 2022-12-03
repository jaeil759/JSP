<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<title>상품 수정</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>	
	<%@ include file = "dbconn.jsp" %>
	
	<%
		String productId = request.getParameter("id");
		String sql = "SELECT * FROM PRODUCT WHERE P_ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class = "row">
			<div class = "col-md-5">
				<img src = "./resources/images/<%=rs.getString("P_FILENAME") %>" alt = "image" style = "width:100%">
			</div>
			<div class = "col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype = "multipart/form-data">
				<input type = "hidden" name = "productId" value = "<%=rs.getString("P_ID") %>"/>
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" id = "productId" class="form-control" value = '<%=rs.getString("P_ID") %>' disabled = "disabled">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="name" id = "name" class="form-control" value = '<%=rs.getString("P_NAME") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id = "unitPrice" class="form-control" value = '<%=rs.getString("P_UNITPRICE") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-3">
					<textarea name="description" cols="50" rows="2" class="form-control" ><%=rs.getString("P_DESCRIPTION") %></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value = '<%=rs.getString("P_MANUFACTURER") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value = '<%=rs.getString("P_CATEGORY") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id = "unitInStock" class="form-control" value = '<%=rs.getString("P_UNITSINSTOCK") %>'>
				</div>
			</div>
			<div class="form-group row">
				<c:set value = '<%=rs.getString("P_CONDITION") %>' var = "condition"/>
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
                     <input type="radio" name="condition" value="New"<c:if test="${condition.equals('New') }"><c:out value="checked"/></c:if> > 신규 제품
                     <input type="radio" name="condition" value="Old"<c:if test="${condition.equals('Old') }"><c:out value="checked"/></c:if>> 중고 제품
                     <input type="radio" name="condition" value="Refurbished"<c:if test="${condition.equals('Refurbished') }"><c:out value="checked"/></c:if>> 재생 제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="fileName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정">
					<a class = "btn btn-info" href = "./products.jsp">목록</a>
				</div>
			</div>
		</form>
			</div>
		</div>
		
	</div>
	<%
		}
		if(rs != null) rs.close();
      	if(pstmt != null) pstmt.close();
      	if(conn != null) conn.close();
	%>
</body>
</html>







