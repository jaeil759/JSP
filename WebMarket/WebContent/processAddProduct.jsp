<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");



	String filename = "";
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType = "UTF-8";
	int maxSize = 5 * 1024 * 1024;
	
	File file = new File(realFolder);
	if(!file.exists()){
		file.mkdirs();
	}

	/* MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname); */
	/* Cors.jar 사용시 아래 사용 End*/
	
	/* Commons-fileupload.jar, Common-fileupload를 이용하여 사용시 아래 사용*/
	DiskFileUpload upload = new DiskFileUpload();
	upload.setFileSizeMax(10000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	String productId = "";
	String name = "";
	String unitPrice = "";
	String description = "";
	String manufacturer = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String fileName = "";
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
		if(item.isFormField()){
			String fieldName = item.getFieldName();
			if(fieldName.equals("productId")){
				productId = item.getString("UTF-8");
			}else if(fieldName.equals("name")){
				name = item.getString("UTF-8");
			}else if(fieldName.equals("unitPrice")){
				unitPrice = item.getString("UTF-8");
			}else if(fieldName.equals("description")){
				description = item.getString("UTF-8");
			}else if(fieldName.equals("manufacturer")){
				manufacturer = item.getString("UTF-8");
			}else if(fieldName.equals("category")){
				category = item.getString("UTF-8");
			}else if(fieldName.equals("unitsInStock")){
				unitsInStock = item.getString("UTF-8");
			}else if(fieldName.equals("condition")){
				condition = item.getString("UTF-8");
			}
		}else{
			String fileFieldName = item.getFieldName();
			fileName = item.getName();
			String contentType = item.getContentType();
			String originalFileName = fileName;
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			long fileSize = item.getSize();
			File originalFile = new File(originalFileName);
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile);
		}
	}
	
	
	
   int price ;
   if(unitPrice.isEmpty()){
      price=0;
   }else{
      price = Integer.valueOf(unitPrice);
   }
   long stock;
   if(unitsInStock.isEmpty()){
      stock = 0;
   }else{
      stock = Long.valueOf(unitsInStock);
   }
	   
	
	String sql = "INSERT INTO PRODUCT VALUES(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	pstmt.setString(2,name);
	pstmt.setInt(3,price);
	pstmt.setString(4,description);
	pstmt.setString(5,category);
	pstmt.setString(6,manufacturer);
	pstmt.setLong(7,stock);
	pstmt.setString(8,condition);
	pstmt.setString(9,fileName);
	pstmt.executeUpdate();
	
  	if(pstmt != null) pstmt.close();
  	if(conn != null) conn.close();

	response.sendRedirect("products.jsp");
%>