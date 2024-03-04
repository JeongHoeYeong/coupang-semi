<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
	<style>
		h1 {
			margin-top: 70px;
		}
		.form-group {
			margin: 20px 0;
		}
		img {
			width: 200px;
		}
	</style>
</head>
<body>
<div class="container">
		<h1>게시물 정보</h1>
		<form action="/boardupdate" method="post">
			<input type="hidden" name="boardNo" value="${vo.boardNo}">
			<div class="form-group">
				<label>Title</label>
				<input class="form-control" name="boardTitle" value="${vo.boardTitle}">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" row="10" name="boardContent" style="resize:none;">${vo.boardContent}</textarea>
			</div>
			
			<button type="submit" class="btn btn-outline-warning">수정</button>
			<a class="btn btn-outline-danger" href="/boarddelete?no=${vo.boardNo}">삭제</a>
			<a class="btn btn-outline-danger" href="/boardlist">게시판</a>
		</form>
	</div>
</body>
</html>