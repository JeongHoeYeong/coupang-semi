<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- review CSS -->
<link rel="stylesheet" href="/resources/css/review.css" />
<!-- reset CSS -->
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
</head>
<body>
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
							href="https://github.com/mutual99/gold-semi-sangho534">Lee
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
						<p class="text-center text-light light-300">© 전국을 만난는 순간 2024
							| 금쪽같은 코딩</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	</footer>
	
</body>
</html>