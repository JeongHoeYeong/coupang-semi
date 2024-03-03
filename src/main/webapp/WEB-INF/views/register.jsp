<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전만순</title>
<link rel="stylesheet" href="resources/css/register.css">
</head>
<body>
	<form action="/register" method="post">
	<div class="member">
      <!-- 1. 로고 -->
		
      <!-- 2. 필드 -->
      <div class="field">
        <b>아이디</b>
        <input type="text" name="id" placeholder="아이디 입력"/>
      </div>
      
      <div class="field">
        <b>비밀번호</b>
        <input class="password" type="password" name="password" placeholder="비밀번호 입력"/>
      </div>
      
      <div class="field">
        <b>이름</b>
        <input type="text" name="name" placeholder="이름 입력"/>
      </div>
      
	  <div class="field">
        <b>닉네임</b>
        <input type="text" name="nickname" placeholder="닉네임 입력"/>
      </div>
      
	  <div class="field">
        <b>이메일</b>
        <input type="text" name="email" placeholder="이메일 입력"/>
      </div>

      <!-- 3. 필드(생년월일) -->
      <div class="field birth">
        <b>주민번호</b>
        <div>
          <input type="text" name="resident" placeholder="주민등록번호 입력" />
        </div>
      </div>

      <!-- 4. 필드(성별) -->
      <div class="field gender">
        <div>
        <input type="radio" name="gender" value="남" />남성
        <input type="radio" name="gender" value="여" />여성
        </div>
      </div>

      <!-- 5. 주소-->
      <div class="field">
        <b>주소</b>
        <input type="text" name="address" placeholder="주소 입력" />
      </div>

      <div class="field tel-number">
        <b>휴대전화</b>
        <div>
          <input type="text" name="phone" placeholder="전화번호 입력" />
        </div>

      <!-- 6. 가입하기 버튼 -->
      <input type="submit" value="가입하기" />
      </div>
	</form>
</body>
</html>