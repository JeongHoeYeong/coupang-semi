function sendit() {
  const userid = document.getElementById("id");
  const password = document.getElementById("password");
  const name = document.getElementById("name");
  const nickname = document.getElementById("nickname");
  const resident = document.getElementById("resident");
  const hp = document.getElementById("phone");
  const email = document.getElementById("email");

  const expldText = /^[A-Za-z]{1}[A-Za-z0-9]{3,20}$/;
  const expPassword =
    /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
  const expNameText = /^[가-힣]+$/;
  const expNickText = /^[A-Za-z가-힝0-9]{2,20}$/;
  const expResidentText =
    /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
  const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
  const expEmailText = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;

$("#doublecheck").click((e) => {
  let id = $("#id").val();
  const regExp = /^[A-Za-z]{1}[A-Za-z0-9]{3,20}$/;
  console.log(id);
  if (regExp.test(id)) {
    $("#checkText").text("사용 가능한 아이디입니다.").css("color", "green");
  } else if (id === "") {
    $("#checkText").text("");
  } else {
    $("#checkText").text("영문자로 시작하는 4 ~ 20 이내의 영문자 또는 숫자").css("color", "red");
  }
});

  if (password.value == "") {
    alert("비밀번호를 입력하세요.");
    password.focus();
    return false;
  }

  if (!expPassword.test(password.value)) {
    alert("비밀번호는 최소 8자리, 숫자, 문자, 특수문자 최소 1개");
    password.focus();
    return false;
  }

  if (name.value == "") {
    alert("이름을 입력하세요");
    name.focus();
    return false;
  }

  if (!expNameText.test(name.value)) {
    alert("이름은 한글로 입력하세요");
    name.focus();
    return false;
  }

  if (!expNickText.test(nickname.value)) {
    alert("닉네임은 2자 이상 20자 이하로 입력해주세요.");
    nickname.focus();
    return false;
  }

  if (!expEmailText.test(email.value)) {
    alert("이메일 형식을 확인하세요 \n골뱅이표시(@)을 포함해야 합니다.");
    email.focus();
    return false;
  }

  if (!expResidentText.test(resident.value)) {
    alert("주민등록번호 형식을 확인하세요. /n하이픈(-)을 포함해야 합니다.");
    resident.focus();
    return false;
  }

  if (!expHpText.test(hp.value)) {
    alert("휴대폰 번호 형식을 확인하세요. \n하이픈(-)을 포함해야 합니다.");
    hp.focus();
    return false;
  }
  return true;
}
