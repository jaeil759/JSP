<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">자유 게시판 목록</h1>
		</div>
	</div>
	<div class="container">
		<form action="" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 건	</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div align="left">
				<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>





