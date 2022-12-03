<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = "C:\\upload";
	File tempFile = new File(path);
	
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	// commons-FileUpload를 이용하여 파일을 업로드하려면 먼저 Commons-FileUPload 파일 업로드를 위해 패키지에 포함되어있는 DiskFileUpload객체를 생성함
	DiskFileUpload upload = new DiskFileUpload();
	// 업로드할 파일의~~
	upload.setSizeMax(1000000);			// 업로드 할 파일의 최대 크기(byte)
	upload.setSizeThreshold(4096);		// 메모리상에 저장할 최대 크기(byte)
	upload.setRepositoryPath(path);		// 업로드된 파일을 임시로 저장할 경로
	
	// 생성된 객체를 통해 DiskFileUpload클래스가 제공하는 메소드를 사용하여 웹 브라우저가 전송한  
	// multipart/form 유형의 요청 파라미터를 가져온다
	// 폼페이지에서 전송된 요청 파라미터를 Iterator클래스로 변환
	
	List items = upload.parseRequest(request);
	// 폼 페이지에서의 전송된 요청 파라미터를 Iterator 클래스로 변환
	Iterator params = items.iterator();
	
	int maxSize = 4 * 1024 * 1024; // 4MB(파일 업로드 max 사이즈 설정)
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
		
		
		
	// FileItem 클래스의 메소드를 사용하여 요청 파라미터가 일반 데이터인지 파일인지 분석 및 처리하여 파일을 업로드함	
		if(item.isFormField()){	// 폼페이지에서 선송된 요청 파라미터가 일반 데이터라면
			String name = item.getFieldName();
			String value = item.getString("UTF-8");
			out.println(name + " = " + value + "<br/>");
		}else{	// 폼 페이지에서 전송된 요청 파라미터가 파일이라면
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();
			String contentType = item.getContentType();
			
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			long fileSize = item.getSize();
			
			File file = new File(path + "/" + fileName);
			
			// 개당파일 최대 사이즈 초과시 알림!
			if(maxSize < fileSize){
				out.println("이미지 크기를 초과하였습니다!<br/>");
			}else{
				item.write(file);
			}
			out.println("-------------------------------------------------<br/>");
			out.println("요청 파라미터 이름: " + fileFieldName + "<br/>");
			out.println("저장파일이름 : " + fileName + "<br/>");
			out.println("파일 콘텐츠 타입 : " + contentType + "<br/>");
			out.println("파일크기 : " + fileSize + "<br/>");
			
		}
	}
	
%>