$("#find").click(() => {
  $.ajax({
    type: "post",
    url: "/find",
    data: $("#frm").serialize(),

    success: function (result) {
      					if(result) {
						$("#resultText").text(result).css("color", "green");
					} else {
						$("#resultText").text("회원 정보가 없습니다.").css("color", "red");
					}
    }
  });
});
