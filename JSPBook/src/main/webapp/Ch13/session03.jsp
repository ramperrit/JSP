<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	String name, value;
	
	Enumeration en = session.getAttributeNames();
	int i = 0;
	
	while(en.hasMoreElements()){
		i++;
		name = en.nextElement().toString();
		value = session.getAttribute(name).toString();
		
		out.println("설정된 세션의 속성 이름 [ " + i + " ] : " + name + "<br>");
		out.println("설정된 세션의 속성 값 [ " + i + " ] : " + value + "<br>");
	}
	%>
</body>
</html>