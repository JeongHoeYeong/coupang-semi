<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>전국을 만나는 순간</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/reset.css" />
<link href="/resources/css/maintemplatemo.css" rel="stylesheet" />
<link href="/resources/css/main.css" rel="stylesheet" />
<link href="/resources/css/review.css" rel="stylesheet" />
<link href="/resources/css/boxicon.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/custom.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
	
<!-- SCRIPT -->
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- STYLE -->
<style>
.fa-solid {
	width: 50px;
	height: 50px;
}
</style>
</head>
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
						<a class="nav-link btn-outline-warning rounded-pill px-3"
							href="tourplace/search">여행을 만나는 순간</a></li>
						<li class="nav-item">
						<a class="nav-link btn-outline-warning rounded-pill px-3">맛집를
								만나는 순간</a></li>
						<li class="nav-item">
						<a class="nav-link btn-outline-warning rounded-pill px-3" href="/boardlist">사람을
								만나는 순간</a></li>
						<li class="nav-item">
						<a class="nav-link btn-outline-warning rounded-pill px-3">축제를
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
			<img src="resources/image/부산_해운대.jpg" class="d-block w-100" alt="..." />
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
			<img src="resources/image/경기도_수원.jpg" class="d-block w-100" alt="..." />
			<div class="carousel-caption d-none d-md-block">
				<h1>경기도</h1>
			</div>
		</div>
		<div class="carousel-item">
			<img src="resources/image/강원도_속초.jpg" class="d-block w-100" alt="..." />
			<div class="carousel-caption d-none d-md-block">
				<h1>강원도</h1>
			</div>
		</div>
	</div>
</div>
<!-- Search Start -->
<div class="container-fluid" style="padding: 35px">
	<div class="col-md-5">
		<select class="form-select py-2 text-center" id="sele" name="sele"
			onchange="selectBoxChange(this.value);">
			<option value="/" selected>순간</option>
			<option value="tourist">관광</option>
			<option value="food">맛집</option>
			<option value="stay">숙박</option>
		</select>
		<input type="text" class="form-control py-2 text-center" id="dosi" name="dosi"
			value="" onchange="changeFn()" placeholder="검색어를 입력하세요"/>
		<div class="col-md-2 px-5">
			<button class="btn btn-warning px-5" id="btn">Click!</button>
		</div>
		<span id="text"></span>
	</div>
</div>
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


<!--버튼-->

<div class="return-top">
	<a href="#"> <span class="element1">Insta </a> </span> <a href="#">
		<span class="element2">Review 
	</a> </span> <a href="#"> <span class="element3">Top </a> </span>
</div>
<!--footer 언덕-->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path fill="#198754" fill-opacity="1"
		d="M0,128L48,112C96,96,192,64,288,96C384,128,480,224,576,266.7C672,309,768,299,864,250.7C960,203,1056,117,1152,90.7C1248,64,1344,96,1392,112L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
          </svg>
<footer class="bg-success pt-4">
	<div class="container">
		<div class="row">
			<img id="member" src="resources/image/금쪽이들.png" alt="">
			<div class="col-lg-3 col-12 pt-5">
				<a class="navbar-brand" href="index.html"> <i
					class='bx bx-world bx-sm text-light'></i> <span
					class="text-light h5">전국을 만나는 순간 </span>
				</a>
				<ul class="list-unstyled text-light light-300">
					<li class="pb-2"><i class='bx-fw bx bxs-chevron-right bx-xs'></i>

						<a class="text-decoration-none text-light py-1"
						href="https://github.com/JeongHoeYeong">Jeong Hoe Yeong</a></li>
					<li class="pb-2"><i class='bx-fw bx bxs-chevron-right bx-xs'></i><a
						class="text-decoration-none text-light py-1"
						href="https://github.com/mutual99">Lee
							Sang ho</a></li>
					<li class="pb-2"><i class='bx-fw bx bxs-chevron-right bx-xs'></i><a
						class="text-decoration-none text-light py-1"
						href="https://github.com/wjdtpdud00">jeong se yeong</a>
					<li class="pb-2"><i class='bx-fw bx bxs-chevron-right bx-xs'></i><a
						class="text-decoration-none text-light py-1"
						href="https://github.com/as8285">yoon min yeong</a></li>

				</ul>

			</div>

			<div class="col-lg-3 col-md-4 my-sm-0 mt-4 pt-5">
				<h2 class="h4 pb-lg-3 text-light light-300">For Client</h2>
				<ul class="list-unstyled text-light light-300">
					<li class="pb-2"><i class='bx bxl-instagram-alt bx-xs'></i><a
						class="text-decoration-none text-light py-1"
						href="https://www.instagram.com/jeonmansoon_trip?igsh=MTQ5czhxOTBseXBuOA%3D%3D">
							@jeonmansoon_trip</a></li>
					<li class="pb-2"><i class='bx-fw bx bx-phone bx-xs'></i><a
						class="text-decoration-none text-light py-1"
						href="tel:010-020-0340">1544-9970</a></li>
					<li class="pb-2"><i class='bx-fw bx bx-mail-send bx-xs'></i><a
						class="text-decoration-none text-light py-1"
						href="mailto:info@company.com">goldsemi@company.com</a></li>

				</ul>
			</div>
		</div>
		<div class="w-100 bg-success py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-lg-5 col-sm-12">
						<p class="text-center text-light light-300">© 전국을 만나는 순간 2024
							| 금쪽같은 코딩</p>
					</div>
				</div>
			</div>
		</div>
</footer>
<!-- End Footer -->
<!-- Core theme JS-->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/mainselect.js"></script>
<script src="resources/js/tourselect.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
