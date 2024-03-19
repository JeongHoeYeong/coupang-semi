<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	h1 {
		margin-top: 70px;
	}
	.form-group {
		margin: 20px 0;
	}
</style>
</head>
<body>
<div class="container">
		<h1>게시물 수정</h1>
		<form action="/boardUpdate" method="get">
		<input type="hidden" value="${board.boardNo}" name="boardNo">
			<div class="form-group">
			<select name="category" id="category">
				<option value="관광지">관광지</option>
				<option value="숙소">숙소</option>
				<option value="음식점">음식점</option>
				<option value="기타">기타</option>
			</select>
				<label>Title</label>
				<input class="form-control" name="boardTitle" value="${board.boardTitle}">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" row="10" name="boardContent">${board.boardContent}</textarea>
			</div>
			<button type="submit" class="btn btn-outline-warning">수정</button>
		</form>
	</div>
</body>
</html></html>