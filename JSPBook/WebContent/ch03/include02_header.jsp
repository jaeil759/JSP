<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%! 
	// 선언문태그
		int pageCount = 0;
	// 함수 addCount()
		void addCount(){
			pageCount++;
		}
	%>
	<%
		//스크립틀릿
		// 함수 addCount()호출
		addCount();
	%>
	<p>이사이트 방문은 <%=pageCount %>번째입니다.</p>