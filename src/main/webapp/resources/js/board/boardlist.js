function searchBoard() {
  if ($.trim($("#keyword").val()).length == 0) {
    return false;
  }
  return true;
}

function loginAlert() {
  alert("로그인 후 이용 가능합니다.");
}

function locationView(no) {
  location.href = "/boardview?no=" + no;
}
