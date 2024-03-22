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
    <link href="/resources/css/board/boardwrite.css" rel="stylesheet" />
    <link href="/resources/css/board/boardview.css" rel="stylesheet">
  </head>
  <body>
  <jsp:include page="/WEB-INF/views/header.jsp" />
  <form id="checklike">
  	<input type="hidden" name="id" id="id" value="${id}">
  	<input type="hidden" name="boardNo" id="boardNo" value="${vo.boardNo}" />
  </form>

	<div class="container">
	<div class="header">
      <h2 class="boardlog">게시물 정보</h2>
      </div>
      <form action="/boardEdit" method="get">
        <input type="hidden" name="boardNo" id="boardNo" value="${vo.boardNo}" />
        <div class="form-group">
          <input
            class="form-control"
            name="boardTitle"
            value="${vo.boardTitle}"
            readonly="readonly"
          />
        </div>
        <div>
        <table style="width: 100%;">
        <tr id="boardInpo">
        <td>${vo.member.nickname}</td>  
        <td>조회수 ${vo.boardViews}</td>  
        <td><fmt:formatDate value="${vo.boardDate}"
                  pattern="yyyy-MM-dd HH:mm" /> </td>
        </tr>
        </table>
        </div>
        <div class="form-group">
          <textarea
            class="form-control"
            rows="25"
            name="boardContent"
            id="boardContent"
            style="resize: none"
            readonly="readonly"
          >
${vo.boardContent}</textarea
          >
        </div>
        <div class="boardBtnDiv">
        <div>
        <c:if test= "${empty likeBoard}">
        	<i class="fa-regular fa-heart fa-3x" id="like"></i>
        	<p class="countText">${vo.boardLike}</p>
        </c:if>
        <c:if test="${!empty likeBoard}">
        	<i class="fa-solid fa-heart fa-3x" id="disLike"></i>
        	<p class="countText">${vo.boardLike}</p>
        </c:if>
        </div>
        <div>
        <c:if test ="${!empty id}">
			<c:if test="${id eq vo.id}">
			<a class="btn btn-outline-danger boardBtnDiv" href="/boarddelete?no=${vo.boardNo}"
          >삭제</a
        >
			<a href="/boardEdit?no=${vo.boardNo}" class="btn btn-outline-warning boardBtnDiv">수정</a>
		</c:if>
		</c:if>
        <a class="btn btn-outline-warning boardBtnDiv" class="listMove" href="/boardlist">게시판</a>
        </div>
        </div>
      </form>
    </div>
    <div class="container">
    <h5 style="margin-top: 20px; margin-bottom: 15px;">댓글 ${vo.bcCount}</h5>
    <form id="bcForm">
      	 <input type="hidden" name="boardNo" id="boardNo" value="${vo.boardNo}" />
     	 <input type="hidden" name="id" id="id" value="${id}">
     	 <textarea name="bcContent" id="bcContent" class="form-control" rows="3" ></textarea>
     	 <input type="button" class="btn btn-outline-primary" id="bcWrite" value="작성" />
    </form>
      <c:forEach items="${boardComment}" var="boardComment" varStatus="status">
      	<c:choose>
      	<c:when test="${boardComment.parentNo==0}">
      		<li class="liClick">
      		<c:if test="${boardComment.bcDelete eq 'n'}">
      			작성자 : ${boardComment.member.nickname}
      			날짜 : <fmt:formatDate value="${boardComment.bcDate}"
      					pattern="yyyy-MM-dd HH:mm" />
      			<br>
      			<span class="bcContent1">글 내용 : ${boardComment.bcContent}</span>
      			<c:if test="${boardComment.id eq id}">
      			
      			<form action="/editBC" class="editContent" style="display: none;">
      			
      				<input type="hidden" value="${boardComment.bcNo}" name="bcNo">
      				<textarea name="bcContent" rows="4" cols="50">${boardComment.bcContent}</textarea>
      				<input type="submit" value="수정완료" class="editCon">
      				<input type="button" value="수정취소" class="editCan">
      			</form>
      			<input type="button" value="수정하기" class="bcEdit">
      			<form>
      				<input type="hidden" class="bcNo" value="${boardComment.bcNo}">
      				<input type="button" value="삭제하기" class="bcDelete">
      			</form>
      			</c:if>
      			</c:if>
      			<c:if test="${boardComment.bcDelete eq 'y'}">
      			삭제된 댓글입니다
      			</c:if>
      			</li>      			
				<div class="bcDiv" style="display: none; background: gray;">
					<form>
						<input type="hidden" name="boardNo"
							value="${vo.boardNo}" /> <input type="hidden" name="id"
							value="${id}">
							<input type="hidden" name="parentNo" value="${boardComment.bcNo}">
						<textarea name="bcContent" class="form-control" id="brContent"
							rows="2"></textarea>
						 <input type="button"
							class="brWrite" name="brWrite" value="작성" />
					</form>
				</div>
				<hr>
				<script>
				
				</script>
			</c:when>
      		<c:otherwise>
      			<li style="padding-left:50px;">
      			<c:if test="${boardComment.bcDelete eq 'n'}">
      			작성자 : ${boardComment.member.nickname}
      			날짜 : <fmt:formatDate value="${boardComment.bcDate}"
      					pattern="yyyy-MM-dd HH:mm" />
      			<br>
      			글 내용 : ${boardComment.bcContent}
      			<c:if test="${boardComment.id eq id}">
      			<form action="/editBC" class="editContent" style="display: none;">
      			
      				<input type="hidden" value="${boardComment.bcNo}" name="bcNo">
      				<textarea name="bcContent" rows="4" cols="50">${boardComment.bcContent}</textarea>
      				<input type="submit" value="수정완료" class="editCon">
      				<input type="button" value="수정취소" class="editCan">
      			</form>
      					<input type="button" value="수정하기" class="bcEdit">
      			<form>
      				<input type="hidden" class="bcNo" value="${boardComment.bcNo}">
      				<input type="button" value="삭제하기" class="bcDelete">
      			</form>
      			</c:if>
      			</c:if>
      			<c:if test="${boardComment.bcDelete eq 'y'}">
      				삭제된 댓글입니다
      			</c:if>
      			</li>
      			
      		<hr>
      		</c:otherwise>
      	</c:choose>
      </c:forEach>
      
      <nav>
		<ul class="pagination">
			<li class="page-item ${paging.prev ? '' : 'disabled'}"><a class="page-link" href="/boardview?no=${vo.boardNo}&page=${boardCommentPaging.startPage - 1}">Previous</a></li>
				
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
				<li class="page-item"><a class="page-link ${paging.page == page ? 'active' : ''}" href="/boardview?no=${vo.boardNo}&page=${page}">${page}</a></li>
			</c:forEach>
				
			<li class="page-item ${paging.next ? '' : 'disabled'}"><a class="page-link" href="/boardview?no=${vo.boardNo}&page=${paging.endPage + 1}">Next</a></li>
			</ul>
		</nav>
		</div>

      
    <script src="/resources/js/board/boardview.js"></script>
  </body>
</html>
