<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메인화면</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="/resources/css/styles.css" rel="stylesheet" />

<script type="text/javascript">

	function checkForm1() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			location.href="/Member/login.jsp";
			return false;
		}
		location.href = "/Board/writeForm.jsp";
	}
	 checkForm1();

	function checkForm() {
		
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}		
	}
	checkForm();
</script>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/sidebar.jsp"%>
		<div id="page-content-wrapper">
			<%@ include file="/topNavigation.jsp"%>
			<div class="container-fluid">
				<form name="newWrite" action="/JSP_MiniProject/BoardWriteAction.do"
					class="form-horizontal" method="post" onsubmit="return checkForm()">
					<div class="form-group row">
						<label class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-3">
							<input name="id" type="text" class="form-control" value="${sessionId}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">제목</label>
						<div class="col-sm-5">

							<input name="subject" type="text" class="form-control"
								placeholder="subject">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">내용</label>
						<div class="col-sm-8">
							<textarea name="content" cols="50" rows="5" class="form-control"
								placeholder="content"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary " value="등록">
							<input type="reset" class="btn btn-primary " value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>