<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>비밀번호 변경하기</h1>

	<form action="/searchUpdate" method="post">
		<div class="member">
			<div class="field">
				<input type="hidden" id="id" name="id" value="${id}" />
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="password" type="password" name="password"
					id="password" placeholder="비밀번호 입력" /> 
					<span id="passwordText" style="height: 20px; display: block;"></span>
			</div>
			<div>
				<input type="submit" value="변경하기" />
			</div>
		</div>
	</form>
	<script src="/resources/js/findpwd2.js"></script>
</body>
</html>