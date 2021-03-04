<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>충전기 설치 업체 수정</title>

<style>
    .insert-label {
      display: inline-block;
      width: 80px;
      line-height: 40px
    }
    
    #submitButton {
    	float: right;
    	margin-left: 25px;
    }
    
    .boardImg{
    	cursor: pointer;
    }
    
    #cont {
    	margin-left: 10px;
    }
</style>

<!--
		All CSS Codes Loaded
		Ex: bootstrap, fontawesome, style, etc.
		-->
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/fontawesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/linearicons/linearicons.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/rentnow-icons.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/style.css">

<!-- Google Map JS-->
<script src="https://maps.googleapis.com/maps/api/js?key=[YOUR_API_KEY]"></script>

<!-- Header-->
<jsp:include page="../common/header.jsp"></jsp:include>

</head>
<body>

	<!-- Single Car Header-->
	<div class="rn-single-car-header">
		<div class="rn-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-car-single-info"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Single Car Header-->

	<!-- Single Car Content-->
	<section class="rn-section">
		<div class="container">

		<div class="container pb-5 mb-5">


			<form action="updateAction"  method="post" name="updateForm" enctype="multipart/form-data" role="form" onsubmit="return validate();">
			<!-- enctype="multipart/form-data" -->

				<div class="form-inline mb-2">
					<div class="boardImg" id="titleImgArea">
						<img id="titleImg" width="200" height="200">
						<span class="deleteImg">x</span>
					</div>
					<label class="input-group-addon mr-3 insert-label" id="cont">UPDATE IMAGE</label>
				</div>
				
					<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="img0" name="image" onchange="LoadImg(this,0)"> 
				</div>
				
				<hr>
				
				<div class="row">
				<div class="col-lg-8" id="companyContent">
					<textarea class="form-control" id="content" name="companyContent"  rows="10" style="resize: none;">${chargerCompany.companyContent}</textarea>
				</div>
				<div class="col-lg-4">

					<!-- Check Availability-->
					<div class="rn-small-search-form">
						<div class="rn-small-search-form-title">
							<h2>충전기 설치 업체 수정</h2>
						</div>
							<div class="rn-icon-input" id="companyName">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="companyName" value="${chargerCompany.companyName}">
							</div>
							<div class="rn-icon-input" id="phone">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="phone" value="${chargerCompany.phone}">
							</div>
							<div class="rn-icon-input" id="fax">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="fax" value="${chargerCompany.fax}">
							</div>
							<div class="rn-icon-input" id="email">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="email" value=" ${chargerCompany.email}">
							</div>
							<div class="rn-icon-input" id="link">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="link" value="${chargerCompany.link}">
							</div>

					</div>
					<!-- End Check Availability-->

					<!-- Car Sharing Buttons-->
					<div class="rn-car-share">
						<span>Share this Company : </span>
						<ul>
							<li><a href="#"> <i class="fab fa-facebook-f"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-twitter"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-google-plus-g"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-linkedin-in"></i>
							</a></li>
						</ul>
					</div>
					<!-- End Car Sharing Buttons-->

				</div>
			</div>

				<hr class="mb-4">

				<div class="text-center">
					<button id="submitButton" type="submit" class="btn btn-success">수정</button>
					<a class="btn btn-success float-right" href="${sessionScope.returnListURL}">이전</a>
				</div>

			</form>
		</div>

	</div>
	</section>
	<!-- End Single Car Content-->




	<!-- Site Footer-->
	<footer class="rn-footer">

		<!-- Footer Widgets-->
		<div class="rn-footer-widgets">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">About Us</h2>
							<div class="rn-widget-content">
								<a class="brand-name" href="index.html"> <img src="assets/images/logo.svg" alt="Logo">
								</a>
								<p>Sed sit amet ligula ac nulla finibus euismod nec nec diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent semper, risus eget ornare maximus, ipsum ante semper.</p>
								<ul class="rn-widget-social">
									<li><a href="#"> <i class="fab fa-facebook-f"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-twitter"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-instagram"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-linkedin-in"></i>
									</a></li>
								</ul>
							</div>
						</section>
						<!-- End Widget Item-->

					</div>
					<div class="col-md-5">

						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">Quick Links</h2>
							<div class="rn-widget-content">
								<div class="row rn-quick-links">
									<div class="col-6">
										<ul>
											<li><a href="#">About Us</a></li>
											<li><a href="#">Contact Us</a></li>
											<li><a href="#">Support</a></li>
											<li><a href="#">View Booking</a></li>
											<li><a href="#">Affiliate Programme</a></li>
											<li><a href="#">Marketplace</a></li>
										</ul>
									</div>
									<div class="col-6">
										<ul>
											<li><a href="#">Site Map</a></li>
											<li><a href="#">Careers</a></li>
											<li><a href="#">Press</a></li>
											<li><a href="#">Get a Receipt</a></li>
											<li><a href="#">Community</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>
						<!-- End Widget Item-->

					</div>
					<div class="col-md-3">

						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">Contact Us</h2>
							<div class="rn-widget-content">
								<div class="rn-icon-contents">
									<div class="rn-phone rn-icon-content">
										<div class="rn-icon">
											<i class="lnr lnr-phone"></i>
										</div>
										<div class="rn-info">
											<ul>
												<li>(954)-944-1250</li>
												<li>(954)-944-1251</li>
											</ul>
										</div>
									</div>
									<div class="rn-email rn-icon-content">
										<div class="rn-icon">
											<i class="lnr lnr-envelope"></i>
										</div>
										<div class="rn-info">
											<ul>
												<li>support@example.coms</li>
												<li>sale@example.com</li>
											</ul>
										</div>
									</div>
									<div class="rn-address rn-icon-content">
										<div class="rn-icon">
											<i class="lnr lnr-map-marker"></i>
										</div>
										<div class="rn-info">
											<ul>
												<li>1425 Pointe Lane, Miami</li>
												<li>Florida – 33169, USA</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- End Widget Item-->

					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Widgets-->

		<!-- Footer Copyright-->
		<div class="rn-footer-copyright">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6">
						<p>Copyright &copy; RentNow 2018. All rights reserved.</p>
					</div>
					<div class="col-md-6 text-right">
						<span class="rn-pyament-methods"> <span>We Accept</span> <img src="assets/images/payments.png" alt="payments" srcset="assets/images/payments.png 1x, assets/images/payments@2x.png 2x">
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Copyright-->

	</footer>
	<!-- End Site Footer-->
	
	<script>
	// 이미지 배치


	// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	$(function(){
		$("#fileArea").hide(); // #fileArea 요소를 숨김.		
		
		$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
			var index = $(".boardImg").index(this);// 클릭한 이미지 영역 인덱스 얻어오기
			$("#img" + index).click(); // 클릭된 영역 인덱스에 맞는 input file 태그 클릭
		});
		
	});
	 
	
	 // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	 function LoadImg(value, num) {
	  
		if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
			
			var reader = new FileReader();
	    	reader.readAsDataURL(value.files[0]);
	    	
	    	reader.onload = function(e){
	    		
	    		// 미리보기
				$(".boardImg").eq(num).children("img").attr("src", e.target.result);
				
	    		
	    		// 특정 fileLevel에 이미지가 업로드 된 경우
	    		// == deleteImages 배열에서 해당 fileLevel과 일치하는 인덱스의 값을
	    		// false로 바꿔 삭제되지 않음을 알려줌.
	    		
				
				
	    	}
		}
	}
	
  
	// 유효성 검사
	function validate() {

		// 유효성 검사에서 문제가 없을 경우
		// 유효성 검사에서 문제가 없을 경우 서버에 제출 전
         // deleteImages배열의 내용을 hidden 타입으로 하여 form태그 마지막에 추가하여 파라미터로 전달
         for(var i=0 ; i<deleteImages.length ; i++){
            $deleteImages = $("<input>", {type : "hidden", name : "deleteImages", value : deleteImages[i]});
            $("form[name=updateForm]").append($deleteImages);
         }
		
		
	}
	
	
	
	
	
	// 게시글에 업로드 된 이미지 삭제
	var deleteImages = [];
	// 배열을 생성하여 이미지 삭제 버튼 수 만큼 배열에 false 요소를 추가
	// -> 배열에 4개 false가 추가 됨 == 인덱스는 0~3 == fileLevel과 같음
	// --> 이미지 삭제 버튼이 클릭 될 경우
	// 		해당 fileLevel과 같은 인덱스 값을 true로 변경
	//  	--> 해당 이미지가 삭제 되었음을 전달하기 위한 용도로 사용할 예정

	for(var i=0; i<$(".deleteImg").length; i++) {
		deleteImages.push(false);
	}
	
	// 이미지 삭제 버튼 동작
	$(".deleteImg").on("click", function(event){
		// event : 현재 발생한 이벤트에 대한 정보가 담긴 객체
		event.stopPropagation(); 		// 이벤트가 연달아 실행되는 것을 방지
		
		// 기존 이미지 태그를 삭제하고 새로운 이미지 태그를 만들어서 제자리에 추가
		
		// 기존 이미지 태그
		var $beforeImg = $(this).prev();
		
		// 기존 정보를 토대로 새로운 이미지 태그 생성
		var $newImg = $("<img>", {id : $beforeImg.attr("id"),
															width : $beforeImg.css("width"),
															height : $beforeImg.css("height")	});
		
		$(this).prev().remove();		// 기존 이미지 태그 삭제
		$(this).before($newImg); 		// 새로운 이미지 태그 추가
		
		
		// 특정 fileLevel의 요소가 삭제 되었음을 알리기 위해 deleteImages에 기록
		// == deleteImages에 클릭된 삭제버튼 인덱스와
		// 일치하는 deleteImages 인덱스 값을 true로 변경
		
		deleteImages[$(".deleteImg").index(this)] = true;
		
		console.log(deleteImages);
		
		// 삭제 버튼이 클릭된 경우
		// 해당 이미지와 연결된 input type="file" 태그의 값을 없앰
		$("#img" + ($(".deleteImg").index(this) )).val("");
		
	});
	</script>
	
	
	
	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
</body>
</html>