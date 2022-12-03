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
			if(!fileName.equals("")){
			String contentType = item.getContentType();
			String originalFileName = fileName;
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			long fileSize = item.getSize();
			File originalFile = new File(originalFileName);
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile);
		}else{
			fileName = null;
		}
	}
}
	
	
	Integer price;
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	long stock;
	
	if(unitsInStock.isEmpty()){
		stock = 0;
	}
	else{
		stock = Long.valueOf(unitsInStock);
	}
	
	String sql = "SELECT * FROM PRODUCT WHERE P_ID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	if(rs.next()){
		
		if(fileName != null){
			sql	= "UPDATE PRODUCT SET P_NAME = ?, P_UNITPRICE = ?, P_DESCRIPTION = ?, P_MANUFACTURER = ?, P_CATEGORY = ?, P_UNITSINSTOCK = ?, P_CONDITION = ?, P_FILENAME = ? WHERE P_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,price);
			pstmt.setString(3,description);
			pstmt.setString(4,manufacturer);
			pstmt.setString(5,category);
			pstmt.setLong(6,stock);
			pstmt.setString(7,condition);
			pstmt.setString(8,fileName);
			pstmt.setString(9,productId);
			
		}else{
			sql	= "UPDATE PRODUCT SET P_NAME = ?, P_UNITPRICE = ?, P_DESCRIPTION = ?, P_MANUFACTURER = ?, P_CATEGORY = ?, P_UNITSINSTOCK = ?, P_CONDITION = ? WHERE P_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,price);
			pstmt.setString(3,description);
			pstmt.setString(4,manufacturer);
			pstmt.setString(5,category);
			pstmt.setLong(6,stock);
			pstmt.setString(7,condition);
			pstmt.setString(8,productId);
		}
		pstmt.executeUpdate();
	}
	
  	if(rs != null) rs.close();
  	if(pstmt != null) pstmt.close();
  	if(conn != null) conn.close();

	response.sendRedirect("product.jsp?id=" + productId);
%>