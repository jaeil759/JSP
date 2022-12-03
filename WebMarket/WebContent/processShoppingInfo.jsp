<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 인터넷을 통해 전송할 수 있는 문자는 ASCII 문자이기 떄문이ㅔ,
	// ASCII 문자가 아닌 문자는 인터넷을 ㅌ오해 전송할 수 있는 형태로 변환해줘야 한다.
	// 하여, URLEncoder를 이용한  encoding해서 데이터 전송
	Cookie cartId = new Cookie("Shopping_cartId",URLEncoder.encode(request.getParameter("cartId"),"UTF-8"));
	Cookie name = new Cookie("Shopping_name", URLEncoder.encode(request.getParameter("name"),"UTF-8"));
	Cookie shoppingDate = new Cookie("Shopping_date",URLEncoder.encode(request.getParameter("shoppingDate"),"UTF-8"));
	Cookie country = new Cookie("Shopping_country",URLEncoder.encode(request.getParameter("country"),"UTF-8"));
	Cookie zipCode = new Cookie("Shopping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"UTF-8"));
	Cookie addressName = new Cookie("Shopping_addressName",URLEncoder.encode(request.getParameter("addressName"),"UTF-8"));
	
	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	shoppingDate.setMaxAge(24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shoppingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);

	response.sendRedirect("orderConfirmation.jsp");
%>