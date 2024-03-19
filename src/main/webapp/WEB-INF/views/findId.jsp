<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form method="post">
		<input type="text" name="name" id="name" placeholder="name" value="">
		<input type="text" name="email" id="email" placeholder="email" value="">
		<input type="submit" id="find" name="find" value="찾기" >
		<a href="/login"><input type="button" name="cancle" value="취소" ></a>
		<span id="findidText"></span>
	</form>
<script src="/resources/js/findId.js"></script>
</body>
</html>