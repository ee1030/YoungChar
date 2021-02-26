<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업체 회원가입</title>
    <style>
        *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 15px;
  margin-top: 15px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

.signUp {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

.sendBtn{
    height : 40px;
    width : 108px;
    padding : 0;
    border : 1px solid  #5fcf80;
    background-color: #5fcf80;
    color : #fffefe;
    cursor: pointer;
    outline:none;
}
.sendBtn:hover{
    background-color: #00D231;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}

[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 150px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;
}
.tTip{
    
    margin-bottom: 10px;
}
.img-fluid{
	justify-content: center;
}

#content1{
	text-align: center;
	
}

#contentImg1{
	border: 1px solid black;
	border-radius: 50%;
	width : 150px;
	height: 150px;
}


    </style>
</head>
<body>
   

      <form action="cooSignUpAction" method="post">
      <img class="img-fluid" src="${contextPath}/resources/assets/images/0char_logo(200).png" alt="Logo">
      
        <h1>회원가입</h1>
        
        <fieldset>
          <legend><span class="number">1</span>기본 정보</legend>
          <div id="content1">
					<h3>프로필 등록</h3>
          <img id="contentImg1">
          </div>
     		  <input type="file" id="img0" name="images" onchange="LoadImg(this,0)">
          <label for="memberId">아이디:</label>
          <input type="text" id="memberId" name="memberId">
          <div class="tTip">
            <span class="toolT" data-tooltip-text="어느 부분이 잘못됨 알려줌">잘못 입력시</span>
          </div>
          <label for="memberPwd">비밀번호:</label>
          <input type="password" id="memberPwd" name="memberPwd">
          
          <label for="memberPwd2">비밀번호 확인:</label>
          <input type="password" id="memberPwd2" name="memberPwd2">
          
          
          


        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>본인 인증</legend>
          <label for="memberEmail">Email:</label>
          <input type="email" id="memberEmail" name="memberEmail">
          <button type="button" class="sendBtn">인증번호 전송</button>
          <label for="memberEmail">인증번호 입력:</label>
          <input type="email" id="memberEmail" name="memberEmail">
        </fieldset>
        
        <fieldset>
        	<legend><span class="number">3</span>업체 정보</legend>
        	<label for="cooName">업체 명:</label>
          <input type="text" id="cooName" name="cooName">
       		
        	<label for="cooAgency">대리점 명:</label>
          <input type="text" id="cooAgency" name="cooAgency">
          
        
        <label for="job">브랜드 카테고리:</label>
        <select id="job" name="user_job">
            <option value="frontend_developer">테슬라</option>
            <option value="php_developor">현대</option>
            <option value="python_developer">기아</option>
            <option value="rails_developer">포르쉐</option>
            <option value="web_designer">BMW</option>
            <option value="WordPress_developer">벤츠</option>
            <option value="Android_developer">아우디</option>
        </select>
        
        
       		
       		<label for="phone">업체 번호:</label>
          <input type="tel" id="phone" name="phone" placeholder="' - ' 제외하고 입력">

       		<label for="postcodify_search_button">주소:</label>
          <input type="text" name="post" class="form-control postcodify_postcode5 inputTag address" style="width: 50%;" placeholder="우편번호">
          <button type="button" class="sendBtn" id="postcodify_search_button" >검색</button>
          <input type="text" class="form-control postcodify_address inputTag" name="address1" id="address1" placeholder="도로명 주소">
          <input type="text" class="form-control postcodify_details inputTag" name="address2" id="address2" placeholder="상세 주소">
       		
       		<label for="cooNumber">사업자번호:</label>
          <input type="text" id="cooNumber" name="cooNumber" placeholder="' - ' 제외하고 입력">
       		
       		<label for="cooLicense">사업자 등록증:</label>
          <input type="file" id="cooLicense" name="cooLicense" placeholder="' - ' 제외하고 입력">
       		
       		
       		
        </fieldset>


        
        <button type="submit" class="signUp">회원가입</button>
        
      </form>
      
    </body>
</html>

 
