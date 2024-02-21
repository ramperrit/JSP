<%@page import="ch04.dao.Person"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.dao.Person" scope="request"></jsp:useBean>
	<p>아이디 : <%= person.getId() %>
	<p>이 름 : <%= person.getName() %>
</body>
</html>