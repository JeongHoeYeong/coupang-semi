<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="../../../css/board/boardlist.css" rel="stylesheet" />
  </head>
  <body>
   <jsp:include page="/WEB-INF/views/header.jsp" />
    <sec:authentication property="principal" var="member" />
    <div class="container">
      <div class="header">
        <h1>List Page</h1>

        <c:choose>
          <c:when test="${member == 'anonymousUser'}">
            <a href="/login" class="btn btn-outline-warning">게시글 등록</a>
          </c:when>
          <c:otherwise>
            <a href="myWriteBoard" class="btn btn-outline-warning"
              >내 글 보기</a
            >
            <a href="/boardwrite" class="btn btn-outline-warning"
              >게시글 등록</a
            >
          </c:otherwise>
        </c:choose>
        <a class="btn btn-outline-warning" href="/">메인으로</a>
      </div>

      <table class="table">
        <thead>
          <tr>
            <th><a href="/boardlist">#번호</a></th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th><a href="/boardlist?sort=board_views">조회수</a></th>
            <th><a href="/boardlist?sort=board_like">추천수</a><i class="fa-solid fa-sort-down fa-xm"
            style="<c:if test="${sort eq 'board_like'}">color: orangered;</c:if>"></i></th>
          </tr>
        </thead>
        <tbody>
          <!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
          <c:forEach items="${list}" var="board" varStatus="status">
            <tr>
              <td>${status.count}</td>
              <td>
                <a
                  href="/boardview?no=${board.boardNo}"
                  style="text-decoration: none"
                >
                  [${board.category}]&nbsp&nbsp${board.boardTitle}
                  <c:if test="${board.bcCount ne 0}">
                    <small><b class="bc-count">[${board.bcCount}]</b></small>
                  </c:if>
                </a>
              </td>
              <td>${board.member.nickname}</td>
              <td>
                <fmt:formatDate
                  value="${board.boardDate}"
                  pattern="yyyy-MM-dd HH:mm"
                />
              </td>
              <td>${board.boardViews}</td>
              <td>${board.boardLike}</td>
              <td></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <nav>
        <ul class="pagination">
          <li class="page-item ${boardPaging.prev ? '' : 'disabled'}">
            <a
              class="page-link"
              href="/boardlist?category=${category}&sort=${sort}&page=${boardPaging.startPage - 1}"
              >Previous</a
            >
          </li>

          <c:forEach
            begin="${boardPaging.startPage}"
            end="${boardPaging.endPage}"
            var="page"
          >
            <li class="page-item">
              <a
                class="page-link ${boardPaging.page == page ? 'active' : ''}"
                href="/boardlist?category=${category}&sort=${sort}&page=${page}"
                >${page}</a
              >
            </li>
          </c:forEach>

          <li class="page-item ${boardPaging.next ? '' : 'disabled'}">
            <a
              class="page-link"
              href="/boardlist?category=${category}&sort=${sort}&page=${boardPaging.endPage + 1}"
              >Next</a
            >
          </li>
        </ul>
      </nav>
    </div>
    <form
      action="/boardSearch"
      id="findBoard"
      onsubmit="return searchBoard();"
      style="text-align: center; margin-bottom: 50px;"
    >
      <select
        class="form-select"
        name="select"
        id="select"
        style="display: inline; width: 150px;"
      >
        <option value="all">제목+내용</option>
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="nickname">글쓴이</option>
      </select>

      <input type="text" name="keyword" id="keyword" />
      <input type="submit" value="검색" id="search" style="margin-left: 0px"/>
      <br />
      태그선택 &nbsp: &nbsp 
      <input
        type="radio"
        class="btn-check"
        name="category"
        id="전체"
        value="전체"
        autocomplete="off"
        checked
      />
      <label class="btn btn-secondary" for="전체">전체</label>

      <input
        type="radio"
        class="btn-check"
        name="category"
        id="관광지"
        value="관광지"
        autocomplete="off"
      />
      <label class="btn btn-secondary" for="관광지">관광지</label>

      <input
        type="radio"
        class="btn-check"
        name="category"
        id="음식점"
        value="음식점"
        autocomplete="off"
      />
      <label class="btn btn-secondary" for="음식점">음식점</label>

      <input
        type="radio"
        class="btn-check"
        name="category"
        id="동행"
        value="동행"
        autocomplete="off"
      />
      <label class="btn btn-secondary" for="동행">동행</label>

      <input
        type="radio"
        class="btn-check"
        name="category"
        id="기타"
        value="기타"
        autocomplete="off"
      />
      <label class="btn btn-secondary" for="기타">기타</label>
    </form>
    <script>
      function searchBoard() {
        if ($.trim($("#keyword").val()).length == 0) {
          alert("내용을 입력해주세요");
          return false;
        }
        return true;
      }
    </script>
  </body>
</html>
