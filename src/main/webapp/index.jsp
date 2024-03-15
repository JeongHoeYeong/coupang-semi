<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Purple Buzz HTML Template with Bootstrap 5 Beta 1</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Load Tempalte CSS -->
<link href="resources/css/templatemo.css" rel="stylesheet" />
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link href="resources/css/review.css" rel="stylesheet" />

<!-- Font CSS -->
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<link href="resources/css/boxicon.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="resources/css/custom.css" />
<!-- reset CSS -->
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<!-- boot cdn -->
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.fa-solid {
	width: 50px;
	height: 50px;
}
</style>

</head>
<body>
	<sec:authentication property="principal" var="member" />
	<!-- Header -->
	<nav id="main_nav"
		class="navbar navbar-expand-lg navbar-light bg-white shadow">
		<div
			class="container d-flex justify-content-between align-items-center">
			<a class="navbar-brand h1" href="/"> <img
				src="resources/image/로고 (2).jpg" alt="" />
				<div class="main">
					<div class="animation">
						<span class="one_text">전국을 만나는 순간</span><span class="two_text">전
							만 순</span>
					</div>
				</div>
			</a>
			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between"
				id="navbar-toggler-success">
				<div class="flex-fill mx-xl-5 mb-2">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-xl-5 text-center text-dark">
						<li class="nav-item">
						<a class="nav-link btn-outline-success rounded-pill px-3"
							href="tourplace/search">여행을 만나는 순간</a></li>
						<li class="nav-item">
						<a class="nav-link btn-outline-success rounded-pill px-3">맛집를
								만나는 순간</a></li>
						<li class="nav-item">
						<a class="nav-link btn-outline-success rounded-pill px-3">숙소를
								만나는 순간</a></li>
						<li class="nav-item">
						<a class="nav-link btn-outline-success rounded-pill px-3">축제를
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

	<!-- careousel -->
	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="4" aria-label="Slide 5"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="5" aria-label="Slide 6"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="6" aria-label="Slide 7"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="7" aria-label="Slide 8"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="8" aria-label="Slide 9"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="9" aria-label="Slide 10"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="10" aria-label="Slide 11"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/image/충청북도_단양.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>충청북도</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/제주특별시.jpg" class="d-block w-100" alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>제주특별시</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/전라북도_전주.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>전라북도</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/전라남도_광주.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>전라남도</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/인천_소래포구.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>인천</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/서울.jpg" class="d-block w-100" alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>서울</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/부산_해운대.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>부산</h1>
				</div>
			</div>

			<div class="carousel-item">
				<img src="resources/image/경상북도_경주.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>경상북도</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/경상남도_통영.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>경상남도</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/경기도_수원.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>경기도</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/image/강원도_속초.jpg" class="d-block w-100"
					alt="..." />
				<div class="carousel-caption d-none d-md-block">
					<h1>강원도</h1>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Search Start -->

	<div class="container-fluid wow fadeIn" data-wow-delay="0.1s"
		style="padding: 35px">
		<div class="container">
			<div class="row g-2">
				<div class="col-md-10">
					<div class="row g-2">
						<div class="col-md-4">

						</div>
						<div class="col-md-4">
							<select class="form-select py-3" id="sele" onchange="changeFn()">
								<option value="" selected>순간</option>
								<option value="tourist">여행지</option>
								<option value="food">맛집</option>
								<option value="stay">숙박</option>
							</select>
						</div>
						<div class="col-md-4">
							<select class="form-select py-3" id="dosi" onchange="changeFn()">
								<option value="" selected>위치</option>
								<option value="서울">서울</option>
								<option value="경기">경기도</option>
								<option value="충북">충청북도</option>
								<option value="충남">충청남도</option>
								<option value="전북">전라북도</option>
								<option value="전남">전라남도</option>
								<option value="경북">경상북도</option>
								<option value="경남">경상남도</option>
								<option value="부산">부산</option>
								<option value="제주">제주도</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<button class="btn btn-outline-warning border-0 w-100 py-3"
						id="btn">Click</button>
				</div>
			</div>
			<p id="text"></p>
		</div>

		<!-- Search End -->
		<!-- Start Recent Work -->
		<section class="container overflow-hidden py-5">
			<div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-5 pb-3 projects">
				<div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="service card-img" src="resources/image/3.png"
						alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-dark"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/1.jpg" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-dark"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project branding">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/2.png" alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-light"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/4.jpg" alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-light"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/5.jpg" alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-light"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project branding">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/6.jpg" alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-light"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project branding">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/7.jpg" alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-light"></div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-4 col-sm-6 project ui graphic branding">
					<a href="#"
						class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
						<img class="card-img" src="resources/image/8.jpg" alt="Card image" />
						<div
							class="service-work-vertical card-img-overlay d-flex align-items-end">
							<div class="service-work-content text-left text-light"></div>
						</div>
					</a>
				</div>
			</div>
		</section>
		<div class="flow-container">
			<div class="flow-text">
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;'˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
				<div class="flow-wrap">⯎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전국을 만나는
					순간,&nbsp;&nbsp;˗ˋˏ전ˎˊ˗˗ˋˏ만ˎˊ˗˗ˋˏ순ˎˊ˗</div>
			</div>
		</div>




		<!-- Footer -->
		<footer class="bg-secondary pt-4">
			<div class="container">
				<div class="row py-4">
					<div class="col-lg-3 col-12 align-left">
						<a class="navbar-brand" href="/"> <i
							class="bx bx-buildings bx-sm text-light"></i> <span
							class="text-light h5">Purple</span> <span
							class="text-light h5 semi-bold-600">Buzz</span>
						</a>
						<p class="text-light my-lg-4 my-2">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt
							ut.</p>
						<ul class="list-inline footer-icons light-300">
							<li class="list-inline-item m-0"><a class="text-light"
								target="_blank" href="http://facebook.com/">
									<i class="bx bxl-facebook-square bx-md"></i>
							</a></li>
							<li class="list-inline-item m-0"><a class="text-light"
								target="_blank" href="https://www.linkedin.com/">
									<i class="bx bxl-linkedin-square bx-md"></i>
							</a></li>
							<li class="list-inline-item m-0"><a class="text-light"
								target="_blank" href="https://www.whatsapp.com/">
									<i class="bx bxl-whatsapp-square bx-md"></i>
							</a></li>
							<li class="list-inline-item m-0"><a class="text-light"
								target="_blank" href="https://www.flickr.com/">
									<i class="bx bxl-flickr-square bx-md"></i>
							</a></li>
							<li class="list-inline-item m-0"><a class="text-light"
								target="_blank" href="https://www.medium.com/">
									<i class="bx bxl-medium-square bx-md"></i>
							</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-4 my-sm-0 mt-4">
						<h3 class="h4 pb-lg-3 text-light light-300">Our Company</h3>
						<ul class="list-unstyled text-light light-300">
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light" href="/">Home</a></li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="about.html">About
									Us</a></li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="work.html">Work</a>
							</li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="pricing.html">Price</a>
							</li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="contact.html">Contact</a>
							</li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-4 my-sm-0 mt-4">
						<h2 class="h4 pb-lg-3 text-light light-300">Our Works</h2>
						<ul class="list-unstyled text-light light-300">
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="#">Branding</a>
							</li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="#">Business</a>
							</li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="#">Marketing</a>
							</li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="#">Social
									Media</a></li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="#">Digital
									Solution</a></li>
							<li class="pb-2"><i class="bx-fw bx bxs-chevron-right bx-xs"></i><a
								class="text-decoration-none text-light py-1" href="#">Graphic</a>
							</li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-4 my-sm-0 mt-4">
						<h2 class="h4 pb-lg-3 text-light light-300">For Client</h2>
						<ul class="list-unstyled text-light light-300">
							<li class="pb-2"><i class="bx-fw bx bx-phone bx-xs"></i><a
								class="text-decoration-none text-light py-1"
								href="tel:010-020-0340">010-020-0340</a></li>
							<li class="pb-2"><i class="bx-fw bx bx-mail-send bx-xs"></i><a
								class="text-decoration-none text-light py-1"
								href="mailto:info@company.com">info@company.com</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="w-100 bg-primary py-3">
				<div class="container">
					<div class="row pt-2">
						<div class="col-lg-6 col-sm-12">
							<p class="text-lg-start text-center text-light light-300">©
								Copyright 2021 Purple Buzz Company. All Rights Reserved.</p>
						</div>
						<div class="col-lg-6 col-sm-12">
							<p class="text-lg-end text-center text-light light-300">
								Designed by <a rel="sponsored"
									class="text-decoration-none text-light"
									href="https://templatemo.com/" target="_blank"><strong>TemplateMo</strong></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- End Footer -->
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
		<script src="resources/js/mainselect.js"></script>
		<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
