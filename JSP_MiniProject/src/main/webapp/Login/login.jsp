<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="d-flex" id="wrapper">
            <%@ include file = "/sidebar.jsp" %>
            <div id="page-content-wrapper">
                <%@ include file = "/topNavigation.jsp" %>
                <div class="container-fluid" align="center" >
                <br>
                    <h3 class="form-signin-heading">Sign in</h3>
                    <br>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요.");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">ID</label>
					<input type="text" class="form-control" placeholder="ID" name='j_username' style="width:10%" required autofocus>
				</div>
				<br>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='j_password' style="width:10%" required>
				</div>
				<br>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
</body>
</html>