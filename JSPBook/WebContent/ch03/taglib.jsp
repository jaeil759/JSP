<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive tag</title>
</head>
<body>
<!-- 변수 k 가 1부터 10까지 1씩증가하도록 JSTLcore 태그 -->
	<c:forEach var="k" begin="1" end="10" step="1">
		<c:out value="${k }"></c:out>
	</c:forEach>
	<hr/>
	<%
		String str = "스크립틀릿으로 선언한 개똥이";
	
		%>
	<%=str %>
	<br>
	<c:set var = "str" value = "core태그로 선언한 개똥이"> </c:set>
	<c:out value = "${str }"></c:out>
	<Br>
	<%
		List<String> list = new ArrayList<String>();
		list.add("개똥이");
		list.add("김철수");
		list.add("매뚜기");
	%>
	<!--  item <- Collection -->
	<!-- items는 list와 같은 반복문을 돌리기 위한 컬렉션 객체 변수가 들어간다. -->
	<c:forEach items="<%=list %>" var = "item">
	<p> ${item }</p>
	</c:forEach>
	<br/>
	
	<!-- 변수 k가 1부터 10까지 1씩 증가되도록 JSTL의 Core 태그 반복문 작성. 
		  단, 짝수일때만 호출 
		 for문과 동일
		  -->
	<c:forEach var="k" begin="1" end ="10" step="1">
		<c:if test="${k %2 == 0 }">
			<c:out value="${k }"></c:out>
		</c:if>
	</c:forEach>
	
	<!-- choose연습
		 scope(영역)
		 page : JSP 페이지 내애서만 공유(기본)
		 request : 같은 요청 내에서만 공유
		 session : 같은 웹 브라우저 내에서만 공유
		 application : 다른 웹 브라우저에서도 서로 공유
	 -->
	
	<c:set var = "money" value = "50000" scope="page"></c:set>
	<p>내가 가진 돈은 ${money }원 입니다.</p>
	<c:choose>
		<c:when test="${money <= 0 }">
			<p>무일푼</p>	
		</c:when>
			<c:when test="${money >= 5000 }">
				<p>커피 세잔의 여유 가능</p>
		</c:when>
		<c:otherwise>
			<p>밥먹자</p>
		</c:otherwise>
	</c:choose>
	
	
	<!-- 문제 풀어보기
	1) 리스트에 404호 반학생 이름을 모두 넣고 core 태그set 에 저장한 후 전체를 출력해주세요
	2) 전체출력을 4명씩 끊어서 출력해주세요
	3) 4명씩 끊어서 출력할때, 본인의 이름은 '본인'으로 출력해주세요 '본인' 글자 출력시, 굵은 글씨로 출력해주세요
	 -->
	 
<%-- 	<c:set var = "ddit404">김슬기,김진호,조현수,양지윤,조은혁,배영호,배지영,김혜진,김보미,박형기,송서영,채진영,김민지,전재한,조영현,허소영,최중호,인승주,남지현,오지형,허나훔,한상훈,정종은,고재일</c:set>
	
	<c:forEach var="item" items="${ddit404}" varStatus="idx">
		${idx.index}. ${item} <br />
	</c:forEach>  --%>

	<%
		List<String> dit404 = new ArrayList<String>();
		dit404.add("김슬기");
		dit404.add("김진호");
		dit404.add("조현수");
		dit404.add("양지윤");
		dit404.add("조은혁");
		dit404.add("배영호");
		dit404.add("배지영");
		dit404.add("김혜진");
		dit404.add("김보미");
		dit404.add("박형기");
		dit404.add("송서영");
		dit404.add("채진영");
		dit404.add("김민지");
		dit404.add("전재한");
		dit404.add("조영현");
		dit404.add("허소영");
		dit404.add("최중호");
		dit404.add("인승주");
		dit404.add("남지현");
		dit404.add("오지형");
		dit404.add("허나훔");
		dit404.add("한상훈");
		dit404.add("정종은");
		dit404.add("고재일");
	%>
	<c:set value = "<%=dit404 %>" var = "names"></c:set>
	<c:forEach begin="1" end = "24" step = "1" var="i">
		<c:if test="${names[i-1] == '고재일'}">
			<b><c:out value="본인"></c:out></b>
		</c:if>
		<c:if test = "${names[i-1] != '고재일' }">
			<c:out value="${names[i-1] }"></c:out>
		</c:if>
		<c:if test="${i % 4 == 0 }"><br></c:if>
	</c:forEach>
	
	
	<c:forEach items="<%=dit404 %>" var = "name" varStatus="stat">
		<c:if test="${name == '고재일'}">
			<span><b>본인</b></span>
		</c:if>
		<c:if test="${name != '고재일' }">
			<span>${name }</span>
		</c:if>
		<c:if test="${stat.count % 4 == 0 }">
			<br>
		</c:if>
		</c:forEach>
	
	<c:forEach items="${names }" var = "name" varStatus="stat">
		<p>count : ${stat.count }, index : ${stat.index }</p>	
	</c:forEach>
	
</body>
</html>