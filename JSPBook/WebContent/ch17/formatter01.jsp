<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
   <%
      int num1 = 123456789;
      int num2 = 123;
      double num3 = 123.45;
      double num4 = 123456.123;
   %>
   <c:set var="num1" value="<%= num1 %>"/>
   <c:set var="num2" value="<%= num2 %>"/>
   <c:set var="num3" value="<%= num3 %>"/>
   <c:set var="num4" value="<%= num4 %>"/>
   
   <!-- 
   	formaNumber 태그
   	- type : type 속성이 "currency"일 경우 인식할 화폐 단위
   	- groupingUser : ','와 같은 각 숫자 단위의 구분자 표시 여부(기본값(true)
   		> groupingUsed 속성은 default true
   	- minFractionDigits : 화면에 표시할 소수점 이하 숫자의 최소 개수
   	- maxFractionDigits : 화면에 표시할 소수점 이하 숫자의 최대 개수
    -->
   
   
   <h3>formatNumber 태그 사용</h3>
   <fmt:formatNumber value="${num1 }"/><br>
   <fmt:formatNumber value="${num1 }" groupingUsed="false"/><br>
   <fmt:formatNumber value="${num1 }" type="currency"/><br>
   <fmt:formatNumber value="${num4 }" minFractionDigits="6"/><br>
   <fmt:formatNumber value="${num4 }" maxFractionDigits="3"/><br>
   
   <h3>formatDate</h3>
   
   <!-- 
   	formatDate태그
   	 - 날짜나 시간의 포맷 방식을 지정하여 출력하는 태그입니다.
    -->
   <c:set var = "date" value = "<%=new Date() %>"/>
   기본 : <fmt:formatDate value = "${date }"/> <br/>
   날짜 : <fmt:formatDate value = "${date }" type = "date"/> <br/>
   시간 : <fmt:formatDate value = "${date }" type = "time"/><br/>
   날짜 및 시간 : <fmt:formatDate value = "${date }" type = "both"/> <br/>
   패턴 : <fmt:formatDate value = "${date }" pattern = "yyyy-MM-dd hh:mm:ss"/> <br/>
</body>
</html>