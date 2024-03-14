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
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"/>
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
  <form id="checklike">
  	<input type="hidden" name="id" id="id" value="${id}">
  	<input type="hidden" name="boardNo" id="boardNo" value="${vo.boardNo}" />
  </form>

	<div class="container">
      <h1>게시물 정보</h1>
      <form action="/boardupdate" method="post">
        <input type="hidden" name="boardNo" id="boardNo" value="${vo.boardNo}" />
        <div class="form-group">
          <label>Title</label>
          <input
            class="form-control"
            name="boardTitle"
            value="${vo.boardTitle}"
          />
        </div>
        <div class="form-group">
          <label>Content</label>
          <textarea
            class="form-control"
            row="10"
            name="boardContent"
            style="resize: none"
          >
${vo.boardContent}</textarea
          >
        </div>
        <c:if test ="${!empty id}">
        <c:if test= "${empty likeBoard}">
        	<input type="button" value="추천" id="like">
        </c:if>
        <c:if test="${!empty likeBoard}">
        	<input type="button" value="추천취소" id="disLike">
        </c:if>
			<c:if test="${id eq vo.id}">
			<button type="submit" class="btn btn-outline-warning">수정</button>
        <a class="btn btn-outline-danger" href="/boarddelete?no=${vo.boardNo}"
          >삭제</a
        >
		</c:if>
		</c:if>
        <a class="btn btn-outline-danger" href="/boardlist">게시판</a>
      </form>

    </div>
      <c:forEach items="${boardComment}" var="boardComment" varStatus="status">
      	<c:choose>
      	<c:when test="${boardComment.parentNo==0}">
      		<li class="liClick" style="cursor: pointer;">
      			아이디 : ${boardComment.id}
      			날짜 : <fmt:formatDate value="${boardComment.bcDate}"
      					pattern="yyyy-MM-dd HH:mm" />
      			<br>
      			글 내용 : ${boardComment.bcContent}
      			</li>      			

				<div class="replyDiv" style="display: none; background: gray;">
				
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
      			아이디 : ${boardComment.id}
      			날짜 : <fmt:formatDate value="${boardComment.bcDate}"
      					pattern="yyyy-MM-dd HH:mm" />
      			<br>
      			글 내용 : ${boardComment.bcContent}
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
      
     <form id="boardContent">
      <h2>댓글 작성</h2>
      	 <input type="hidden" name="boardNo" id="boardNo" value="${vo.boardNo}" />
     	 <input type="hidden" name="id" id="id" value="${id}">
     	 <textarea name="bcContent" id="bcContent" class="form-control" rows="10" ></textarea>
     	 <input type="button" id="bcWrite" value="작성" />
    </form>
    
    <script>
    $("#bcWrite").click((e) => {
    	if(document.querySelector("#id").value==""){
    		alert("로그인 후 이용 가능합니다");
    		return false;
    	} else if($(e.target).siblings("textarea").val() == ""){
    		alert("글을 작성해주세요");
    		return false;
    	}
    		$.ajax({
    			type: 'post',
    			url: '/insertBc',
    			data: $("#boardContent").serialize(),
    			success:function(data) {
    				location.reload();
    			}
    		});
    	})
    
   $(".brWrite").click((e) => {
	   if(document.querySelector("#id").value==""){
   		alert("로그인 후 이용 가능합니다");
   		return false;
   	} else if($(e.target).siblings("textarea").val() == ""){
   		alert("글을 작성해주세요");
   		return false;
   	}
    	$.ajax({
    		type: 'post',
    		url: '/insertBc',
    		data: $(e.target).parent().serialize(),
    		success:function(data) {
    			location.reload();
    		}
    	});
    });
    
    	$(".liClick").click((e) =>{
    		if($(e.target).next().css("display") === "none") {
    			$(".replyDiv").css("display", "none");
        		$(e.target).next().css("display", "block");;
    		} else {
    			$(".replyDiv").css("display", "none");
    		}
    	});
    	
		$("#like").click(() => {
			$.ajax({
				type: 'post',
				url: '/insertLikeBoard',
				data: 'id=' + ${id} + '&boardNo=' + ${vo.boardNo},
				success:function(data) {
					location.reload();
					alert("추천 성공");
				}
			});
		});
		
		$("#disLike").click(() => {
			$.ajax({
				type: 'post',
				url: '/deleteLikeBoard',
				data: 'id=' + ${id} + '&boardNo=' + ${vo.boardNo},
				success:function(data) {
					location.reload();
					alert("추천 취소");
				}
			});
		});
	</script>
  </body>
</html>
