<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
	%>
	<p>  입력된 name 값 : <%=name %>
</body>
</html>