<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/loginpage.css">
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.0/kakao.min.js"
  integrity="sha384-l+xbElFSnPZ2rOaPrU//2FF5B4LB8FiX5q4fXYTlfcG4PGpMkE1vcL7kNXI6Cci0" crossorigin="anonymous"></script>
<script>
  Kakao.init('a0203ccdffa21fc7096cfaca29b6fa24'); // 사용하려는 앱의 JavaScript 키 입력
</script>

</head>
<body>
	<a href="/"><h2>로그인 페이지</h2>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="#">
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social" ><i class="fab fa-facebook-f"></i></a> 
					<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> 
					<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="/login" method="post">
				<!--  로그인  -->
				<h1>Sign in</h1>
				<!-- SNS 로그인 -->
				<div class="social-container">
					<a id="kakao-login-btn" href="javascript:loginWithKakao()" class="social">  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" /><i class="fab fa-google-plus-g"></i></a> 
    <p id="token-result"></p>
				</div>
				<span>or use your account</span> 
				<input type="text" name="username" placeholder="id" /> 
				<input type="password" name="password" placeholder="password" />
				<a href="#">Forgot your password?</a>
				<button>Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">
						<a href="/register">Sign Up</a>
					</button>
				</div>
			</div>
		</div>
	</div>
	<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/auth/kakao/callback',
    });
  };

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>
</body>
</html>