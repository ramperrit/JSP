<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시판</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="d-flex" id="wrapper">
            <%@ include file = "/sidebar.jsp" %>
            <div id="page-content-wrapper">
                <%@ include file = "/topNavigation.jsp" %>
                <div class="container-fluid">
                    <h1 class="mt-4">게시판 목록</h1>
                    <p>게시판 목록</p>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
</body>
</html>