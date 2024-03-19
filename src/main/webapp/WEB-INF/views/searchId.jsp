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
	<form method="post" action="/resultId">
		<input type="text" id="name" name="name" placeholder="name" /> <br />
		<input type="text" id="phone" name="phone" placeholder="phone" /> <br />
		<input type="submit" id="btn" value="찾기" />
	</form>
		<span id="searchIdText"></span>
	<script src="resources/js/searchId.js"></script>
</body>
</html>