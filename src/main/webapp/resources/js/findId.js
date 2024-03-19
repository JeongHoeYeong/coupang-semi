$("#find").keyup(() => {
  $.ajax({
    type: "post",
    url: "/findId",
    data: "email=" + $("#email").val(),

    success: function (result) {
		if(result){
			$("#findidText").text("사용 불가한 이메일입니다.").css("color", "red");
		} else{
			$("#findidText").text("사용 가능한 이메일입니다.").css("color", "green");
		}
    },
  });
});