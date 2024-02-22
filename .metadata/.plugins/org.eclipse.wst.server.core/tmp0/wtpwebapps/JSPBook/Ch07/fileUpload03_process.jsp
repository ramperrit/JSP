<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title> File Upload </title>
</head>
<body>
<%
	String fileUploadPath = "C:\\upload";

	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(4096);
	upload.setRepositoryPath(fileUploadPath);
	
	List <FileItem> items = upload.parseRequest(request);
	
	
	for(FileItem f : items){
		if(f.isFormField()){
			String name = f.getFieldName();
			String value = f.getString("utf-8");
			out.println(name + "=" + value + "<br>");
		}else{
			String fileFieldName = f.getFieldName();
			String fileName = f.getName();
			String contentType = f.getContentType();
			
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			long fileSize = f.getSize();
			
			File file = new File(fileUploadPath + "/" + fileName);
			f.write(file);
			
			out.println("------------------------<br>");
			out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
			out.println("저장 파일 이름 : " + fileName + "<br>");
			out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
			out.println("파일 크기 : " + fileSize);
			
		}
	}
%>
</body>
</html>