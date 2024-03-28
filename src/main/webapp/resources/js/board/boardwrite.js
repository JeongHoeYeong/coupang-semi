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
  } 
  return true;
}

function editBoard() {
	if(checkBoard()) {
		if(confirm("게시물을 수정 하시겠습니까?")){
			alert("게시물 수정 완료하였습니다.");
			return true;
		} else {
		return false;
		}
	} else {
		return false;
	}
}

function writeBoard() {
	if ($.trim($("#boardTitle").val()).length > 20) {
  	alert("제목은 20자까지 입력할 수 있습니다.");
  	return false;
  } else if(checkBoard()) {
  	if(confirm("게시물을 등록 하시겠습니까?")){
		alert("게시물 등록 완료하였습니다.");
		return true;
		} else {
			return false;
		}
	} else {
		return false;
	}	
}
