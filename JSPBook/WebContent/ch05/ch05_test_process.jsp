<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		ch05_test.jsp에서 전송받은
		아이디 비밀번호, 이름, 성별, 핸드폰번호, 주소를 taglib을 이용하여 출력하세요
		[출력예시]
		아이디 : a001
		비밀번호 : 1234
		이름 : 홍길동 
		성별 : 남자
		핸드폰번호 : 010-1234-5678
		주소 : 대전시 서구 오류동123
		[여기까지 가능한 분은 아래까지도 진행해보세요
		(*** 구현방법은 자유롭게 어떤방법을 동원해서라도)
		출력을 완료했으면, 5초뒤에 www.naver.com 으로 이동시켜주세요
		-->	
		<%
		request.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("id");
		String mem_pw = request.getParameter("pw");
		String mem_name = request.getParameter("name");
		String mem_gender = request.getParameter("gender");
		String mem_phone = request.getParameter("phone");
		String mem_addr = request.getParameter("addr");
		
		%>
	 <%-- 	<%= request.getParameter("id") %> <br>
	 	<%= request.getParameter("pw") %> <br>
	 	<%= request.getParameter("name")%><br>
	 	<%= request.getParameter("gender")%><br>
	 	<%= request.getParameter("phone")%>	<br>
	 	<%= request.getParameter("addr")%>	<br> --%>
	 	아이디 : <c:out value="<%=mem_id %>"></c:out><br/>
	 	비밀번호 : <c:out value="<%=mem_pw %>"></c:out><br/>
	 	이름 : <c:out value="<%=mem_name %>"></c:out><br/>
	 	성별 : <c:out value="<%=mem_gender %>"></c:out><br/>
	 	전화번호 : <c:out value="<%=mem_phone %>"></c:out><br/>
	 	주소 : <c:out value="<%=mem_addr %>"></c:out><br/>
	 	
	 	
	 	
	 	
	 	<br/>
	 	<p id = "p1">페이지가 이동될 초가 표시됩니다.</p>
	 	<script type = "text/javascript">
	 	var a = 0;
	 	var pTag = document.getElementById("p1");
	 	
	 	setInterval(() => {
	 		a++;
	 		pTag.innerHTML = a + "초 뒤에 이동됩니다!";
	 		if(a == 5){
	 			location.href = "http://www.naver.com";
	 		}
	 		
	 	}, 1000);
	 	</script>
</body>
</html>