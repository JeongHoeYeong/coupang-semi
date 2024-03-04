function sendit() {
  const userid = document.getElementById("id");
  const password = document.getElementById("password");
  const name = document.getElementById("name");
  const nickname = document.getElementById("nickname");
  const resident = document.getElementById("resident");
  const hp = document.getElementById("phone");

  const expldText = /^[A-Za-z]{1}[A-Za-z0-9]{3,20}$/;
  const expPassword =
    /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
  const expNameText = /^[가-힣]+$/;
  const expNickText = /^[A-Za-z가-힝0-9]{2,20}$/;
  const expResidentText =
    /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
  const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;

  if (userid.value == "") {
    alert("아이디를 입력하세요");
    userid.focus();
    return false;
  }

  if (!expldText.test(userid.value)) {
    alert("아이디는 4자 이상 20자 이하의 대소문자로 시작하는 조합입니다.");
    userid.focus();
    return false;
  }

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
