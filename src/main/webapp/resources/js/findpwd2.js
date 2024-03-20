const password = document.getElementById("password");

const expPassword =
  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

$("#password").keyup(() => {
	if (password.value == "") {
    $("#passwordText").text("비밀번호를 입력하세요.").css("color", "red");
    password.focus();
    return false;
  } else if (!expPassword.test(password.value)) {
    $("#passwordText")
      .text("비밀번호는 최소 8자리, 숫자, 문자, 특수문자 최소 1개씩 포함")
      .css("color", "red");
    password.focus();
    return false;
  } else {
    $("#passwordText")
      .text("사용 가능한 비밀번호입니다.")
      .css("color", "green");
  }
  return true;
});