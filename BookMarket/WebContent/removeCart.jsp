<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	if(id == null || id.equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if(book == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Book> cartList = (ArrayList<Book>)session.getAttribute("cartList");
	Book goodsQnt = new Book();
	for(int i = 0; i < cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getBookId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	response.sendRedirect("cart.jsp");
%>