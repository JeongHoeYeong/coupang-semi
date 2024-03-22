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
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<link href="/resources/css/board/boardlist.css" rel="stylesheet" />
	<link href="/resources/css/board/myWriteBoard.css" rel="stylesheet" />
</head>
<body>	
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container">
		<div class="header">
		<a href="/myWriteBoard" class="boardlog">내가 쓴 글</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th><a href="/boardlist">#번호</a></th>
					<th colspan="2">제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
				<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
				<c:forEach items="${list}" var="board" varStatus="status">
					<tr>
						<td>${board.boardNo}</td>
						<td><a href="/boardview?no=${board.boardNo}" style="text-decoration: none">
						[${board.category}]&nbsp&nbsp${board.boardTitle}</a></td>
						<td>${board.member.nickname}</td>
						<td><fmt:formatDate value="${board.boardDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${board.boardViews}</td>
						<td>${board.boardLike}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav style="text-align: center;">
		<a href="/boardlist" class="btn btn-outline-warning" style="float:left;"
        >돌아가기</a>
			<ul class="pagination" style="display:inline-flex;">
				<li class="page-item ${paging.prev ? '' : 'disabled'}"><a class="page-link" href="/myWriteBoard?page=${boardPaging.startPage - 1}">Previous</a></li>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
					<li class="page-item"><a class="page-link ${paging.page == page ? 'active' : ''}"
					 href="/myWriteBoard?page=${page}">${page}</a></li>
				</c:forEach>
				
				<li class="page-item ${paging.next ? '' : 'disabled'}">
				<a class="page-link" href="/myWriteBoard?page=${paging.endPage + 1}">Next</a></li>
			</ul>
			<a href="/boardwrite" class="btn btn-outline-warning" style="float:right;">게시글 등록</a>
		</nav>
	</div>
	<script src="/resources/js/board/myWriteBoard.js"></script>
</body>
</html>