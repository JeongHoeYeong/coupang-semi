function checkBoard() {
  if ($.trim($("#boardTitle").val()).length == 0) {
    alert("제목을 입력하세요.");
    return false;
  } else if ($.trim($("#boardTitle").val()).length > 20) {
  	alert("제목은 20자까지 입력할 수 있습니다.");
  	return false;
  } else if ($.trim($("#boardContent").val()).length == 0) {
    alert("내용을 입력하세요.");
    return false;
  } else if ($.trim($("#category").val()).length == 0) {
    alert("카테고리를 선택하세요.");
    return false;
  } 
  return true;
}

function editBoard() {
	if(checkBoard()) {
	return confirm("게시물을 수정 하시겠습니까?");
	} else {
		return false;
	}
}

function writeBoard() {
	if(checkBoard()) {
	return confirm("게시물을 등록 하시겠습니까?");
	} else {
		return false;
	}
}
