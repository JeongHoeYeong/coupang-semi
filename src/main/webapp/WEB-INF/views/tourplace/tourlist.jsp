<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<style type="text/css">
		.tourplaceMainImg{
			width: 100px;
			height: 70px;
		}
	</style>
</head>
<body>

<h1>관광지 목록</h1>
<table>
		<tr>
			<th>번호</th>
			<th>관광지명</th>
			<th>관광지 주소</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.touristCode}</td>
				<td>${item.touristName}</td>
				<td>${item.touristAddress}</td>
				<td>${item.look}</td>
				<td>${item.imgTag}</td>
				<td>aaa</td>
			</tr>
		</c:forEach>
	</table>


<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
