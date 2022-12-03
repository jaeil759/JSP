<%@page import="ch18.com.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardList");
	%>
	<c:set value = "<%=boardList %>" var = "list"/>
	<table border = "1" width = "100%" height = "100%">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test = "${empty list }">
				<tr>
					<td colspan = "5">조회하실 게시글이 존재하지 않습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items = "${list }" var = "boardVO">
					<tr>
						<td>${boardVO.b_no }</td>
               			<td>${boardVO.b_title }</td>
               			<td>${boardVO.b_writer }</td>
			            <td>${boardVO.b_date }</td>
			            <td>${boardVO.b_hit }</td>
			       </tr>
			       </c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>