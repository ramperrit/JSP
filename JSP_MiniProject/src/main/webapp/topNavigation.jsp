<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String sessionId = (String) session.getAttribute("sessionId"); %>
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                            	<c:choose>
                            	<c:when test="${empty sessionId }">
                                <li class="nav-item active"><a class="nav-link" href="/main.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="/Login/login.jsp">Login</a></li>
                                <li class="nav-item"><a class="nav-link" href="/Login/signUp.jsp">SignUp</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Language</a>
                                        <a class="dropdown-item" href="#!">About</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                                </c:when>
                                <c:otherwise>
                                <li class="nav-item active"><a class="nav-link" href="/main.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="/Login/logout.jsp">Logout</a></li>
                                <li class="nav-item"><a class="nav-link" href="/Mypage/mypageMain.jsp">MyPage</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Language</a>
                                        <a class="dropdown-item" href="#!">About</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                                </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </nav>