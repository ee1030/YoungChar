<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
a{
	text-decoration: none;
	color: black;
}

#content1, #logo{
	text-align: center;
}

#contentImg1:hover{
	cursor: pointer;
}

#contentImg1{
	border: 2px solid #5fcf80;
	border-radius: 50%;
	width : 150px;
	height: 150px;
}

    </style>
</head>
<body>
   

      <form action="SignUpAction" method="post" name="signUpForm" enctype="multipart/form-data" onsubmit="return memberJoinvalidate();">
      <div id="logo">
      <img class="img-fluid" src="${contextPath}/resources/assets/images/0char_logo(200).png" alt="Logo">
      </div>
        <h1>회원가입</h1>
        
        <fieldset>
          <legend><span class="number">1</span>기본 정보</legend>
					<div id="content1" class="content1">
					<h3>프로필 등록</h3>
          <img id="contentImg1">
          </div>
     		  <input type="file" id="img0" name="images" onchange="LoadImg(this,0)">
          <label for="memberId">아이디:</label>
          <input type="text" id="memberId" name="memberId" required>
          <div class="tTip">
            <span class="toolT" id="checkId"></span>
          </div>
          
          <label for="memberPwd">비밀번호:</label>
          <input type="password" id="memberPwd" name="memberPwd" required>
          <div class="tTip">
            <span class="toolT" id="checkPwd1"></span>
          </div>
          
          <label for="memberPwd2">비밀번호 확인:</label>
          <input type="password" id="memberPwd2" name="memberPwd2" required>
          <div class="tTip">
            <span class="toolT" id="checkPwd2"></span>
          </div>
          
          <label for="memberNm">회원명:</label>
          <input type="text" id="memberNm" name="memberNm" required>
          <div class="tTip">
            <span class="toolT" id="checkName"></span>
          </div>
          
          <label for="nickName">닉네임:</label>
          <input type="text" id="nickName" name="nickName" required>
          <div class="tTip">
            <span class="toolT" id="checkNickName"></span>
          </div>
          
          <label for="phone">전화번호:</label>
          <input type="tel" id="phone" name="phone" placeholder="' - ' 제외하고 입력" required>
          
          <label for="postcodify_search_button">주소:</label>
          <input type="text" name="post" class="form-control postcodify_postcode5 inputTag address" style="width: 50%;" placeholder="우편번호" required>
          <button type="button" class="sendBtn" id="postcodify_search_button" >검색</button>
          <input type="text" class="form-control postcodify_address inputTag" name="address1" id="address1" placeholder="도로명 주소">
          <input type="text" class="form-control postcodify_details inputTag" name="address2" id="address2" placeholder="상세 주소">



        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>본인 인증</legend>
          <label for="memberEmail">Email:</label>
          <input type="email" id="memberEmail" name="memberEmail" required>
          <div class="tTip">
            <span class="toolT" id="checkEmail"></span>
          </div>
          <button type="button" class="sendBtn" id="sendBtn">인증번호 전송</button>
          <label for="verifyEmail">인증번호 입력:</label>
          <input type="text" id="verifyEmail" name="verifyEmail" required>
          <div class="tTip">
            <span class="toolT" id="checkKey"></span>
          </div>
        </fieldset>


        
        <button type="submit" id="nextBtn" class="signUp">회원가입</button>
        <h3><a href="${contextPath}/member/cooSignUp">업체 회원가입으로 이동</a></h3>
      </form>
      
      
      

      
     	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>
				// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
				$(function() {
					$("#postcodify_search_button").postcodifyPopUp();
				});
			</script>
      
      <script>
		   // 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
				$(function(){
					$("#img0").hide(); // #fileArea 요소를 숨김.		
					
					$("#contentImg1").on("click", function(){ // 이미지 영역이 클릭 되었을 때
						// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
						$("#img0").click();
					});
					
				});
		   
				  // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				  function LoadImg(value, num) {
					  // value.files : 파일이 업로드되어 있으면 true
					  // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
					  
						if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
							
							var reader = new FileReader();
			       	// 자바스크립트 FileReader
			      	// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
			      	// 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
			      	// 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
			      	
			      	reader.readAsDataURL(value.files[0]);
			        // FileReader.readAsDataURL()
			      	// 지정된의 내용을 읽기 시작합니다. 
			      	// Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	
			      	
			      	reader.onload = function(e){
			        	// FileReader.onload
								// load 이벤트의 핸들러. 
								// 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	
			      		
								// 읽어들인 내용(이미지 파일)을 화면에 출력
								
								$(".content1").eq(num).children("img").attr("src", e.target.result);
								// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
								
			      	}
						}
					}
		   
		   
		   
		   
		   
		   
				var signUpCheck = {
						"id" : false,
						"pwd1" : false,
						"pwd2" : false,
						"name" : false,
						"nickName" : false,
						"email" : false
					};
				
				var $id = $("#memberId");
				var $pwd1 = $("#memberPwd");
				var $pwd2 = $("#memberPwd2");
				var $name = $("#memberNm");
				var $nickName = $("#nickName");
				var $email = $("#memberEmail");
				
				$id.on("input", function() {
					// 첫글자는 영어 소문자, 나머지 글자는 영어 대,소문자 + 숫자, 총 6~12글자
					var regExp = /^[a-z][a-zA-z\d]{5,11}$/;
					if (!regExp.test($id.val())) {
						$("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color", "red").attr("data-tooltip-text", "6~12자리의 영어 대,소문자와 숫자 첫글자는 영어 소문자");
						$id.css("border", "1px solid red");
						signUpCheck.id = false;

					}else{
						$.ajax({
							url : "idDupCheck",
							data : {"memberId" : $id.val()},
							type : "post",
							success : function(result){
								
								if(result == 0){	
									$("#checkId").text("사용 가능한 아이디 입니다.").css("color", "green");
									$id.css("border", "1px solid #5fcf80");
									signUpCheck.id = true;
									
								}else{
									$("#checkId").text("이미 사용중인 아이디 입니다.").css("color", "red");
									signUpCheck.id = false;
								}
								
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
							
						});
					}
					
					
				});
				
				
				// 비밀번호 유효성 및 일치 검사
				$("#memberPwd, #memberPwd2").on("input",function() {
					//영어 대,소문자 + 숫자, 총 6~12글자
					var regExp = /^[A-Za-z0-9]{6,12}$/;
			
					// 비밀번호1 유효성 검사
					if (!regExp.test($("#memberPwd").val())) {
						$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red").attr("data-tooltip-text", "6~12자리의 영어 대,소문자와 숫자");
						$pwd1.css("border", "1px solid red");
						signUpCheck.pwd1 = false;
					} else {
						$("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color", "green");
						$pwd1.css("border", "1px solid #5fcf80");
						signUpCheck.pwd1 = true;
					}
			
					// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
					if (!signUpCheck.pwd1 && $pwd2.val().length > 0) {
						alert("유효한 비밀번호를 작성해 주세요.");
						$pwd2.val("");
						$pwd1.focus();
					} else if (signUpCheck.pwd1 && $pwd2.val().length > 0) {
						if ($("#memberPwd").val().trim() != $("#memberPwd2").val().trim()) {
							$("#checkPwd2").text("비밀번호 불일치").css("color", "red");
							$pwd2.css("border", "1px solid red");
							signUpCheck.pwd2 = false;
						} else {
							$("#checkPwd2").text("비밀번호 일치").css("color", "green");
							$pwd2.css("border", "1px solid #5fcf80");
							signUpCheck.pwd2 = true;
						}
					}
			
				});
				
				// 이름 유효성 검사
				$name.on("input", function() {
					var regExp = /^[가-힣]{2,}$/; 

					if (!regExp.test($(this).val())) { 
						$("#checkName").text("한글 두 글자 이상을 입력하세요").css("color", "red").attr("data-tooltip-text", "두 글자 이상의 한글");
						$name.css("border", "1px solid red");
						signUpCheck.name = false;
					} else {
						$("#checkName").text("올바른 이름입니다").css("color", "green");
						$name.css("border", "1px solid #5fcf80");
						signUpCheck.name = true;
					}
				});

				// 닉네임 유효성 검사
				$nickName.on("input", function() {
					var regExp = /^[가-힣A-Za-z\d]{3,12}$/; 

					if (!regExp.test($(this).val())) { 
						$("#checkNickName").text("세 글자 이상을 입력하세요").css("color", "red").attr("data-tooltip-text", "3~12글자 사이의 영문,한글,숫자");
						$nickName.css("border", "1px solid red");
						signUpCheck.nickName = false;
					} else {
						/* $("#checkNickName").text("올바른 닉네임입니다").css("color", "green");
						$nickName.css("border", "1px solid #5fcf80");
						signUpCheck.name = true; */
						$.ajax({
							url : "nickDupCheck",
							data : {"memberNickName" : $nickName.val()},
							type : "post",
							success : function(result){
								
								if(result == 0){	
									$("#checkNickName").text("사용 가능한 닉네임입니다").css("color", "green");
									$nickName.css("border", "1px solid #5fcf80");
									signUpCheck.nickName = true;
									
								}else{
									$("#checkNickName").text("이미 사용중인 닉네임 입니다.").css("color", "red").attr("data-tooltip-text", "다른 닉네임명을 입력하세요");
									$nickName.css("border", "1px solid red");
									signUpCheck.nickName = false;
								}
								
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
							
						});
						
					}
				});
      
				// 이메일 유효성검사
						$email.on("input",function() {
						var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3
				
						if (!regExp.test($(this).val())) { // 이메일이 정규식을 만족하지 않을경우
							$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color", "red").attr("data-tooltip-text", "xxxx~@xxx~.xxx의 형식");
							$email.css("border", "1px solid red");
							signUpCheck.email = false;
						} else {
							$("#checkEmail").text("유효한 이메일 형식입니다.").css("color", "green");
							$email.css("border", "1px solid #5fcf80");
							signUpCheck.email = true;
						}
					});
				
				
						// 유효성 검사 
						function memberJoinvalidate() {

							for ( var key in signUpCheck) {
								if (!signUpCheck[key]) {
									var str;
									switch (key) {
									case "id" : str = "아이디"; break;
									case "pwd1": str = "비밀번호";	break;
									case "pwd2": str = "비밀번호 확인";break;
									case "name": str = "이름";	break;
									case "nickName":str = "닉네임";break;
									case "email": str = "이메일"; break;
									}
									
									

									swal({icon:"warning", title:str+" 형식이 유효하지 않습니다."});
									
								}
							}
							
						$memberAddress = $("<input>", {type : "hidden", name : "memberAddr",
								value : $("#post").val() + "," + $("#address1").val() + "," + $("#address2").val()
						});

						$("form[name='signUpForm']").append($memberAddress);
							
							
							
						}
				
				
				
				
				
				// ----------------메일 인증 AJAX -------------------------
				var key;
				
				$("#sendBtn").click(function() {// 메일 입력 유효성 검사
		 		var mail = $("#memberEmail").val(); //사용자의 이메일 입력값. 
		 		
		 		if (mail == "") {
		 			alert("메일 주소가 입력되지 않았습니다.");
		 		} else {
		 			$.ajax({
		 				type : 'post',
		 				url : 'normalSignUpMail',
		 				data : {
		 					mail:mail
		 					},
		 				
		 				success : function(result){
		 					key = result;
		 					
		 				}
		 			});
		 		alert("인증번호가 전송되었습니다.");
		 		}
		 	});
		 	
		 		$("#verifyEmail").on("propertychange change keyup paste input", function() {
		 			if ($("#verifyEmail").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
		 				$("#checkKey").text("인증 성공!").css("color", "green");
		 				$("#verifyEmail").css("border", "1px solid #5fcf80");
		 				isCertification = true;  //인증 성공여부 check
		 			} else {
		 				$("#checkKey").text("불일치!").css("color", "red");
		 				$("#verifyEmail").css("border", "1px solid red");
		 				isCertification = false; //인증 실패
		 			}
		 		});
		 		
		 		
		 		$("#nextBtn").click(function memberJoinvalidate(){
		 			if(isCertification==false){
		 				alert("메일 인증이 완료되지 않았습니다.");
		 				return false;
		 			}
		 		}); 
							
				
      </script>
    </body>
</html>

 
