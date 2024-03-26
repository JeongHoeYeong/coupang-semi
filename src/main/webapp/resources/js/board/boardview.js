$(".bcEdit").click((e) => {
  e.stopPropagation();
  $(e.target).siblings(".editContent").css("display", "block");
  $(e.target).siblings(".bcContent1").css("display", "none");
  $(e.target).css("display", "none");
});

$(".editCan").click((e) => {
  e.stopPropagation();
  $(e.target).parent().css("display", "none");
  $(e.target).parent().siblings(".bcContent1").css("display", "block");
  $(e.target).parent().siblings(".bcEdit").css("display", "inline");
});

$(".editCon").click((e) => {
if (confirm("댓글을 수정 하시겠습니까?")) {
  $.ajax({
    type: "get",
    url: "editBC",
    data: $(e.target).parent().serialize(),
    success: function (data) {
      location.reload();
    },
  });
  }
});

$(".editContent").click((e) => {
	e.stopPropagation();
});

$(".editBtn").click((e)=> {
	e.stopPropagation();
});

function checkDelete(e) {
	if (confirm("게시물을 삭제 하시겠습니까?")) {
		location.href = "/boarddelete?no=" + $("#boardNo").val();
	} else {
	return false;
	}
}

function bcDelete(bcNo) {
	if(confirm("댓글을 삭제 하시겠습니까?")) {
  $.ajax({
    type: "get",
    url: "/deleteBC",
    data: "bcNo=" + bcNo + "&boardNo=" + $("#boardNo").val(),
    success: function (data) {
      location.reload();
    },
  });
  }
}

$("#bcWrite").click((e) => {
  if ($("#id").val() == "") {
    alert("로그인 후 이용 가능합니다");
    return false;
  } else if ($(e.target).siblings("textarea").val().trim().length == 0) {
    alert("글을 작성해주세요");
    return false;
  }

  $.ajax({
    type: "post",
    url: "/insertBc",
    data: $("#bcForm").serialize(),
    success: function (data) {
      location.reload();
    },
  });
});

$(".brWrite").click((e) => {
  if (document.querySelector("#id").value == "") {
    alert("로그인 후 이용 가능합니다");
    return false;
  } else if ($(e.target).siblings("textarea").val() == "") {
    alert("글을 작성해주세요");
    return false;
  }
  $.ajax({
    type: "post",
    url: "/insertBc",
    data: $(e.target).parent().serialize(),
    success: function (data) {
      location.reload();
    },
  });
});

function liDivBlock(no) {
    if ($("#bcDiv" + no).css("display") === "none") {
      $(".bcDiv").css("display", "none");
      $("#bcDiv" + no).css("display", "block");
    } else {
      $(".bcDiv").css("display", "none");
    }
}

$("#like").click(() => {
  if ($("#id").val() == "") {
    alert("로그인 후 이용 가능합니다");
    return false;
  }
  $.ajax({
    type: "post",
    url: "/insertLikeBoard",
    data: "id=" + $("#id").val() + "&boardNo=" + $("#boardNo").val(),
    success: function (data) {
      location.reload();
    },
  });
});

$("#disLike").click(() => {
  if ($("#id").val() == "") {
    alert("로그인 후 이용 가능합니다");
    return false;
  }
  $.ajax({
    type: "post",
    url: "/deleteLikeBoard",
    data: "id=" + $("#id").val() + "&boardNo=" + $("#boardNo").val(),
    success: function (data) {
      location.reload();
    },
  });
});
