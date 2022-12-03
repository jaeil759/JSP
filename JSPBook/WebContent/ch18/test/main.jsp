<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>Board</title>
<script type="text/javascript">
	function clicklist(){
		location.href="notice/list.jsp";
	}
</script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">메인</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div align="left">
					<h5>공지사항 게시판</h5>
				</div>
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
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</form>
				<a href="#" onclick="javascript:clicklist()" class="btn btn-primary">&laquo;더보기</a>
			</div>
			<div class="col-md-6">
				<div align="left">
					<h5>자유 게시판</h5>
				</div>
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
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</form>
				<a href="#" onclick="" class="btn btn-primary">&laquo;더보기</a>
			</div>
		</div>
	</div>
</body>
</html>





