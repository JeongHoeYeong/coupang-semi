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
    <link href="/resources/css/board/boardlist.css" rel="stylesheet" />
  </head>
  <body>
   <jsp:include page="/WEB-INF/views/header.jsp" />
    <sec:authentication property="principal" var="member" />
    <div class="container">
      <div class="header">
        <a href="/boardlist" class="boardlog">사람을 만나는 순간</a>
      </div>

      <table class="table">
        <thead>
          <tr>
            <th><a href="/boardlist?category=${category}">#번호
            <i class="fa-solid fa-sort-down fa-xm"
            style="<c:if test="${sort ne 'board_like' && sort ne 'board_views'}">color: orangered;</c:if>"></i></a></th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            
            <th><a href="/boardlist?sort=board_views&category=${category}">조회수
            <i class="fa-solid fa-sort-down fa-xm"
            style="<c:if test="${sort eq 'board_views'}">color: orangered;</c:if>"></i></a></th>
           
            <th><a href="/boardlist?sort=board_like&category=${category}">추천수
            <i class="fa-solid fa-sort-down fa-xm"
            style="<c:if test="${sort eq 'board_like'}">color: orangered;</c:if>"></i></a></th>
          </tr>
        </thead>
        <tbody>
          <!--  현재 주소에 있는 거 긁어서 같이 넘기고,거기서 계속 넘기면 다시 유지해서 올 수 있음 -->
          <c:forEach items="${list}" var="board" varStatus="status">
            <tr onclick="locationView(${board.boardNo})">
              <td>${board.boardNo}</td>
              <td>
                  <span class="category">[${board.category}]</span> &nbsp&nbsp${board.boardTitle}
                  <c:if test="${board.bcCount ne 0}">
                    <small><b class="bc-count">&nbsp[${board.bcCount}]</b></small>
                  </c:if>
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
      <nav style="text-align: center;">
       <c:choose>
		<c:when test="${member == 'anonymousUser'}">
        <button class="btn btn-outline-warning" style="float:left;"
        onclick="loginAlert()"
        >내 글 보기</button>
        </c:when>
        <c:otherwise>
      <a href="myWriteBoard" class="btn btn-outline-warning" style="float: left;"
              >내 글 보기</a>
              </c:otherwise>
              </c:choose>
        <ul class="pagination" 
        style="display:inline-flex;">
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
        <c:choose>
		<c:when test="${member == 'anonymousUser'}">
        <button class="btn btn-outline-warning" style="float:right;"
        onclick="loginAlert()"
        >글 쓰기</button>
        </c:when>
        	<c:otherwise>
        	<a href="/boardwrite" class="btn btn-outline-warning" style="float:right;">글 쓰기</a>
        	</c:otherwise>
      	</c:choose>
      </nav>
    </div>
    <form
      action="/boardSearch"
      id="findBoard"
      onsubmit="return searchBoard();"
    >
      <select
        class="form-select"
        name="select"
        id="select"
      >
        <option value="all">제목+내용</option>
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="nickname">글쓴이</option>
      </select>

	<div id="searchForm">
      <input type="text" name="keyword" id="keyword" class="form-control form-control-sm"
      placeholder="검색어를 입력해 주세요."
      autocomplete="off"/>
      <button type="submit" id="boardSearch">
      <i class="fa-solid fa-magnifying-glass"></i>
      </button>
     </div>
      <br />
      태그선택 &nbsp: &nbsp
      <a href="/boardlist?sort=${sort}" class="btn btn-secondary">전체</a> 
      <a href="/boardlist?sort=${sort}&category=관광지" class="btn btn-secondary">관광지</a>  
      <a href="/boardlist?sort=${sort}&category=음식점" class="btn btn-secondary">음식점</a> 
      <a href="/boardlist?sort=${sort}&category=동행" class="btn btn-secondary">동행</a> 
      <a href="/boardlist?sort=${sort}&category=기타" class="btn btn-secondary">기타</a> 
      </form>
    <script src="/resources/js/board/boardlist.js"></script>
  </body>
</html>
