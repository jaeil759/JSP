<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
		contains() : 검색 대상 문자열의 포함 여부를 확인합니다
		containsIgnoreCase() : 대, 소문자에 관계없이 검색 대상 문자열의 포함 여부를 확인합니다.
	 -->


	<p> Java 문자열 검색</p>
	<!-- 
		설정된 문자열 Hello, Java Server Pages! 에 검색 문자열 java가 포함되었는지 확인하도록 fn:contains 태그를 작성
	 -->
	<p> Hello, Java Server Page! ==> ${fn:contains("Hello, Java Server Page!","java") }</p>
	<!-- 설정된 문자열 Hello, Java Server Pages! 에 검색 문자열 java가 포함되었는지 확인하도록 fn:containsIgnoreCase 태그를 작성 -->
	<p> Hello, Java Server Page! ==> ${fn:containsIgnoreCase("Hello, Java Server Page!","java") }</p>
	
</body>
</html>