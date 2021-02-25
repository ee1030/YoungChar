<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

 
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html문서 제목</title>
       <!-- Core theme CSS (includes Bootstrap) -->
	   <link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   	
    <style>
		

@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
{
	-webkit-appearance: none;
	margin: 0;
	
}
h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #28a745;
	background-color: #28a745;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	/* display: flex; */
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: 1px solid black;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: auto;
	width: 1500px;
	max-width: 100%;
	min-height: 600px;
}

label{
	float : left;
	clear: both;
	font-weight: bold;
}

.form-container {
	position: absolute;
	top: 0;
	/* height: 500px; */
	overflow: scroll;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	height: 100%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	height: 100%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: auto;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container{
	transform: translateX(-100%);
}

.overlay {
	background: #FF416C;
	background: -webkit-linear-gradient(to right, #28a745, #28a745);
	background: linear-gradient(to right, #28a745, #28a745);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
  	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
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

.toolT{
	float: left;
	
}

.form-control{
	float: left;
}

/* 회원가입 입력 화면 */
.memberJoin{
    width: 400px;
    padding:0;
    margin : 0 auto;
    box-sizing: border-box;
}

.memberJoin > hr {
	border : 1px solid orange;
	margin-top : -10px;
}

/* 레이블 태그 class명*/
.lb{
    font-weight : bold;
    line-height: 25px;
    font-size: 13px;
    margin: 0 auto;
}

/* 인풋 태그 class명 */
.inputTag{
    margin: 0 auto;
    height:40px;
    width: 100%;
    padding : 0;
    border : 1px solid #bdbbbb;
}

/* inline-block 스타일 들어가야 하는 곳 전부 class 속성값 추가 */
.display-ib{
    display:inline-block;
}

/* 이메일 1번째 칸 */
/* .email{
    height:40px;
    width:180px;
} */



/* 이메일 인증번호 입력하는 인풋창 */
#verifyEmail{
    width:260px;
    height:30px;
    margin-right : 25px;
}

/* 이메일 인증 버튼 */
#emailBtn{
    height : 32px;
    width : 108px;
    padding : 0;
}


/* number타입의 화살표 지우기 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button{
        -webkit-appearance: none;
		margin: 0;
}

/* 핸드폰번호 입력 input창 */
.phone{
    width : 80px;
    height : 45px;   
}


.gender{
    width: 100%;
}


/* 회원가입 버튼 */
#submitBtn{
    margin: 0 auto;
    height:40px;
    width: 100%;
    font-size : 16px;
}

.btn_class:hover{
	background-color: #17a2b8;
}

.btn_class{
    height : 40px;
    width : 108px;
    padding : 0;
    border : 1px solid  #8bd2d6;
    background-color: #8bd2d6;
    color : #fffefe;
    cursor: pointer;
    outline:none;
}


#nextBtn {
	margin-left : 140px;
}


    </style>
</head>
<body>
		<img class="img-fluid" src="${contextPath}/resources/assets/images/0char_logo(200).png" alt="Logo">
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="#">
			<h1>업체 회원가입</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your email for registration</span>
			<input type="text" placeholder="Name" />
			<input type="email" placeholder="Email" />
			<input type="password" placeholder="Password" />
			<button>Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="#">
			<h1>일반 회원가입</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your account</span><br>
			<div class="memberJoin">
                <hr>

                <!-- 아이디 입력 -->
                <div>
                    <div class="lb">
                        <label for="userId">아이디</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag" id="userId" name="userId" autocomplete="off" required>
                    </div>
                    <div>
                        <span class="toolT" data-tooltip-text="어느 부분이 잘못됨 알려줌">잘못 입력시</span>
                    </div>    
                </div>
                
                <!-- 비밀번호 입력 -->
                <div>
                    <div class="lb">
                        <label for="pwd1">비밀번호</label>  <br>
                    </div>
                    <div class="ip">
                        <input type="password" class="inputTag"  id="pwd1" name="pwd1"  required>
                    </div>     
                    <div>
                        <span class="toolT" data-tooltip-text="어느 부분이 잘못됨 알려줌">잘못 입력시</span>
                    </div>  
                </div>

                <!-- 비밀번호 재확인 -->
                <div>
                    <div class="lb">
                        <label for="pwd2">비밀번호 재확인</label> <br>
                    </div>
                    <div class="ip">
                        <input type="password" class="inputTag"  id="pwd2" name="pwd2"   required>
                    </div>
                    <div>
                        <span class="toolT" data-tooltip-text="어느 부분이 잘못됨 알려줌">잘못 입력시</span>
                    </div>  
                </div>
                
                <!-- 닉네임 -->
                <div>
                    <div class="lb">
                        <label for="userName">닉네임</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag"  id="userName" name="userName" required>
                    </div>
                    <div>
                        <span class="toolT" data-tooltip-text="어느 부분이 잘못됨 알려줌">잘못 입력시</span>
                    </div> 
                </div>
                
                <!-- 이메일 -->
                <div>
                    <div class="lb">
                        <label for="email">이메일</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag display-ib email"  id="email1" name="email1" autocomplete="off" required> 
                        
                    </div>
                    <br>  
                    <div class="ip display-ib">
                        <input type="text" class="inputTag email" id="verifyEmail" placeholder="인증번호를 입력해주세요." required>
                    </div>
                    <div class= "verifyBtn display-ib">
                        <button class="btn_class" type="button" id="sendMail" name="sendMail" >인증번호 받기</button>
                    </div>
                    <span id="checkFl"></span>
                    <div>
                        <span id="checkEmail" >&nbsp;</span>
                    </div> 
                </div>

                <!-- 전화번호 -->
                <div>
                    <div class="lb">
                        <label for="phone">전화번호</label>
                    </div>
                    <div class="ip">
                        <select class="display-ib inputTag phone" id="phone1" name="phone1" required> 
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                            <option>017</option>
                            <option>019</option>
                        </select>
                        &nbsp;-&nbsp;
                        <input type="number" class="display-ib inputTag phone" id="phone2" name="phone2" required>
                        &nbsp;-&nbsp;
                        <input type="number" class="display-ib inputTag phone" id="phone3" name="phone3" required>
                    </div>
                    <div>
                        <span id="checkPhone" >&nbsp;</span>
                    </div> 
                </div>

                <!-- 성별 -->
                <div>
                    <div class="lb">
                        <label for="gender">성별</label>
                    </div>
                    <div class="ip">
                        <select class="inputTag gender" id="gender" name="gender" required>
                            <option>성별</option>
                            <option>여자</option>
                            <option>남자</option>
                            <option>선택안함</option>
                        </select>
                    </div>
                </div>

                <br><br>
                <div class="submit">
                    <button class="btn_class" id="nextBtn" type="submit">회원가입</button>
                </div>
            </div>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>일반 회원가입 이동</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signIn">Sign Up</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>업체 회원가입 이동</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>




<script>
    const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

</script>
</body>
</html>