<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO"%>
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
<%
String sessionId = (String) session.getAttribute("sessionId");
BoardDTO notice = (BoardDTO) request.getAttribute("board");
int num = ((Integer) request.getAttribute("num")).intValue();
int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
</head>
<body>

	<div class="d-flex" id="wrapper">
		<%@ include file="/sidebar.jsp"%>
		<div id="page-content-wrapper">
			<%@ include file="/topNavigation.jsp"%>
			<div class="container-fluid">
				<form name="newUpdate"
					action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
					class="form-horizontal" method="post">
					<c:choose>
					<c:when test="${sessionId==notice.getId()}">
					<%System.out.println(notice.getId()); 
					System.out.println(sessionId);%>
						<div class="form-group row">
							<label class="col-sm-2 control-label">작성자</label>
							<div class="col-sm-3">
								<input name="name" class="form-control"
									value=" <%=notice.getId()%>" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 control-label">제목</label>
							<div class="col-sm-5">
								<input name="subject" class="form-control"
									value=" <%=notice.getSubject()%>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 control-label">내용</label>
							<div class="col-sm-8" style="word-break: break-all;">
								<textarea name="content" class="form-control" cols="50" rows="5"> <%=notice.getContent()%></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-offset-2 col-sm-10 ">
								<p>
									<a
										href="/JSP_MiniProject/BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
										class="btn btn-danger"> 삭제</a> <input type="submit"
										class="btn btn-success" value="수정 "> <a
										href="/JSP_MiniProject/BoardListAction.do?pageNum=<%=nowpage%>"
										class="btn btn-primary"> 목록</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
					<div class="form-group row">
						<label class="col-sm-2 control-label">작성자</label>
						<div class="col-sm-3">
							<input name="name" class="form-control"
								value=" <%=notice.getId()%>" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">제목</label>
						<div class="col-sm-5">
							<input name="subject" class="form-control"
								value=" <%=notice.getSubject()%>" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label">내용</label>
						<div class="col-sm-8" style="word-break: break-all;">
							<textarea name="content" class="form-control" cols="50" rows="5"
								readonly> <%=notice.getContent()%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<p>
								<a
									href="/JSP_MiniProject/BoardListAction.do?pageNum=<%=nowpage%>"
									class="btn btn-primary"> 목록 </a>
						</div>
					</div>
					</c:otherwise>
					</c:choose>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>