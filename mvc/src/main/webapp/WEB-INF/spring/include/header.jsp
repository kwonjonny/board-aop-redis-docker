<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<title>Includ Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<!-- Favicon -->
<link rel="shortcut icon" href="/imgs/favicon.ico" type="image/x-icon">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

</head>

<body>
<div class="container-fluid position-relative bg-white d-flex p-0">
<!-- Spinner Start -->
<div id="spinner"
class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
  <span class="sr-only">Loading...</span>
</div>
</div>
<!-- Spinner End -->

<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
<nav class="navbar bg-light navbar-light">
  <h1 class="header-logo">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
      <a href="/spring/board/list" class="navbar-brand">
    </sec:authorize>
    <%--<h3 class="text-primary">Fast Pickup</h3>--%>
      <img src="/imgs/logo.png" alt="factpickup">
      </a>
  </h1>
  <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
    <div class="navbar-nav w-100">
      <a href="/spring/board/list" class="nav-item nav-link <c:if test=" ${pageName=='board' }">active
        </c:if>"><i class="fa fa-hashtag me-2"></i>자유 게시판</a>
      <a href="/spring/notice/list" class="nav-item nav-link <c:if test=" ${pageName=='notice' }">active
        </c:if>"><i class="fa fa-table me-2"></i>공지 사항</a>
      <a href="/spring/member/list" class="nav-item nav-link <c:if test=" ${pageName=='member' }">active
        </c:if>"><i class="fa fa-keyboard me-2"></i>회원 관리</a>
      <a href="/spring/stats/list" class="nav-item nav-link <c:if test=" ${pageName=='stats' }">active
        </c:if>
        "><i class="fa fa-heart me-2"></i>회원 - 게시물 통계</a>
    </div>
  </sec:authorize>
</nav>
</div>
<!-- Sidebar End -->
<!-- Content Start -->
<div class="content content_wrap">
<!-- Navbar Start -->
<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
  <a href="/board/list" class="navbar-brand d-flex d-lg-none me-4">
    <h2 class="text-primary mb-0"><i class="fa fa-hashtag">Fast Pickup</i></h2>
  </a>
  <a href="#" class="sidebar-toggler flex-shrink-0">
    <i class="fa fa-bars"></i>
  </a>
  <div class="navbar-nav align-items-center ms-auto">
    <div class="nav-item dropdown">
      <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
        <!-- Security -->
        <sec:authorize access="isAuthenticated()">
          User:
          <sec:authentication property="principal.username" />
        </sec:authorize>
      </a>
      <!-- Security -->
      <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
        <sec:authorize access="isAuthenticated()">
          <a href="/spring/member/read/<sec:authentication property='principal.email' />"
            class="dropdown-item">My Page</a>
          <a href="/spring/member/logout" class="dropdown-item">Sign Out</a>
        </sec:authorize>
      </div>
      <!-- Security -->
    </div>
  </div>
</nav>
<!-- Navbar End -->
<div class="container-fluid pt-4 px-4 container_wrap">