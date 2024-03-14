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

		$("#idCheck").click(()=>{
			$.ajax({
				type: "post",
				url: "/check",
				data: "id=" + $("#id").val(),
				
				success: function(result){
					if(result) {
						$("#checkText").text("사용 불가한 아이디입니다.").css("color", "red");
					} else {
						$("#checkText").text("사용 가능한 아이디입니다.").css("color", "green");
					}
			if (userid.value == "") {
  			  $("#checkText").text("아이디를 입력해 주세요.").css("color", "red");
  			  userid.focus();
   			  return false;
 		 }

  			if (!expldText.test(userid.value)) {
   			  $("#checkText").text("아이디는 4자 이상 20자 이하의 대소문자로 시작하는 조합입니다.").css("color", "red");
  			  userid.focus();
  			  return false;
  		 }
					}
			})
		});
		


  if (password.value == "") {
    $("#passwordText").text("비밀번호를 입력하세요.").css("color", "red");
    password.focus();
    return false;
  }

  if (!expPassword.test(password.value)) {
    $("#passwordText").text("비밀번호는 최소 8자리, 숫자, 문자, 특수문자 최소 1개씩 포함").css("color", "red");
    password.focus();
    return false;
  } else {
  	$("#passwordText").text("");
  }


  if (name.value == "") {
    $("#nameText").text("이름을 입력하세요").css("color", "red");
    name.focus();
    return false;
  } else if(!expNameText.test(name.value)){
      $("#nameText").text("이름은 한글로 입력하세요").css("color", "red");
    name.focus();
    return false;
  } else {
  	$("#nameText").text("");
  }


	$("#nicknameCheck").click(()=>{
		$.ajax({
				type: "post",
				url: "/checko",
				data: "nickname=" + $("#nickname").val(),
				
				success: function(resulto){
					if(resulto) {
						$("#nickText").text("사용 불가한 닉네임입니다.").css("color", "red");
					} else {
						$("#nickText").text("사용 가능한 닉네임입니다.").css("color", "green");
					}

				}
		});
	});



  if (!expEmailText.test(email.value)) {
    $("#emailText").text("이메일 형식을 확인하세요. 골뱅이표시(@)을 포함해야 합니다.").css("color", "red");
    email.focus();
    return false;
  } else {
  	$("#emailText").text("");
  }

	  if (!expResidentText.test(resident.value)) {
    $("#phoneText").text("주민등록번호을 확인하세요. 하이픈(-)을 포함해야 합니다.").css("color", "red");
    resident.focus();
    return false;
  } else {
  	$("#residentText").text("");
  }
  
  if (!expHpText.test(hp.value)) {
    $("#phoneText").text("휴대폰 번호 형식을 확인하세요. 하이픈(-)을 포함해야 합니다.").css("color", "red");
    hp.focus();
    return false;
  } else {
  	$("#phoneText").text("");
  }
  return true;
}
