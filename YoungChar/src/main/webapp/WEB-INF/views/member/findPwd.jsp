<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>비밀번호 찾기</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

		<!-- Preloader CSS-->
		<style>
				.card{
				font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: rgb(85, 85, 85);
			}
			

			.bg-wrap .user-logo .img {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				margin: 0 auto;
				margin-bottom: 10px; }
			.bg-wrap .user-logo h3 {
				color: black;
				font-size: 18px; }

			.img {
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center center; 
			}	

			.rn-service-item {
				width: 230px;
				display: inline-block;
				margin: 25px;
			}

			.card{
				width: 850px;
			}

			.rn-widget {
				margin-bottom: 40px;
				font-size: 20px;
				line-height: 60px;
			}

			.rn-pagination {
				margin-bottom: 40px;
				text-align: center;
			}

			#select1{
				width: 100px;
				display: inline-block;
				float: right;
			}

			#select2{
				width: 100px;
				padding: 0px;
			}

			#head{
				display: inline-block;
				font-size: 21px;
				font-weight: bold;
			}

			.left{
				float: left;
			}

			.right{
				float: right;
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

#contentImg1:hover{
	cursor: pointer;
}

	
		</style>
		

	</head>
	<body class="rn-preloader">
		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
			<!-- End Header-->



		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">

					
						<div class="col-xl-8">
							<form class="card" action="findPwdAction" name="findPwdAction" method="post" onsubmit="return memberJoinvalidate();">
							  
							  <div class="card-body">
								<div class="row">
								  
								  <h2 style="text-align: center">비밀번호 찾기(변경)</h2><br><br>
								  <div class="col-md-12">
									<div class="mb-3">
									  <label class="form-label">아이디</label>
									  <input class="form-control" type="text" id="memberId" name="memberId" placeholder="회원가입한 아이디 입력" required="required">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">이메일</label>
									  <input class="form-control" type="email" id="memberEmail" name="memberEmail" placeholder="회원가입시 작성한 이메일 입력" required="required">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3" id="verifyEmail1">
									  <label class="form-label">인증번호 입력</label>
									  <input class="form-control" type="text" id="verifyEmail" name="verifyEmail" required="required">
									</div>
								  </div>
								  <div class="col-md-12">
								  <div class="col-sm-6 col-md-6">
								  
								  <button class="right btn btn-success" type="button" id="sendBtn">인증</button>
								  
								  </div>
									</div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3" id="checkPwd1">
									  <label class="form-label">새 비밀번호</label>
									  <input class="form-control" type="password" id="memberPwd1" name="memberPwd1" required="required">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3" id="checkPwd2">
									  <label class="form-label">새 비밀번호 확인</label>
									  <input class="form-control" type="password" id="memberPwd2" name="memberPwd2" required="required">
									</div>
								  </div>
								  
								  
								  
								</div>
							  </div>
							  <div class="card-footer text-end">
								<button class="right btn btn-success" type="submit" id="findPwdBtn">다음 단계</button>
							  </div>
							</form>
						  </div>


		
					</div>
					<div id="side-bar">

						<!-- Sidebar-->
							<jsp:include page="sideMenu2.jsp"/>
						<!-- End Slidebar-->

					</div>
				</div>
		</div>
		
		
		

	
		<!-- End Page Content-->
		</section>
		<jsp:include page="../common/footer.jsp"/>
		
		<!-- Site Footer-->
		<!-- End Site Footer-->

		<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->
		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>
		
     	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>

	   
			// ----------------메일 인증 AJAX -------------------------
			var key;
			
			$("#sendBtn").click(function() {// 메일 입력 유효성 검사
	 		var mail = $("#memberEmail").val(); //사용자의 이메일 입력값. 
	 		
	 		if (mail == "") {
	 			alert("메일 주소가 입력되지 않았습니다.");
	 		} else {
	 			$.ajax({
	 				type : 'post',
	 				url : 'findPwdMail',
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
	 				$("#verifyEmail").css("border", "1px solid #5fcf80");
	 				$("#verifyEmail1").attr("data-tooltip-text", "인증번호 일치")
	 				isCertification = true;  //인증 성공여부 check
	 			} else {
	 				$("#verifyEmail").css("border", "1px solid red");
	 				$("#verifyEmail1").attr("data-tooltip-text", "인증번호 불일치")
	 				isCertification = false; //인증 실패
	 			}
	 		});
	 		
	 		
	 		$("#findPwdBtn").click(function memberJoinvalidate(){
	 			if(isCertification==false){
	 				alert("메일 인증이 완료되지 않았습니다.");
	 				return false;
	 			}
	 		}); 
				

				
			var updateCheck = {
					"pwd1" : false,
					"pwd2" : false,
				};

			var $pwd1 = $("#memberPwd1");
			var $pwd2 = $("#memberPwd2");
				
				
			// 비밀번호 유효성 및 일치 검사
			$("#memberPwd1, #memberPwd2").on("input",function() {
				//영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
		
				// 비밀번호1 유효성 검사
				if (!regExp.test($("#memberPwd1").val())) {
					$("#checkPwd1").attr("data-tooltip-text", "6~12자리의 영어 대,소문자와 숫자");
					$pwd1.css("border", "1px solid red");
					updateCheck.pwd1 = false;
				} else {
					$pwd1.css("border", "1px solid #5fcf80");
					updateCheck.pwd1 = true;
				}
		
				// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
				if (!updateCheck.pwd1 && $pwd2.val().length > 0) {
					alert("유효한 비밀번호를 작성해 주세요.");
					$pwd2.val("");
					$pwd1.focus();
				} else if (updateCheck.pwd1 && $pwd2.val().length > 0) {
					if ($("#memberPwd1").val().trim() != $("#memberPwd2").val().trim()) {
						$("#checkPwd2").attr("data-tooltip-text", "비밀번호 불일치");
						$pwd2.css("border", "1px solid red");
						updateCheck.pwd2 = false;
					} else {
						$("#checkPwd2").attr("data-tooltip-text", "비밀번호 일치");
						$pwd2.css("border", "1px solid #5fcf80");
						updateCheck.pwd2 = true;
					}
				}
		
			});
			
			// 유효성 검사 
			function memberJoinvalidate() {

				for ( var key in updateCheck) {
					if (!updateCheck[key]) {
						var str;
						switch (key) {
						case "pwd1": str = "비밀번호";	break;
						case "pwd2": str = "비밀번호 확인";break;
						}
						return false;
						swal({icon:"warning", title:str+" 형식이 유효하지 않습니다."});
						
					}
				}
				
			}
				
				
			</script>

	</body>
</html>