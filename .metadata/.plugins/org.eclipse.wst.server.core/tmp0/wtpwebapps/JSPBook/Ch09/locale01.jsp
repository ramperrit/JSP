<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>현재 로케일의 국가, 날자, 통화</h3>
	<%
		Locale locale = request.getLocale();
		Date currentDate = new Date();
		
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL,locale);
		NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
	%>
	
	<p> 국가 : <%= locale.getDisplayCountry() %>
	<p> 날짜 : <%= dateFormat.format(currentDate) %>
	<p> 숫자 : <%= numberFormat.format(12345.67)%>
</body>
</html>