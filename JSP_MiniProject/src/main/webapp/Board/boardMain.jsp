<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="/resources/css/styles.css" rel="stylesheet" />

<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
</head>
<body>
<%System.out.println(sessionId); %>
	<div class="d-flex" id="wrapper">
		<%@ include file="/sidebar.jsp"%>
		<div id="page-content-wrapper">
			<%@ include file="/topNavigation.jsp"%>
			<div class="container-fluid">
				<form action="<c:url value="/JSP_MiniProject/BoardListAction.do"/>" method="post">
					<div>
						<div class="text-right">
							<span class="badge badge-success">전체 <%=total_record%>건
							</span>
						</div>
					</div>
					<div style="padding-top: 50px">
						<table class="table table-hover">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회</th>
								<th>글쓴이</th>
							</tr>
							<%
							for (int j = 0; j < boardList.size(); j++) {
								BoardDTO notice = (BoardDTO) boardList.get(j);
							%>
							<tr>
								<td><%=notice.getNum()%></td>
								<td><a
									href="/JSP_MiniProject/BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
								<td><%=notice.getRegist_day()%></td>
								<td><%=notice.getHit()%></td>
								<td><%=notice.getId()%></td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
					<div align="center">
						<c:set var="pageNum" value="<%=pageNum%>" />
						<c:forEach var="i" begin="1" end="<%=total_page%>">
							<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
								<c:choose>
									<c:when test="${pageNum==i}">
										<font color='4C5317'><b> [${i}]</b></font>
									</c:when>
									<c:otherwise>
										<font color='4C5317'> [${i}]</font>

									</c:otherwise>
								</c:choose>
							</a>
						</c:forEach>
					</div>
					<div align="left">
						<table>
							<tr>
								<td width="100%" align="center">&nbsp;&nbsp; <select
									name="items" class="txt">
										<option value="subject">제목</option>
										<option value="content">본문</option>
										<option value="name">글쓴이</option>
								</select> <input name="text" type="text" /> <input type="submit"
									id="btnAdd" class="btn btn-primary " value="검색" />
								</td>
								<td width="100%" align="right"><a href="/Board/writeForm.jsp"
									onclick="checkForm(); return false;" class="btn btn-primary">&laquo;<br>글쓰기</a>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>