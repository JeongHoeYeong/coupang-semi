<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>전만순</title>
<link rel="stylesheet" href="resources/css/register.css" />
<script src="resources/js/register.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#idCheck, #nicknameCheck, #phoneCheck, #residentCheck, #emailCheck {
	width: 80px;
	height: 40px;
	text-align: center;
	color: white;
	background-color: #4287f5;
	border: none;
}
</style>
</head>
<body>
	<form action="/register" method="post" onsubmit="return sendit()"
		onsubmit="checkForm(event)">
		<div class="member">
			<!-- 1. 로고 -->

			<!-- 2. 필드 -->
			<div class="field">
					<b>아이디</b> <input type="text" id="id" name="id"
						placeholder="아이디 입력" maxlength="20" /> 
						<button id="idCheck">중복 체크</button> 
						<span id="checkText"></span>
			</div>

			<div class="field">
				<b>비밀번호</b> <input class="password" type="password" name="password"
					id="password" placeholder="비밀번호 입력" />
					<span id="passwordText"></span>
			</div>

			<div class="field">
				<b>이름</b> <input type="text" name="name" id="name"
					placeholder="이름 입력" />
					<span id="nameText"></span>
			</div>

			<div class="field">
				<b>닉네임</b> <input type="text" name="nickname" id="nickname"
					placeholder="닉네임 입력" />
					<button id="nicknameCheck">중복 체크</button>
					<span id="nickText"></span>
			</div>

			<div class="field">
				<b>이메일</b> <input type="text" name="email" id="email"
					placeholder="이메일 입력" />
					<button id="emailCheck">중복 체크</button>
					<span id="emailText"></span>
			</div>

			<!-- 4. 필드(성별) -->
			<div class="field gender">
				<b>성별</b>
				<div>
					<input type="radio" name="gender" value="남" checked />남성 
					<input type="radio" name="gender" value="여" />여성
				</div>
			</div>

				<!-- 5. 주소-->
			<div class="field">
				<b>주소</b> <input type="text" name="address" placeholder="주소 입력" />
			</div>
			
			<div class="field birth">
				<b>주민등록번호</b>
					<input type="text" name="resident" id="resident"
						placeholder="주민등록번호 입력" maxlength="14" />
						<button id="residentCheck">중복 체크</button>
						<span id="residentText"></span>
			</div>

							<!-- 3. 필드(생년월일) -->
			<div class="field tel-number">
				<b>휴대전화</b>
					<input type="text" name="phone" id="phone" placeholder="전화번호 입력" /><br>
					<button id="phoneCheck">중복 체크</button>
					<span id="phoneText"></span><br>
					</div>
					<div>
				<!-- 6. 가입하기 버튼 -->
				<input type="submit" value="가입하기" />
			</div>
		</div>
	</form>

</body>
</html>
