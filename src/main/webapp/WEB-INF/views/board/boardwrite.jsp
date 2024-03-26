<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="/resources/css/board/boardwrite.css" rel="stylesheet" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <div class="container">
      <div class="header">
      <h2 class="boardlog">게시물 등록</h2>
      </div>
      <form action="/boardwrite" method="post" onsubmit="return writeBoard()">
        <div class="form-group">
          <input class="form-control" name="boardTitle" id="boardTitle" placeholder="제목"/>
        </div>
        <div class="form-group">
          <textarea
            class="form-control"
            name="boardContent"
            id="boardContent"
            placeholder="내용을 입력하세요."
          ></textarea>
        </div>
        카테고리 :
        <select name="category" id="category" class="form-select form-select-md mb-3">
          <option value="none" selected="selected" disabled="disabled" hidden>카테고리 선택</option>
          <option value="관광지">관광지</option>
          <option value="음식점">음식점</option>
          <option value="동행">동행</option>
          <option value="기타">기타</option>
        </select>
         <button
          type="submit"
          class="btn btn-outline-warning"
          onclick="subimt()"
          id="baordSubmit"
        >
          게시글 등록
        </button>
        <a href="/boardlist" class="btn btn-outline-secondary" id="bwcan">취소</a>
      </form>
    </div>
    <script src="/resources/js/board/boardwrite.js"></script>
  </body>
</html>
