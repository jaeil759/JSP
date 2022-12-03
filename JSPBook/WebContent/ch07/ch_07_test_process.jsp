<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
	문제 1) ch07_test.jsp 에서 넘긴 데이터를 아래와 같이 출력해주세요
	(***** 출력은 문제3 참고!)
	
	[이미지] < 넘긴 이미지를 이미지 태그를 이용하여 출력해주세요
	아이디 : a001
	비밀번호 : 1234
	이름 : 홍길동
	연락처 : 010-1234-1234
	성별 : 남성
	가입인사 : 반갑습니다
	
	문제 2) 해당 페이지로 넘어온 파라미터들을 중간 처리 후, core 태그를 이용하여 저장(c:set)하고 최종 EL로 출력해주세요
	
	문제 3) 아래 내용에 따른 메세지를 출력해주세요
		
		3-1) 프로필 이미지를 선택하지 않고 전송 시, "프로필 이미지를 선택하지 않앗습니다.  메세지를 출력하고,
			프로필 이미지를 선택하고 전송 시, 정상 진행합니다
		3-2) 프로필 이미지를 선택하고 정상적으로 전송 했을 때,
			업로드 한 파일의 사이즈 최대크기(4MB) 초과시 "이미지 크기를 초과하여 이미지를 출력할 수 없습니다" 라는 메세지를 출력합니다
	
	** 메세지를 출력후 문제1) 에서 출력하는 내용은 동일하게 출력되어야 한다
	** 업로드 경로는 자유롭게 
 -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%			
 			String path = request.getServletContext().getRealPath("/resources/images");
 			File tempFile = new File(path);
 			if(!tempFile.exists()){
 				tempFile.mkdirs();
 			}
 			DiskFileUpload upload = new DiskFileUpload();
 			upload.setSizeMax(300000);
 			upload.setSizeThreshold(4096);
 			upload.setRepositoryPath(path);
 			
 			List items = upload.parseRequest(request);
 			Iterator params = items.iterator();
 			
 			Map<String, Object> dataMap = new HashMap<String, Object>();
 			
 			int maxSize = 4 * 1024 * 1024;
 			boolean imgFlag = false;
 			String msg = null;
 			
 			while(params.hasNext()){
 				FileItem item = (FileItem)params.next();
 				
 				if(item.isFormField()){
 					String name = item.getFieldName();
 					String value = item.getString("UTF-8");
 					dataMap.put(name,value);
 				}else{
 					String fileFieldName = item.getFieldName();
 					String fileName = item.getName();
 					
 					if(!fileName.equals("")){
 						String contentType = item.getContentType();
 						fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
 						long fileSize = item.getSize();
 						File file = new File(path + "/" + fileName);
 						
 						// 파일 최대 사이즈 초과 시 알림!
 						if(maxSize < fileSize){
 							out.println("<marquee style = 'color:red;'> 이미지 크기를 초과하였습니다!</marquee><br/>");
 						}else{
 							item.write(file);
 							imgFlag = true;
 							dataMap.put(fileFieldName, fileName);
 							
 							out.println("-----------------------------------------------<br/>");
 							out.println("요청 파라미터 이동 :" + fileFieldName + "<br/>");
 							out.println("저장 파일 이름 : " + fileName + "<br/>");
 							out.println("파일 컨텐츠 타입 : " + contentType + "<br/>");
 							out.println("파일 크기 : " + fileSize + "<br/>");
 						}
 					}else{ // 이미지 파일이 없을때
 						msg = "프로필 이미지를 선택하지 않았습니다.";
 					}
 				}
 			}
		%>
		
		
		<c:set value = "<%=dataMap %>" var = "datamap"/>
		<c:set value = "<%=imgFlag %>" var = "flag"/>
		<c:set value = "<%=msg %>" var = "message"/>
		
		<!-- message가 null이 아닌 경우는 프로필 이미지가 선택되지 않아 메세지가 출력되는것 -->
		<c:if test = "${message !=null }">
		<p>${message } </p>
		</c:if>
		<c:if test = "${message ==  null }">
		<c:if test = "${flag }">
			<img src = "/JSPBook/resources/images/${datamap.filename }"/>
			</c:if>
			<c:if test="${!flag }">
				<p>이미지 크기를 초과하여 이미지를 출력할 수 없습니다</p>
			</c:if>
		</c:if>
		<p>아이디 : ${datamap.mem_id }</p>
		<p>비밀번호 : ${datamap.mem_pw }</p>
		<p>이름 : ${datamap.mem_name }</p>
		<p>연락처 : ${datamap.mem_phone1 } - ${datamap.mem_phone2 } - ${datamap.mem_phone3 }</p>
		<p>성별 : ${datamap.mem_sex }</p>
		<p>가입인사 : ${datamap.mem_comment }</p>
		
		<a href = "./ch07_test.jsp">뒤로가기>>>>>>>>>></a>
		
		
		
		</body>
</html>
		
		
		