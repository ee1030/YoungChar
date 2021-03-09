<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>충전기 설치 업체 수정</title>

<style>
.deleteImg {
	position: absolute;
	display: inline-block;
	margin-left: -15px;
	border: none;
	background-color: rgba(1, 1, 1, 0);
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.insert-label {
	display: inline-block;
	width: 80px;
	line-height: 40px
}

#submitButton {
	float: right;
	margin-left: 25px;
}

.boardImg {
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


				<form action="updateAction" method="post" name="updateForm" enctype="multipart/form-data" role="form" onsubmit="return validate();">
					<!-- enctype="multipart/form-data" -->

					<div class="form-inline mb-2">
						<div class="boardImg" id="titleImgArea">
							<img id="titleImg" width="200" height="200"> <span class="deleteImg">x</span>
						</div>
						<label class="input-group-addon mr-3 insert-label" id="cont">UPDATE IMAGE</label>
					</div>

					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea">
						<input type="file" id="img0" name="image" onchange="LoadImg(this,0)">
					</div>

					<hr>

					<div class="row">
					
						<div class="form-inline mb-2">
							<label class="input-group-addon insert-label">한 줄 소개</label> <input type="text" class="form-control" id="introduction" name="introduction" size="70" value="${chargerCompany.introduction}">
						</div>
						
						<div class="col-lg-8">
								<textarea class="form-control" id="content" name="companyContent" rows="10" style="resize: none;">${chargerCompany.companyContent}</textarea>
							</div>
							
							<div class="col-lg-4">

								<!-- Check Availability-->
								<div class="rn-small-search-form">
									<div class="rn-small-search-form-title">
										<h2>충전기 설치 업체 수정</h2>
									</div>
									<div class="rn-icon-input">
										<i class="fas fa-edit"></i><input type="text" id="companyName" name="companyName" value="${chargerCompany.companyName}">
									</div>
									<div class="rn-icon-input">
										<i class="fas fa-edit"></i><input type="text" id="phone" name="phone" value="${chargerCompany.phone}">
									</div>
									<div class="rn-icon-input">
										<i class="fas fa-edit"></i><input type="text" id="fax" name="fax" value="${chargerCompany.fax}">
									</div>
									<div class="rn-icon-input">
										<i class="fas fa-edit"></i><input type="text" id="email" name="email" value=" ${chargerCompany.email}">
									</div>
									<div class="rn-icon-input">
										<i class="fas fa-edit"></i><input type="text" id="link"name="link" value="${chargerCompany.link}">
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

						<div>
							<div class="form-inline mb-2">
								<label class="input-group-addon mr-3 insert-label">대표항목1</label> <input type="text" class="form-control" id="itemA" name="itemA" size="70" value="${chargerCompany.itemA}">
							</div>
							<div class="form-inline mb-2">
								<label class="input-group-addon mr-3 insert-label">대표항목2</label> <input type="text" class="form-control" id="itemB" name="itemB" size="70" value="${chargerCompany.itemB}">
							</div>
						</div>

						<hr class="mb-4">

						<div class="text-center">
							<button id="submitButton" type="submit" class="btn btn-success">수정</button>
							<a class="btn btn-success float-right" href="javascript:history.back();">이전</a>
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
	<c:forEach var="at" items="${chargerCompanyList}">
	$(".boardImg").eq(${at.fileLevel}).children("img").attr("src", "${contextPath}${at.filePath}/${at.fileName}");
</c:forEach>
	</script>

	<script>
		// 유효성 검사
		function validate() {
			if ($("#companyName").val().trim().length == 0) {
				alert("업체명을 입력해 주세요.");
				$("#companyName").focus();
				return false;
			}

			if ($("#phone").val().trim().length == 0) {
				alert("전화번호를 입력해 주세요.");
				$("#phone").focus();
				return false;
			}
			
			if ($("#fax").val().trim().length == 0) {
				alert("팩스번호를 입력해 주세요.");
				$("#fax").focus();
				return false;
			}
			
			if ($("#email").val().trim().length == 0) {
				alert("이메일 주소를 입력해 주세요.");
				$("#email").focus();
				return false;
			}
			
			if ($("#link").val().trim().length == 0) {
				alert("링크를 입력해 주세요.");
				$("#link").focus();
				return false;
			}
			
			if ($("#introduction").val().trim().length == 0) {
				alert("한줄 소개를 입력해 주세요.");
				$("#introduction").focus();
				return false;
			}
			
			if ($("#companyContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#companyContent").focus();
				return false;
			}
			
			if ($("#itemA").val().trim().length == 0) {
				alert("항목내용을 입력해 주세요.");
				$("#itemA").focus();
				return false;
			}
			
			if ($("#itemB").val().trim().length == 0) {
				alert("항목내용을 입력해 주세요.");
				$("#itemB").focus();
				return false;
			}
		}
	</script>



	<script>
	// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	$(function(){
		$("#fileArea").hide(); // #fileArea 요소를 숨김.		
		
		$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
			
			// 클릭한 이미지 영역 인덱스 얻어오기
			var index = $(".boardImg").index(this);
					// -> 클릭된 요소가 .boardImg 중 몇번째 인덱스인지 반환
					
			//console.log(index);
			
			// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
			$("#img" + index).click();
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
				
				$(".boardImg").eq(num).children("img").attr("src", e.target.result);
				// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
				
  	}
		}
	}
	</script>

	<script>
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