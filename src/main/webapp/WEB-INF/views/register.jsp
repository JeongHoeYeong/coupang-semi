<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
</head>
<body>
<!-- 
	<h1>회원가입</h1>
	<form action="/register" method="post">
		아이디 : <input type="text" name="id"><br> 
		비밀번호 : <input type="password" name="password"><br> 
		이름 : <input type="text" name="name"><br> 
		이메일 : <input type="text" name="email"><br> 
		주소 : <input type="text" name="address"><br>
		전화번호 : <input type="text" name="phone"><br> 
		닉네임 : <input type="text" name="nickname"><br> 
		성별 : <input type="text" name="gender"><br> 
		주민번호 : <input type="text" name="resident"><br> 
		<input type="submit">
	</form>
	 -->
	 

	 
	 <style>
      		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');	

      *{
          box-sizing: border-box; /*전체에 박스사이징*/
          outline: none; /*focus 했을때 테두리 나오게 */
      }


      body{
          font-family: 'Noto Sans KR', sans-serif;
          font-size:14px;
          background-color: #f5f6f7;
          line-height: 1.5em;
          color : #222;
          margin: 0;
      }

      a{
          text-decoration: none;
          color: #222;
      }

      /*member sign in*/
      .member{
          width: 400px;
          /* border: 1px solid #000; */
          margin: auto; /*중앙 정렬*/
          padding: 0 20px;
          margin-bottom: 20px;
      }

      .member .logo{
          /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
          display: block;
          margin :50px auto;
      }

      .member .field{
          margin :5px 0; /*상하로 좀 띄워주기*/
      }

      .member b{
          /* border: 1px solid #000; */
          display: block; /*수직 정렬하기 */
          margin-bottom: 5px;
      }

      /*input 중 radio 는 width 가 100%면 안되니까 */
      .member input:not(input[type=radio]),.member select{
          border: 1px solid #dadada;
          padding: 15px;
          width: 100%;
          margin-bottom: 5px;
      }

 	  .member input[type=button],
      .member input[type=submit]{
      background-color: #ff4b2b;
      color:#fff
      }

      .member input:focus, .member select:focus{
          border: 1px solid #2db400;
      }

      .field.birth div{ /*field 이면서 birth*/
          display: flex;
          gap:10px; /*간격 벌려줄때 공식처럼 사용핟나 */
      }

      /* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌
          flex:1;
      } */

      .field.tel-number div {
          display: flex;
      }

      .field.tel-number div input:nth-child(1){
          flex:2;
      }

      .field.tel-number div input:nth-child(2){
          flex:1;
      }

      .field.gender div{
          border: 1px solid #dadada;
          padding: 15px 5px;
          background-color: #fff;
      }

      .placehold-text{
          display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
          position:relative;
          /* border: 1px solid #000; */
      }

      .placehold-text:before{
          content : "@naver.com";
          position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
          right : 20px;
          top:13px;
          pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
      }

      .userpw{
          background:url(./images/images2/icon-01.png) no-repeat center right 15px;
          background-size: 20px;
          background-color: #fff;
      }

      .userpw-confirm{
          background:url(./images/images2/icon-02.png) no-repeat center right 15px;
          background-size: 20px;
          background-color: #fff;
      }

      .member-footer {
          text-align: center;
          font-size: 12px;
          margin-top: 20px;
      }

      .member-footer div a:hover{
          text-decoration: underline;
          color:#2db400
      }

      .member-footer div a:after{
          content:'|';
          font-size: 10px;
          color:#bbb;
          margin-right: 5px;
          margin-left: 7px;
          /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
          display: inline-block;
          transform: translateY(-1px);

      }

      .member-footer div a:last-child:after{
          display: none;
      }

      @media (max-width:768px) {
          .member{
              width: 100%;
          }
      }
    </style>
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
        <b>성별</b>
        <div>
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