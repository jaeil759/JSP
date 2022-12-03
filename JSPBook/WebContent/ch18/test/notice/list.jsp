<%@page import="ch18.com.model.NoticeVO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<script>
function showNewsDiv() {
		document.getElementById("newsDiv").style.display = 'block';
	}
	function hideNewsDiv() {
		document.getElementById("newsDiv").style.display = 'none';
	}
	
	function requestNews() {
		
		//sendRequest('08.newsTitlesJSON.jsp', null, responseNews, 'GET');
		var ajaxRequest=new com.itwill.AjaxRequest('08.newsTitlesJSON.jsp',
						null, 
						responseNews, 
						'GET');
		ajaxRequest.sendRequest();
		
	}
	/*
	function responseNewsData(data) {
		console.log(data);
	}
	*/
	function responseNews(xhr,msg) {
		
		console.log("----->"+ xhr+","+msg);
		if (xhr.readyState == 4) {
			var jsonStr = xhr.responseText;
			var jsonObject = JSON.parse(jsonStr);
			/*
			{
			"count": 9,
			"data": [
						{
							"newsTitle": "참으로 수고 많으셨습니다…",
							"company": "연합뉴스",
							"date": "2020. 3. 16 오후 12:14:43"
						},
						{
							"newsTitle": "IS 60개국 테러 위협 영상 공개…한국도 포함 포토",
							"company": "SBS뉴스",
							"date": "2020. 3. 16 오후 12:14:43"
						}
					]
			}
			*/
			if(jsonObject.count == 0){
				return;
			}
			var newsJsonArray =  jsonObject.data;
			var html="<ul>";
			for (var i = 0; i < newsJsonArray.length; i++) {
				var newsJsonObject = newsJsonArray[i];
				/*
				{
							"newsTitle": "참으로 수고 많으셨습니다…",
							"company": "연합뉴스",
							"date": "2020. 3. 16 오후 12:14:43"
				}
				*/
				var titleStr = newsJsonObject.newsTitle;
				var companyStr = newsJsonObject.company;
				var dateStr = newsJsonObject.date;
				html+="<li>"+titleStr+"["+companyStr+"("+dateStr+")]JSON</li>";
			}
			html += "</ul>";
			document.getElementById('newsDiv').innerHTML=html;
		}
	}
	window.onload = function() {
		setInterval(requestNews, 2000);
		//hideNewsDiv();
	};
</script>
<body>
<%
	ArrayList<NoticeVO> noticeList = (ArrayList<NoticeVO>)request.getAttribute("noticeList");
	System.out.println(noticeList);

%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">공지 게시판 목록</h1>
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
			
			<c:set value = "<%=noticeList %>" var = "list"/>
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<c:choose>
						<c:when test = "${empty list }">
							<tr>
								<td colspan = "5">조회하실 게시글이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items = "${list }" var = "noticeVO">
							<tr>
								<td>${noticeVO.bo_no }</td>
								<td>${noticeVO.bo_title }</td>
								<td>${noticeVO.bo_date }</td>
								<td>${noticeVO.bo_hit }</td>
								<td>${noticeVO.bo_writer }</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
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





