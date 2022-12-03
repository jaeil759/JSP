<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   String sessionId = (String)session.getAttribute("sessionId");
%>
<nav class = "navbar navbar-expand navbar-dark bg-dark">
   <div class= "container">
      <div class = "navbar-header">
         <a class="navbar-brand" href="./welcome.jsp">Home</a>
         <a class ="navbar-brand" href ="./addProduct.jsp">Add</a>
      </div>
      <div>
         <ul class="navbar-nav mr-auto">
         <c:set value="<%= sessionId %>" var="sessionId"/>
         <c:choose>
            <c:when test="${empty sessionId }">
               <li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
               <li class="nav-item"><a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원가입</a></li>
            </c:when>
            <c:otherwise>
               <li style="padding-top:7px; color: white;" class="nav-item">[${sessionId }님]</li>            
               <li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
               <li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원수정</a></li>
            </c:otherwise>
         </c:choose>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8081/WebMarket/products.jsp">상품 목록</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8081/WebMarket/addProduct.jsp">상품 등록</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8081/WebMarket/editProduct.jsp?edit=update">상품 수정</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8081/WebMarket/editProduct.jsp?edit=delete">상품 삭제</a></li>
            <li class="nav-item"><a class="nav-link" href="http://localhost:8081/WebMarket/boardListAction.do?pageNum=1">게시판</a></li>
         </ul>
      </div>
   </div>
</nav>