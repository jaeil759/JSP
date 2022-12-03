<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 설정된 문자열 Hello,Java Server Page! 에서 공백 문자를 기준으로 문자열을 분리하도록 fn:split 태그를 작성합니다 -->
	<c:set var = "texts" value = "${fn:split('Hello, Java Server Pages!', ' ') }"/>
	<!-- 분리된 문자열 길이만큼 반복하여 분리된 문자열을 출력하도록 작성합니다 -->
	<c:forEach var = "i" begin = "0" end = "${fn:length(texts)-1 }">
		<p>text[${i }] = ${texts[i] }</p>
	</c:forEach>
	<!--  분리된 문자열과 '-' 를 연결하도록 fn:join태그를 작성합니다 -->
	<p><c:out value="${fn:join(texts, '-') }"/></p>
	
</body>
</html>