<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String hostValue = request.getHeader("host");
		String alValue = request.getHeader("accept-language");
		
		out.print("호스트 명 : " + hostValue + "<br>");
		out.print("설정된 언어 : " + alValue + "<br>");
	%>
	
	<%
		Enumeration en = request.getHeaderNames();
		while (en.hasMoreElements()){
			String headerName = (String) en.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%= headerName %> : <%=headerValue%><br>
	<% 
		} 
	%>
	
	<p>
		<%= request.getRemoteAddr() %>
	</p>
	<p>
		<%= request.getQueryString()%>
	</p>
</body>
</html>