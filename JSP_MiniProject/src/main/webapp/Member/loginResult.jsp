<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인 결과</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<%String loginId = (String) session.getAttribute("sessionId"); %>
	<div class="d-flex" id="wrapper">
            <%@ include file = "/sidebar.jsp" %>
            <div id="page-content-wrapper">
                <%@ include file = "/topNavigation.jsp" %>
                <div class="container-fluid">
                    <div class="container" align="center" >
		<%
			String msg = request.getParameter("msg");
			
			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
					
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
                </div>
            </div>
        </div>
   </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>