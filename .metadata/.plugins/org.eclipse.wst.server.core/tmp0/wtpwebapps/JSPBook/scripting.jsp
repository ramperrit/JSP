<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	 <%! int count = 3;
	 String makeItLower(String data){
		 return data.toLowerCase();
	 }
	 %>
	 
	 <%
	 for(int i = 0; i<= count; i++){
		 out.println("JAVA Service Pages" + i +".<br>");
	 }
	 %>
	 
	 <%= makeItLower("HELLO WORLD") %>
</body>
</html>