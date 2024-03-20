<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
		<h1>게시물 등록</h1>	
		<form action="/boardwrite" method="post">
			<div class="form-group">
			<input type="file" name="file">
			<select name="category" id="category">
				<option value="관광지">관광지</option>
				<option value="음식점">음식점</option>
				<option value="동행">동행</option>
				<option value="기타">기타</option>
			</select>
				<label>Title</label>
				<input class="form-control" name="boardTitle">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" rows="20" name="boardContent"></textarea>
			</div>
			<button type="submit" class="btn btn-outline-warning" onclick="subimt()">등록</button>
		</form>
	</div>
</body>
</html>