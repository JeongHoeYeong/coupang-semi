const id = document.getElementById("id");
const password = document.getElementById("password");
const name = document.getElementById("name");
const nickname = document.getElementById("nickname");
const resident = document.getElementById("resident");
const phone = document.getElementById("phone");
const email = document.getElementById("email");

const expldText = /^[A-Za-z]{1}[A-Za-z0-9]{3,20}$/;
const expPassword =
  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
const expNameText = /^[가-힣]+$/;
const expNickText = /^[A-Za-z가-힝0-9]{2,20}$/;
const expResidentText =
  /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-4][0-9]{6}$/;
const expPhoneText = /^\d{3}-\d{3,4}-\d{4}$/;
const expEmailText = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;

$("#id").keyup(() => {
  $.ajax({
    type: "post",
    url: "/check",
    data: "id=" + $("#id").val(),

    success: function (result) {
      console.log(result);
      if (result) {
        $("#checkText").text("중복된 아이디입니다.").css("color", "red");
        id.focus();
      } else if (id.value == "") {
        $("#checkText").text("아이디를 입력해 주세요.").css("color", "red");
        id.focus();
      } else if (!expldText.test(id.value)) {
        $("#checkText")
          .text("아이디는 4자 이상 20자 이하의 대소문자로 시작하는 조합입니다.")
          .css("color", "red");
        id.focus();
      } else {
        $("#checkText").text("사용 가능한 아이디입니다.").css("color", "green");
      }
    },
  });
});

$("#nickname").keyup(() => {
  $.ajax({
    type: "post",
    url: "/checko",
    data: "nickname=" + $("#nickname").val(),

    success: function (resulto) {
      if (resulto) {
        $("#nickText").text("사용 불가한 닉네임입니다.").css("color", "red");
        nickname.focus();
      } else if (nickname.value == "") {
        $("#nickText").text("닉네임을 입력하세요.").css("color", "red");
        nickname.focus();
      } else if (!expNickText.test(nickname.value)) {
        $("#nickText")
          .text("닉네임은 최소 2글자에서 최대 20자 이내")
          .css("color", "red");
        nickname.focus();
      } else {
        $("#nickText").text("사용 가능한 닉네임입니다.").css("color", "green");
      }
    },
  });
});

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
});

$("#name").keyup(() => {
  if (name.value == "") {
    $("#nameText").text("이름을 입력하세요").css("color", "red");
    name.focus();
  } else if (!expNameText.test(name.value)) {
    $("#nameText").text("이름은 한글로 입력하세요").css("color", "red");
    name.focus();
    false;
  } else {
    $("#nameText").text("사용 가능한 이름").css("color", "green");
  }
});

$("#email").keyup(() => {
  $.ajax({
    type: "post",
    url: "/checke",
    data: "email=" + $("#email").val(),

    success: function (resulte) {
      if (resulte) {
        $("#emailText").text("사용 불가한 이메일입니다.").css("color", "red");
        email.focus();
        false;
      } else if (!expEmailText.test(email.value)) {
        $("#emailText")
          .text("이메일 형식을 확인하세요. 골뱅이표시(@)을 포함해야 합니다.")
          .css("color", "red");
        email.focus();
        false;
      } else {
        $("#emailText").text("사용 가능한 이메일입니다.").css("color", "green");
      }
    },
  });
});

$("#resident").keyup(() => {
  $.ajax({
    type: "post",
    url: "/checkr",
    data: "resident=" + $("#resident").val(),

    success: function (resultr) {
      if (resultr) {
        $("#residentText")
          .text("사용 불가한 주민번호입니다.")
          .css("color", "red");

      } else if (!expResidentText.test(resident.value)) {
        $("#residentText")
          .text("주민등록번호을 확인하세요.")
          .css("color", "red");
        resident.focus();

      } else {
        $("#residentText")
          .text("사용 가능한 주민번호입니다.")
          .css("color", "green");
      }
    },
  });
});

$("#phone").keyup(() => {
  $.ajax({
    type: "post",
    url: "/checkp",
    data: "phone=" + $("#phone").val(),

    success: function (resultp) {
      if (resultp) {
        $("#phoneText").text("사용 불가한 전화번호입니다.").css("color", "red");
        phone.focus();
      } else if (!expPhoneText.test(phone.value)) {
        $("#phoneText")
          .text("휴대폰 번호 형식을 확인하세요. 하이픈(-)을 포함해야 합니다.")
          .css("color", "red");
        phone.focus();

      } else if (phone.value == "") {
        $("#phoneText")
          .text("휴대폰 번호을 형식에 맞게 입력하세요.")
          .css("color", "red");
        phone.focus();

      } else {
        $("#phoneText")
          .text("사용 가능한 전화번호입니다.")
          .css("color", "green");
      }
    },
  });
});


$("#register").click(() => {
  if (id.value == "") {
    id.focus();
    alert("아이디를 입력하세요!");
    return false;
  } else if (password.value == "") {
    password.focus();
    alert("비밀번호를 입력하세요!");
    return false;
  } else if (name.value == "") {
    name.focus();
    alert("이름을 입력하세요!");
    return false;
  } else if (nickname.value == "") {
    nickname.focus();
    alert("닉네임를 입력하세요!");
    return false;
  } else if (resident.value == "") {
    resident.focus();
    alert("주민등록번호를 입력하세요!");
    return false;
  } else if (phone.value == "") {
    phone.focus;
    alert("전화번호를 입력하세요!");
    return false;
  } else if (email.value == "") {
    email.focus;
    alert("이메일를 입력하세요!");
    return false;
  } else {
    return true;
  }
  true;
});

function sample6_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ""; // 주소 변수
      var extraAddr = ""; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === "R") {
        // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else {
        // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if (data.userSelectedType === "R") {
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if (data.buildingName !== "" && data.apartment === "Y") {
          extraAddr +=
            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if (extraAddr !== "") {
          extraAddr = " (" + extraAddr + ")";
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        document.getElementById("sample6_extraAddress").value = extraAddr;
      } else {
        document.getElementById("sample6_extraAddress").value = "";
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById("sample6_postcode").value = data.zonecode;
      document.getElementById("sample6_address").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("sample6_detailAddress").focus();
    },
  }).open();
}
