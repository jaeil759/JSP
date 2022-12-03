<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		request.getHeader("USER-Agent") request 내장객체를 이용하여 가져온
		Header 'User-Agent'를 EL에서 header['User-Agent']로 작성 가능
	 -->
	 browser 변수 값 설정
	 <c:set var = "hd" value = "${header }"/>
	 <c:set var = "userAgent" value = "${header['User-Agent'] }"/>
	 <br/>
	 
	 User-Agent : <c:out value = "${hd['User-Agent'] }"/><br/>
	 Host : <c:out value = "${hd['Host'] }"/><br/>
	 Accept : <c:out value = "${hd['Accept'] }"/><br/>
	 Accept-Language : <c:out value = "${hd['Accept-Language'] }"/><br/>
	 Referer : <c:out value = "${hd['Referer'] }"/><br/>
	 Connection : <c:out value = "${hd['Connection'] }"/><br/>
	 Cache-Control : <c:out value = "${hd['Cache-Control'] }"/><br/>
	 <br/>
	 <c:out value = "${userAgent }"/><br/>
	 
	 <p>userAgent 변수값 제거후 </p>
	 <c:remove var = "userAgent"/>
	 <c:out value = "${userAgent }"/>
	 
</body>
</html>