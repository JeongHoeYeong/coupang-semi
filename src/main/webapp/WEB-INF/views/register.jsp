<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>전만순</title>
    <link rel="stylesheet" href="resources/css/register.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
      #idCheck,
      #nicknameCheck,
      #phoneCheck,
      #residentCheck,
      #emailCheck,
      #addressone {
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
    <form
      action="/register"
      method="post"
      name="regform"
      id="regform"
      onsubmit="return sendit()"
    >
      <div class="member">
        <!-- 1. 로고 -->
        <a href="/">
          <img
            src="resources/image/logobackclear.png"
            style="margin-left: 100px"
        /></a>
        <!-- 2. 필드 -->
        <div class="field">
          <b>아이디</b>
          <input
            type="text"
            id="id"
            name="id"
            placeholder="아이디 입력"
            maxlength="20"
          />
          <span id="checkText" style="height: 20px; display: block"></span>
        </div>

        <div class="field">
          <b>비밀번호</b>
          <input
            class="password"
            type="password"
            name="password"
            id="password"
            placeholder="비밀번호 입력"
          />
          <span id="passwordText" style="height: 20px; display: block"></span>
        </div>

        <div class="field">
          <b>이름</b>
          <input type="text" name="name" id="name" placeholder="이름 입력" />
          <span id="nameText" style="height: 20px; display: block"></span>
        </div>

        <div class="field">
          <b>닉네임</b>
          <input
            type="text"
            name="nickname"
            id="nickname"
            placeholder="닉네임 입력"
          />
          <span id="nickText" style="height: 20px; display: block"></span>
        </div>

        <div class="field">
          <b>이메일</b>
          <input
            type="text"
            name="email"
            id="email"
            placeholder="이메일 입력"
          />
          <span id="emailText" style="height: 20px; display: block"></span>
        </div>

        <!-- 4. 필드(성별) -->
        <div class="field gender">
          <b>성별</b>
          <div>
            <input type="radio" name="gender" value="남" checked />남성
            <input type="radio" name="gender" value="여" />여성
          </div>
        </div>

        <div class="field birth">
          <b>주민등록번호</b>
          <input
            type="text"
            name="resident"
            id="resident"
            placeholder="주민등록번호 입력"
            maxlength="14"
          />
          <span id="residentText" style="height: 20px; display: block"></span>
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field tel-number">
          <b>휴대전화</b>
          <input
            type="text"
            name="phone"
            id="phone"
            placeholder="전화번호 입력"
            maxlength="13"
          />
          <span id="phoneText" style="height: 20px; display: block"></span>
        </div>
        <div class="field">
          <!-- 5. 주소-->
          <b>우편번호</b
          ><input
            type="text"
            name="zipcode"
            maxlength="5"
            id="sample6_postcode"
            placeholder="우편번호"
          />
          <button
            type="button"
            id="addressone"
            onclick="sample6_execDaumPostcode()"
          >
            검색
          </button>
          <b>주소</b
          ><input
            type="text"
            name="address"
            id="address"
            placeholder="상세 주소"
          />
          <input type="hidden" type="text" id="sample6_detailAddress" />
          <input type="hidden" type="text" id="sample6_extraAddress" />

          <!-- 6. 가입하기 버튼 -->
          <div>
            <input type="submit" value="가입하기" />
          </div>
        </div>
      </div>
    </form>
    <script src="resources/js/register.js"></script>
  </body>
</html>
