<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		아이디 : ㅇㅇ
		비밀번호 : ㅇㅇ
		이름 : ㅇㅇ
		연락처 : 010-0000-0000
		성별 : ㅇㅇ
		취미 : ㅇㅇ
		소개 : ㅇㅇ
		
		위와 같은 형식으로 출력해주세요
		취미는 Core 태그를 이용해 반복문으로 실행하여 출력해주세요
	 -->
	
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("mem_id");
			String password = request.getParameter("mem_pw");
			String name = request.getParameter("mem_name");
			String phone1 = request.getParameter("mem_phone1");
			String phone2 = request.getParameter("mem_phone2");
			String phone3 = request.getParameter("mem_phone3");
			String sex = request.getParameter("mem_sex");
			String[] hobby = request.getParameterValues("mem_hobby");
			String comment = request.getParameter("mem_comment");
		%>
		 <p>아이디 : <%=id %></p>
		 <p>비밀번호 : <%=password %></p>
		 <p>이름 : <%=name %></p>
		 <p>전화번호 : <%=phone1 %> - <%=phone2 %> - <%=phone3 %></p>
		 <p>성별 : <%=sex %></p>
		 <p>취미 (core 출력): 
		 <c:forEach items = "<%=hobby %>" var = "hob">
			<c:out value = "${hob}"/>		 	
		 </c:forEach>
		 </p>
		<p>취미 (스크립틀릿출력) : 
		<%
			if(hobby !=null){
				for(int i = 0; i < hobby.length; i++){
					out.println(" " + hobby[i]);
				}
		}
		%>
		</p>
		<p>가입인사 : <%=comment %></p>
</body>
</html>