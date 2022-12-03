<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = "C:\\upload";
	File tempFile = new File(path);
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(10000000);
	upload.setSizeThreshold(4096);
	upload.setRepositoryPath(path);
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	int maxSize = 4*1024*1024;
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
	if(item.isFormField()){
		String name = item.getFieldName();
		String value = item.getString("UTF-8");
		out.println(name + " = " + value + "<br/>");
	}else{
		String fileFieldName = item.getFieldName();
		String fileName = item.getName();
		String contentType = item.getContentType();
		
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		long fileSize = item.getSize();
		
		File file = new File(path + "/" + fileName);
		
		if(maxSize < fileSize){
			out.println("이미지 크기를 초과하였습니다!<br/>");
		}else{
			item.write(file);
		}
		out.println("-------------------------------------------------------------------------------------<br/>");
		out.println("요청 파라미터 이름 : " + fileFieldName + "<br/>");
		out.println("저장파일 이름 : " + fileName + "<br/>");
		out.println("파일 콘텐츠 타입 : " + contentType + "<br/>");
		out.println("파일크기 : " + fileSize + "<br/>");
	}
	
}
%>