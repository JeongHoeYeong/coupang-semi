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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form id="frm" method="POST">
			<div class = "search-title">
				<h3>휴대폰 본인확인</h3>
			</div>
		<section class="form-search">
			<div class="find-name">
				<label>이름</label>
				<input type="text" name="name" id="name" 
				value="" placeholder="등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>이메일</label>
				<input type="text" name="email" id="email"
				value="" placeholder="이메일 입력">
			</div>
			<br>
	</section>
	<div class="btnSearch">
		<input type="button" name="enter" value="찾기" id="find">
		<a href="/login"><input type="button" name="cancle" value="취소" ></a>
 	</div>
 </form>
 <div id="resultText"></div>
<script src="/resources/js/findId.js"></script>
</body>
</html>