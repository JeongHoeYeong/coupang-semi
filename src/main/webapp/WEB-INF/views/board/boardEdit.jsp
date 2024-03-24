<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="/resources/css/board/boardwrite.css" rel="stylesheet" />

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container">
	<div class="header">
		<h2 class="boardlog">게시물 수정</h2>
		</div>
		<form action="/boardUpdate" method="get" onsubmit="return checkBoard();">
		<input type="hidden" value="${board.boardNo}" name="boardNo">
			<div class="form-group">
				<input class="form-control" name="boardTitle" id="boardTitle" placeholder="제목" value="${board.boardTitle}">
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="20" name="boardContent" 
				id="boardContent" placeholder="내용을 입력하세요.">${board.boardContent}</textarea>
			</div>
			<select name="category" id="category" class="form-select form-select-md mb-3">
          <option value="none" selected="selected" disabled="disabled" hidden>카테고리 선택</option>
          <option value="관광지">관광지</option>
          <option value="음식점">음식점</option>
          <option value="동행">동행</option>
          <option value="기타">기타</option>
       	 </select>
			<button type="submit" class="btn btn-outline-warning" id="baordSubmit">수정</button>
			<a href="/boardview?no=${board.boardNo}" class="btn btn-outline-secondary" id="bwcan">취소</a>
		</form>
	</div>
	<script src="/resources/js/board/boardwrite.js"></script>
</body>
</html>