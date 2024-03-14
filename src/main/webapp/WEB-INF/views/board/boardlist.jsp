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
</head>
<body>
	<sec:authentication property="principal" var="member" />
	<div class="container">
		<div class="header">
			<h1>List Page</h1>
			
			<c:choose>
				<c:when test="${member == 'anonymousUser'}">
					<a href="/login" class="btn btn-outline-warning">게시글 등록</a>
				</c:when>
				<c:otherwise>
					<a href="/boardwrite" class="btn btn-outline-warning">게시글 등록</a>
				</c:otherwise>
			</c:choose>
			 <a class="btn btn-outline-warning" href="/">메인으로</a>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>#번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th><a href="/boardlist?sort=board_views">조회수</a></th>
					<th><a href="/boardlist?sort=board_like">추천수</a></th>
					<th><a href="/boardlist?sort=bc_count">댓글수</a></th>
				</tr>
			</thead>
			<tbody>
				<!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
				<c:forEach items="${list}" var="board" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="/boardview?no=${board.boardNo}">${board.boardTitle}</a></td>
						<td>${board.id}</td>
						<td><fmt:formatDate value="${board.boardDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${board.boardViews}</td>
						<td>${board.boardLike}</td>
						<td>${board.bcCount}</td>
						<td>
						<c:if test="${member != 'anonymousUser'}">
						<c:if test="${member.id eq board.id}">
						<a href="/boardwrite">수정하기</a>
						</c:if>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
				<li class="page-item ${paging.prev ? '' : 'disabled'}"><a class="page-link" href="/boardlist?page=${boardPaging.startPage - 1}&sort=${paging.sort}">Previous</a></li>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
					<li class="page-item"><a class="page-link ${paging.page == page ? 'active' : ''}" href="/boardlist?sort=${sort}&page=${page}">${page}</a></li>
				</c:forEach>
				
				<li class="page-item ${paging.next ? '' : 'disabled'}"><a class="page-link" href="/boardlist?page=${paging.endPage + 1}">Next</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>