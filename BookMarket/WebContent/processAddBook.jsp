<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	File file = new File("C:\\upload");
	if(!file.exists()){
		file.mkdirs();
	}

	MultipartRequest multi = new MultipartRequest(request, file.getPath(), 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
	String name1 = multi.getParameter("name1");
	String bookId=multi.getParameter("BookId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String author=multi.getParameter("author");
	String publisher=multi.getParameter("publisher");
	String releaseDate=multi.getParameter("releaseDate");
	String totalPages=multi.getParameter("totalPages");
	String description=multi.getParameter("description");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");
	String condition=multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty()){
		price=0;
	}else{ 
		price=Integer.valueOf(unitPrice);
	}
	
	long stock;
	if(unitsInStock.isEmpty()){
		stock=0;
	}else{ 
		stock=Long.valueOf(unitsInStock);
	}
	long pages;
	if(unitsInStock.isEmpty()){
		pages=0;
	}else{
		pages=Long.valueOf(totalPages);
	}
	
	
	BookRepository dao=BookRepository.getInstance();
	Book book = new Book();
	book.setBookId(bookId);
	book.setName(name);
	book.setUnitPrice(price);
	book.setAuthor(author);
	book.setPublisher(publisher);
	book.setReleaseDate(releaseDate);
	book.setTotalPages(pages);
	book.setDescription(description);
	book.setCategory(category);
	book.setUnitsInStock(stock);
	book.setCondition(condition);
	book.setFileName(name1);
	dao.addProduct(book);
	
	
	response.sendRedirect("book.jsp");
	
%>