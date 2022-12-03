<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><h3>*** 웹 브라우저의 IP 주소를 가져옴</h3></li>
		<li>
			클라이언트 IP<br/>
			- 웹 브라우저의 IP 주소를 가져옵니다.<br/>
			- <%= request.getRemoteAddr() %>
		</li>
		<li>
			요청 정보 길이<br/>
			- 웹 브라우저의 요청 파라미터 길이를 가져옵니다.<br/>
			- <%=request.getContentLength() %>
		</li>
		<li>
			요청 정보 인코딩<br/>
			- 웹 브라우저의 문자 인코딩을 가져옵니다.<br/>
			- <%=request.getCharacterEncoding() %>
		</li>
		<li>
			요청 정보 콘텐츠 유형<br/>
			- 웹 브라우저의 콘텐츠 유형가져옵니다.<br/>
			- <%=request.getContentType() %>
		</li>
		<li>
			요청 정보 콘텐츠 프로토콜<br/>
			- 웹 브라우저의 요청 프로토콜을 가져옵니다.<br/>
			- <%=request.getProtocol() %>
		</li>
		<li>
			요청 정보 전송방식<br/>
			- 웹 브라우저의 HTTP 요청 메소드(GET,POST)를 가져옵니다<br/>
			- <%=request.getMethod() %>
		</li>
		<li>
			요청 URI<br/>
			- 웹 브라우저의 요청한 URI 경로를 가져옵니다.<br/>
			- <%=request.getRequestURI() %>
		</li>
		<li>
			컨텍스트 경로<br/>
			- 현재 JSP 페이지의 웹 애플리케이션 컨텍스트 경로를 가져옵니다<br/>
			- <%=request.getContextPath() %>
		</li>
		<li>
			서버 이름<br/>
			- 서버의 이름을 가져옵니다<br/>
			- <%=request.getServerName() %>
		</li>
		<li>
			서버 포트<br/>
			- 서버 포트를 가져옵니다<br/>
			- <%=request.getServerPort() %>
		</li>
		<li><h3>웹 브라우저의 전체 요청 마라미터 문자열(쿼리문을 가져옴)</h3></li>
		<li>
			쿼리문<br/>
			- 웹 브라우저의 전체 요청 마라미터 문자열[물음표(?) 다음URL에 할당된 문자열]을 가져옵니다.
			- <%=request.getQueryString() %>
		</li>
	</ul>
</body>
</html>