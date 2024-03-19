<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>	
	<div class="container">
		<div class="header">
		<h2>내가 쓴 글</h2>
		<table class="table">
			<thead>
				<tr>
					<th><a href="/boardlist">#번호</a></th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>댓글수</th>
				</tr>
			</thead>
			<tbody>
				<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
				<c:forEach items="${list}" var="board" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="/boardview?no=${board.boardNo}" style="text-decoration: none">
						[${board.category}]&nbsp&nbsp${board.boardTitle}</a></td>
						<td>${board.member.nickname}</td>
						<td><fmt:formatDate value="${board.boardDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${board.boardViews}</td>
						<td>${board.boardLike}</td>
						<td>${board.bcCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
				<li class="page-item ${paging.prev ? '' : 'disabled'}"><a class="page-link" href="/myWriteBoard?page=${boardPaging.startPage - 1}">Previous</a></li>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
					<li class="page-item"><a class="page-link ${paging.page == page ? 'active' : ''}"
					 href="/myWriteBoard?page=${page}">${page}</a></li>
				</c:forEach>
				
				<li class="page-item ${paging.next ? '' : 'disabled'}">
				<a class="page-link" href="/myWriteBoard?page=${paging.endPage + 1}">Next</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>