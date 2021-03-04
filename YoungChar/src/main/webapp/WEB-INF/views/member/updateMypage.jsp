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

		<title>마이페이지 수정</title>
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
<c:set var="address" value="${fn:split(loginMember.memberAddr, ',') }" />
		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
			<!-- End Header-->



		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">

					
						<div class="col-xl-8">
							<form class="card" action="mypageUpdate" name="signUpForm" enctype="multipart/form-data" onsubmit="return memberJoinvalidate();">
							  <div class="card-header">
									<div class="img bg-wrap text-center">
										<div class="user-logo content1" data-toggle="modal" data-target="#exampleModal">
											<img class="img" id="contentImg1" src="${contextPath}${memFile.memImgPath}/${memFile.memImgName}">
												<input type="file" id="img0" name="images" onchange="LoadImg(this,0)">
											<h4 class="card-title mb-0">${loginMember.memberNm}</h4>
										</div>
									</div>
								<div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
							  </div>
							  <div class="card-body">
								<div class="row">
								  <div class="col-md-12">
									<div class="mb-3">
									  <label class="form-label">현재 비밀번호</label>
									  <input class="form-control" type="password" id="memberPwd" name="memberPwd" placeholder="정보 수정을 위해 현재 비밀번호를 입력해주세요.">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3" id="checkPwd1">
									  <label class="form-label">새 비밀번호</label>
									  <input class="form-control" type="password" id="memberPwd1" name="memberPwd1" class="toolT checkPwd1" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3" id="checkPwd2">
									  <label class="form-label">새 비밀번호 확인</label>
									  <input class="form-control" type="password" id="memberPwd2" name="memberPwd2" class="toolT checkPwd2" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">전화번호 *</label>
									  <input class="form-control" type="text" id="phone" name="phone" value="${loginMember.phone }" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3" id="checkNickName">
									  <label class="form-label">닉네임 *</label>
									  <input class="form-control" type="text" id="nickName" name="nickName" class="toolT checkNickName" value="${loginMember.nickName }" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-4">
									<div class="mb-3">
									  <label class="form-label postcodify_search_button">주소</label>
									  <input class="form-control postcodify_postcode5 inputTag address" type="text"  name="post" id="post" value="${address[0]}" placeholder="우편번호">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-2">
									<div class="mb-3">
									  <label class="form-label">&nbsp;</label>
									  <button class="form-control btn btn-outline-success sendBtn" id="postcodify_search_button" type="button">검색</button>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input class="form-control postcodify_address inputTag" name="address1" id="address1" type="text" value="${address[1]}" placeholder="도로명주소">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input class="form-control postcodify_details inputTag" name="address2" id="address2" type="text" value="${address[2]}" placeholder="상세주소">
									</div>
								  </div>
								</div>
							  </div>
							  <div class="card-footer text-end">
								<button class="right btn btn-success" type="submit" >정보 수정</button>
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
		
		
		
		<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로필 변경</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
						
						<button type="button" id="otherImg" class="btn btn-outline-success btn-lg">다른 프로필 이미지 선택</button>
						<button type="button" id="clearImg" class="btn btn-outline-success btn-lg" aria-label="Close">프로필 이미지 삭제</button>
				</div>
			</div>
		</div>
	</div>
	
		<!-- End Page Content-->
		</section>
		
		
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
			 // 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
			$(function(){
				$("#img0").hide(); // #fileArea 요소를 숨김.		
				
				$("#otherImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
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
			
			
			
			
				// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
				$(function() {
					$("#postcodify_search_button").postcodifyPopUp();
				});
				
				var updateCheck = {
						"pwd1" : false,
						"pwd2" : false,
						"nickName" : false
					};
				
				var $pwd1 = $("#memberPwd1");
				var $pwd2 = $("#memberPwd2");
				var $nickName = $("#nickName");
				
				
				
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
				
				
				// 닉네임 유효성 검사
				$nickName.on("input", function() {
					var regExp = /^[가-힣A-Za-z\d]{3,12}$/; 

					if (!regExp.test($(this).val())) { 
						$("#checkNickName").attr("data-tooltip-text", "3~12글자 사이의 영문,한글,숫자");
						$nickName.css("border", "1px solid red");
						updateCheck.nickName = false;
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
									$("#checkNickName").attr("data-tooltip-text", "사용 가능한 닉네임입니다");
									$nickName.css("border", "1px solid #5fcf80");
									updateCheck.nickName = true;
									
								}else{
									$("#checkNickName").attr("data-tooltip-text", "이미 사용중인 닉네임입니다. 다른 닉네임명을 입력하세요");
									$nickName.css("border", "1px solid red");
									updateCheck.nickName = false;
								}
								
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
							
						});
						
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
							case "nickName":str = "닉네임";break;
							}
							
							

							swal({icon:"warning", title:str+" 형식이 유효하지 않습니다."});
							
						}
					}
					
				$memberAddress = $("<input>", {type : "hidden", name : "memberAddr",
						value : $("#post").val() + "," + $("#address1").val() + "," + $("#address2").val()
				});

				$("form[name='signUpForm']").append($memberAddress);
					
					
					
				}
				
				var $beforeImg = $('#contentImg1');
				
				var $newImg = $("<img class='img'>", {id : $beforeImg.attr("id")
					} );
				
				var memImgNo = ${memFile.memImgNo};
				$("#clearImg, #otherImg").on("click", function() {
					$beforeImg.remove();
					
					$.ajax({
						url : "deleteProfile",
						data : {"memImgNo" : memImgNo},
						type : "post",
						success : function(result){
							
							if(result == 1){	
								alert("프로필 이미지 삭제");
								$(".content1").prepend($newImg);
							}else{
								alert("프로필 이미지 삭제 실패");
							}
							
						},
						error : function(){
							console.log("ajax 통신 실패");
						}
						
					});
					
				});
				

				
				
				
				
				
				
			</script>

	</body>
</html>