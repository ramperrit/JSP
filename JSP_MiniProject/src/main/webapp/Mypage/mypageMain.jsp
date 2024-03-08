<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>마이페이지</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			location.href="/Member/login.jsp";
			return false;
		}
		location.href = "/Mypage/mypageMain.jsp";
	}
	 checkForm();
</script>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/sidebar.jsp"%>
		<div id="page-content-wrapper">
			<%@ include file="/topNavigation.jsp"%>
			<div class="container-fluid">
				<h1 class="mt-4"><%=sessionId%>님의 페이지
				</h1>

				<p>정보 수정, 내가 쓴 게시판, 간단 정보</p>
				<a class="btn btn-primary" href="/Member/updateMember.jsp">정보 수정</a>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>