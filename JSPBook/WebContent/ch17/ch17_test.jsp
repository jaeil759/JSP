<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		문제)
		404호 모든 학생의 이름을 담고
		학생들의 이름을 ','로 구분하여 각각 나눈후 
		-------------------------------------------
		조씨 성을 가진 사람 몇명 : 
		배씨 성을 가진 사람 몇명 : 
		양씨 성을 가진 사람 몇명
		..
		..
		..
		..
		..
		-------------------------------------------
		김슬기 김진호 조현수 양지윤 조은혁 배영호 배지영 김혜진 허소영 전재한 김민지 채진영 송서영 박형기 김보미 인승주 남지현 오지형 허나훔 한상훈 정종은 고재일 272
		
	 -->
	 <h3>각 성씨는 몇명인가요</h3>
	 <c:set var = "dae404" value = "고재일,정종은,한상훈,허나훔,오지형,남지현,인승주,허소영,윤영현,전재한,박민지,채진영,송서영,박형기,김보미,김혜진,배지영,배영호,조은혁,양지윤,조현수,김진호,김슬기,이철희"/>
	 <p>이름 : <c:out value = "${dae404 }"/></p>
	 
	<%--  <c:if test = "${fn:contains(dae404,'고')}">
	 	<c:out value="${dae404 }"></c:out>
	 </c:if>
	  <c:if test = "${not fn:contains(dae404,'고')}">
	 </c:if> --%>
	 	<c:out value="${fn:length(dae404,'고')}"></c:out>
		
	
</body>
</html>