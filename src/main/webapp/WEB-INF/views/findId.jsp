<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="resources/css/register.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
h1 {
	margin-top: 50px;
}

#one {
	text-align: center;
}

#find, #cancle {
	padding: auto;
	margin-left: 3px;
	width: 49%;
	background-color: blanchedalmond;
	color: black;
	font-size: medium;
	font-weight: bold;
}

label {
	font-weight: bold;
}

#email {
	margin-bottom: 40px;
}

#resultText {
	font-weight: bold;
	margin: auto;
	display: block;
	height: 20px;
	text-align: center;
	font-size: large;
}
</style>
</head>
<body>
	<!-- 1. 로고 -->
	<div id="one">
		<a href="/"> <img src="resources/image/logobackclear.png" /></a>
	</div>
	<form id="frm" method="POST">
		<div class="member">
			<h1 id="one">아이디 찾기</h1>
			<section class="form-search">
				<div class="find-name">
					<label>이름</label> <input type="text" name="name" id="name" value=""
						placeholder="등록한 이름"> <br>
				</div>
				<div class="find-phone">
					<label>이메일</label> <input type="text" name="email" id="email"
						value="" placeholder="이메일 입력">
				</div>
				<div class="btnSearch">
					<input type="button" name="enter" value="찾기" id="find"> <a
						href="/login"><input type="button" name="cancle" value="로그인"
						id="cancle"></a>
				</div>
			</section>
			<h1 id="one">아이디 찾기 결과</h1>
			<div id="resultText"></div>
		</div>
	</form>

	<div id="resultText"></div>
	<script src="/resources/js/findId.js"></script>
</body>
</html>