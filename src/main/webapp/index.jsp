<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal" var="member" />
	${member}
	<ul>
		<li><a href="/all">전체 페이지</a></li>
		<c:choose>
			<c:when test="${member == 'anonymousUser'}">
				<li><a href="/login">로그인</a></li>
				<li><a href="/register">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/member">회원 페이지</a>
				<li><a href="/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>