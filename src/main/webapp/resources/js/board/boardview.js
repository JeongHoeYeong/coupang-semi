$(".bcEdit").click((e) => {
  $(e.target).siblings(".editContent").css("display", "block");
  $(e.target).siblings(".bcContent1").css("display", "none");
  $(e.target).css("display", "none");
});

$(".editCan").click((e) => {
  $(e.target).parent().css("display", "none");
  $(e.target).parent().siblings(".bcContent1").css("display", "block");
  $(e.target).parent().siblings(".bcEdit").css("display", "block");
});

$(".editCon").click((e) => {
  $.ajax({
    type: "get",
    url: "editBC",
    data: $(e.target).parent().serialize(),
    success: function (data) {
      location.reload();
    },
  });
});

$(".bcDelete").click((e) => {
  $.ajax({
    type: "get",
    url: "/deleteBC",
    data:
      "bcNo=" +
      $(e.target).siblings(".bcNo").val() +
      "&boardNo=" +
      $("#boardNo").val(),
    success: function (data) {
      location.reload();
    },
  });
});

$("#bcWrite").click((e) => {
  if (document.querySelector("#id").value == "") {
    alert("로그인 후 이용 가능합니다");
    return false;
  } else if ($(e.target).siblings("textarea").val().trim().length == 0) {
    alert("글을 작성해주세요");
    return false;
}
  
  $.ajax({
    type: "post",
    url: "/insertBc",
    data: $("#boardContent").serialize(),
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

$(".liClick").click((e) => {
  if ($(e.target).next().css("display") === "none") {
    $(".bcDiv").css("display", "none");
    $(e.target).next().css("display", "block");
  } else {
    $(".bcDiv").css("display", "none");
  }
});

$("#like").click(() => {
  $.ajax({
    type: "post",
    url: "/insertLikeBoard",
    data: "id=" + $("#id").val() + "&boardNo=" + $("#boardNo").val(),
    success: function (data) {
      location.reload();
      alert("추천 성공");
    },
  });
});

$("#disLike").click(() => {
  $.ajax({
    type: "post",
    url: "/deleteLikeBoard",
    data: "id=" + $("#id").val() + "&boardNo=" + $("#boardNo").val(),
    success: function (data) {
      location.reload();
      alert("추천 취소");
    },
  });
});
