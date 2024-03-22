<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/bootstrap.bundle.min.js"></script>

<script src="/resources/js/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<!-- Load Tempalte CSS -->

<link href="/resources/css/maintemplatemo.css" rel="stylesheet" />
<link href="/resources/css/main.css" rel="stylesheet" />
<link href="/resources/css/review.css" rel="stylesheet" />

<!-- Font CSS -->
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<link href="/resources/css/boxicon.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/css/custom.css" />
<!-- reset CSS -->
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<link rel="apple-touch-icon" sizes="57x57" href="/resources/image/favicon.ico">
</head>
<body>
<sec:authentication property="principal" var="member" />
	<!-- Header -->
	<header>
		<nav id="main_nav"
			class="navbar navbar-expand-lg navbar-light bg-white shadow">
			<div
				class="container d-flex justify-content-between align-items-center">
				<a class="navbar-brand" href="/"> <img
					src="/resources/image/로고 (2).jpg" alt="" />
					<div class="main">
						<div class="animation">
							<span class="one_text">전국을 만나는 순간 &nbsp;&nbsp;</span> <span
								class="two_text"> 전 만 순</span>
						</div>
					</div>
				</a>
				<button class="navbar-toggler border-0" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbar-toggler-warning"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div
					class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between"
					id="navbar-toggler-warning">
					<div class="flex-fill mx-xl-6 mb-2 ">
						<ul
							class="nav navbar-nav d-flex justify-content-between mx-xl-5 text-center text-dark">
							<li class="nav-item"><a
								class="nav-link btn-outline-warning rounded-pill px-3"
								href="/tourplace/search">여행을 만나는 순간</a></li>
							<li class="nav-item"><a
								class="nav-link btn-outline-warning rounded-pill px-3" href="/restaurant/search">맛집을
									만나는 순간</a></li>
							<li class="nav-item"><a
								class="nav-link btn-outline-warning rounded-pill px-3">숙소를
									만나는 순간</a></li>
							<li class="nav-item"><a
								class="nav-link btn-outline-warning rounded-pill px-3">축제를
									만나는 순간</a></li>
						</ul>
					</div>
					<div class="navbar align-self-center d-flex">
						<c:choose>
							<c:when test="${member == 'anonymousUser'}">
								<a class="nav-link" href="/login"><i
									class="fa-solid fa-right-to-bracket fa-2x"></i></a>
								<!-- 로그인 -->
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/member"><i
									class="fa-solid fa-house fa-2x"></i></a>
								<!-- 마이페이지 -->
								<a class="nav-link" href="/logout"><i
									class="fa-solid fa-right-from-bracket fa-2x"></i></a>
								<!-- 로그아웃 -->
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</nav>
	</header>
	
</body>
</html>