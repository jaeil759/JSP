	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<body>
<!-- 
	문제 풀어보기
	
	아래 정규식을 풀어보고 통과햇다면, ch08_Test_process.jsp로 이동하여 결과를 출력해주세요
	
 -->
 <script>
 	function(){
 		$("sendBtn").submit(function(){
 			// 정규식처리
 			
 			// 숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정 해 주세요
 			var regExpQuest1 = /^[0-9]{7,12}$/;
 			
 			// 시작은 영소문자 a,b,c 고 영소대문자 8~12자리까지만 입력 받을 수 있게 작성
 			var regExpQuest2 = /^[abc][a-zA-Z]{7,11}$/;
 			
 			// 아이디는 영소문자로 시작하고 영소문자, 숫자 8~16자리 설정
 			var regExpId = /^[a-z][a-z0-9]{7,15}$/;
 			
 			//비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자 , 특수문자 8~16자리 설정
 			var regExpPw = /^[A-Z][^ㄱ-힣]{7,15}$/;
 			
 			// 이름은 한글 2~5자리로 설정
 			var regExpName = /^[ㄱ-힣]{2,5}$/;
 			//핸드폰번호는 011,016,017,019,010,070 으로 시작하고
 			// 두번째 자리는 숫자 3,4자리로 시작하고
 			// 세번쨰 자리는 숫자 4자리로 결정
 			var regExpPhone = /^(010|011|016|017|019|070)-[\d]{3,4}-[\d]{4}$/;
 
 			$("#frm").submit(function(){
 				// 에러 메세지를 출력란 초기화
 				$("err_quest1").html("");
 				$("err_quest2").html("");
 				$("err_id").html("");
 				$("err_pw").html("");
 				$("err_name").html("");
 				$("err_phone").html("");
 			
 				if(!regExpQuest1.test($("#quest1").val)){
 					$("#err_quest1").html("숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요");
 					$("#quest1").focus();
 					return false;
 				}
 				if(!regExpQuest2.test($("#quest2").val)){
 					$("#err_quest2").html("시작은 영소문자 a,b,c 고 영소대문자 8~12자리까지만 입력 ");
 					$("#quest2").focus();
 					return false;
 				}
 				if(!regExpId.test($("#id").val)){
	 				$("#err_id").html("영소문자로 시작하고 영소문자, 숫자 8~16자리 설정");
	 				$("#id").focus();
	 				return false;
 				}
 				if(!regExpPw.test($("#pw").val)){
	 				$("#err_pw").html("영대문자로 시작하고 영문 대소문자, 숫자 , 특수문자 8~16자리 설정");
	 				$("#pw").focus();
	 				return false;
 				}
 				if(!regExpName.test($("#name").val)){
	 				$("#err_name").html("이름은 한글 2~5자리로 설정");
	 				$("#name").focus();
	 				return false;
 				}
 				if(!regExpPhone.test($("#phone").val)){	
	 				$("#err_phone").html("ㅁㄴ암너아ㅣㅁ너이ㅑㅁ정미ㅜㅊ");
	 				$("#phone").focus();
	 				return false;
 				}
 				
 				$("#success").html("통과!");
 			})
 			
 			
 		})
 		
 	}
 </script>
 
 
 	<form id = "frm" action = "./ch08_test_process.jsp" method = "post">
 		<h4>숫자만 입력하되, 7-12 자리까지만 입력 받을 수 있게 설정해주세요</h4>
 		<input type = "text" id = "quest1" name = "quest1"/>
 		<p id = err_quest1></p>
 		<br/>
 		
 		<h4>시작은 영소문자 a,b,c,고 영소대문자 8~12자리까지만 입력 받을수 있게 설정해주세요</h4>
 		<input type = "text" id = "quest2" name = "quest2"/>
 		<p id = "err_quest2"></p>
 		<br/>
 		
 		<h4>아이디는 영소문자로 시작하고 영소문자, 8~16자로 설정해주세요</h4>
 		<input type = "text" id = "mem_id" name = "mem_id"/>
 		<p id = "err_name"></p>
 		<br/>
 		
 		<h4>핸드폰번호의 첫번째 자리는 011,016,017,019,070,010으로 시작하고  
 			두번째 자리는 숫자 3자리 또는 숫자 4자리로 시작하고<br/>
 			세번쨰 자리는 숫자 4자리로 설정해주세요 <br/>
 			예시) 010-1234-1234, 016-123-1234	
 		</h4>
 		<input type = "text" id = "mem_phone"/>
 		<p id = "err_phone"></p>
 		<br/>
 		
 		<p id = "success"></p>
 		<input type = "submit" id = "sendBtn" value = "전송"/>
 	</form>
 	<!-- 스크립트 작성은 제이쿼리로 하세요
 	ㅔㅇ러 메세지는 alert창으로 출력하지말고 각 문제에 작성된 p태그에 에러메세지를 출력하세요
 	최종 정규식을 통과하면 마지막 o태그인 success에 "통과" 를 출력한 후 결과 페이지로 이동해 주세요 -->
 	
</body>
</html>