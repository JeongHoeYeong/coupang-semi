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

<!-- boot cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<sec:authentication property="principal" var="member" />

<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
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
	<div class="container-fluid" style="padding: 35px">
		<div class="col-md-5">
			<select class="form-select py-2 text-center" id="sele"
				onchange="changeFn()">
				<option value="" selected>순간</option>
				<option value="tourist">관광</option>
				<option value="food">맛집</option>
			</select> 
		
	<div class="col-md-5">
	<input type="text" class="form-control py-2" placeholder="검색어를 입력하세요">
	</div>
			</select>
			<div class="col-md-2 px-5">
				<button class="btn btn-warning px-5" id="btn">Click!</button>
			
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
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
	<!-- Core theme JS-->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/mainselect.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
