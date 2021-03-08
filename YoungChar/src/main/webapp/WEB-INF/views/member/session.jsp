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

		<title>회원 탈퇴</title>

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
			
			.form-label{
				font-weight: bold;
			}
			
			.btn{
				height: 40px;
			}
			
			.fa-asterisk{
				color: red;
				font-size: 8px;
				margin-right: 5px;
			}
			
			#text1{
				text-align: center;
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
							<form class="card" method="POST" action="deleteMember" name="updateAction" onsubmit="return validate();">
							  <div class="card-header">
									<div class="img bg-wrap text-center">
										<div class="user-logo">
											<div class="img" style="background-image: url(${contextPath}${memFile.memImgPath}/${memFile.memImgName});"></div>
											<h4 class="card-title mb-0">${loginMember.memberNm}</h4>
										</div>
									</div>
								<div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
							  </div>
							  <div class="card-body">
								<div class="row">
								  <div class="col-md-12">
									<div class="mb-3">
									  <label class="form-label"> 현재 비밀번호</label>
									  <input id="memberPwd" name="memberPwd" class="form-control" type="password" placeholder="정보 수정을 위해 현재 비밀번호를 입력해주세요." required>
									</div>
								  </div>

								  <div class="col-md-12">
									<div class="mb-3">
									<textarea rows="10" cols="100" readonly>
제 1 조 (목적)
본 약관은 서비스(이하 “서비스”)를 제공하는 영차영차(이하 “회사”)와 위 서비스를 이용하는 고객 (이하 “고객”)간에 서비스 이용에 관한 권리와 의무 및 책임 기타 제반사항을 규정함을 목적으로 합니다.


제 2 조 (용어의 정의)
① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
- '회원'이라 함은 이 약관에 동의하고 회원가입을 한 자로서, 회사가 제공하는 서비스를 이용할 수 있는 이용자를 말합니다.
- '이용자ID'라 함은 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 회사가 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
- '비밀번호'라 함은 이용자ID로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말합니다.
- '단말기'라 함은 서비스에 접속하기 위해 회원이 이용하는 컴퓨터, PDA 등의 전상장치를 말합니다.
- '탈퇴'라 함은 회원이 서비스 이용을 해지하는 것을 말합니다.
② 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.


제 3 조 (이용약관의 효력 및 개정)
① 이 약관은 홈페이지를 통해 온라인으로 공시하고 회원의 동의로 효력을 발생합니다.
									
									</textarea>
									</div>
								  </div>
								  <div class="checkbox pull-right">
										<div class="custom-checkbox">
											<div class="form-check">
												<input type="checkbox" name="agree" id="agree"
													class="form-check-input custom-control-input"> <br>
												<label class="form-check-label custom-control-label"
													for="agree">위 약관에 동의합니다.</label>
											</div>
										</div>
									</div>
								  
								  
								  
								</div>
							  </div>
							  <div class="card-footer text-end" id="text1">
										<button class="left btn btn-light" type="submit" id="secession">계정 탈퇴</button>
							  </div>
							</form>
						  </div>


		
					</div>
					<div id="side-bar">

						<!-- Sidebar-->
							<jsp:include page="sideMenu.jsp"/>
						<!-- End Slidebar-->

					</div>
				</div>
		</div>
		<!-- End Page Content-->
		</section>
		<jsp:include page="../common/footer.jsp"/>
		
	<script>
	function validate() {
		
		if($("#memberPwd").val().trim().length == 0){
			alert("비밀번호를 입력해주세요.")
			$("#memberPwd").focus();
			return false;
		}
		
		
	if(!$("#agree").prop("checked")){
		alert("약관에 동의해 주세요.");
		return false;
	}else{
		return confirm("정말로 탈퇴하시겠습니까?");
	}
	
	}


		</script>

	</body>
</html>