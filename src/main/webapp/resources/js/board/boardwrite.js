function checkBoard() {
  if ($.trim($("#boardTitle").val()).length == 0) {
    alert("제목을 입력하세요.");
    return false;
  } else if ($.trim($("#boardContent").val()).length == 0) {
    alert("내용을 입력하세요.");
    return false;
  } else if ($.trim($("#category").val()).length == 0) {
    alert("카테고리를 선택하세요.");
    return false;
  } else {
    if(confirm("게시물을 수정 하시겠습니까?")) {
    	alert("게시물 수정 완료되었습니다.")
    	return true;
    } else {
   	return false;
    }
  }
}
