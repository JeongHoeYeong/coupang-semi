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
	<h1>찾은 아이디</h1>
	<span id="searchIdText"></span>
	<a href="/login"><input type="button" value="로그인으로"></a>
	<a href="/searchId"><input type="button" value="다시 찾기"></a>
	<script src="resources/js/resultId.js"></script>
	<script src="resources/js/searchId.js"></script>
</body>
</html>