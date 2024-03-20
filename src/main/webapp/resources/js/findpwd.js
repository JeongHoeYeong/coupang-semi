$("#find").click(() => {
  $.ajax({
    type: "post",
    url: "/searchpwd",
    data: $("#frm").serialize(),

    success: function (result) {
      if (result) {
        $("#resultText")
          .text(result)
          .css("color", "green");
        location.href = "/findpwd2";
      } else {
       alert("회원 정보가 없습니다.").css("color", "red");
      }
    },
  });
});
