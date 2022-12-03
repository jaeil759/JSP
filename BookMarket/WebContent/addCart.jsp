<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
   // 장바구니에 담을 상품의 아이디 가져옴
   String id = request.getParameter("id");
   if(id == null || id.trim().equals("")){
      response.sendRedirect("books.jsp");
      return;
   }
   
   BookRepository dao = BookRepository.getInstance();
   
   Book book = dao.getBookById(id);
   if(book == null){
      response.sendRedirect("exceptionNoBookId.jsp");
   }
   
   // 상품 목록에서 해당 아이디를 가지고 있는 도서 가져오기
   ArrayList<Book> goodsList = dao.getAllBooks();
   Book goods = new Book();      // 장바구니에 넣을 도서 물품
   for(Book item : goodsList){
      if(item.getBookId().equals(id)){
         goods = item;
      }
   }
   
   // 세션에 있는 장바구니 list 가져오기
   ArrayList<Book> list =  (ArrayList<Book>)session.getAttribute("cartlist");
   if(list == null){      // 세션에 저장된 장바구니 list가 없다면
      list = new ArrayList<Book>();   // 장바구니 list를 만들고 세션에 저장하기
      session.setAttribute("cartlist", list);
   }
   
   int cnt = 0;
   Book goodsQnt = new Book();   // 장바구니에 있는 물품 비교용 도서 생성
   for(Book item : list){
      if(item.getBookId().equals(id)){
         cnt ++;
         int orderQuantity = item.getQuantity() + 1;
         goodsQnt = item;
         goodsQnt.setQuantity(orderQuantity);
      }
   }
   
   if(cnt == 0){
      goods.setQuantity(1);
      list.add(goods);
   }
   
   response.sendRedirect("book.jsp?id=" + id);
   
%>	