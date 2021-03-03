<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>충전기 설치 업체 등록</title>

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


			<form action="insertAction"  method="post" enctype="multipart/form-data" role="form" onsubmit="return validate();">
			<!-- enctype="multipart/form-data" -->

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">썸네일</label>
					<div class="boardImg" id="titleImgArea">
						<img id="titleImg" width="200" height="200">
					</div>
				</div>
				
					<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="img0" name="image" onchange="LoadImg(this,0)"> 
				</div>
				
				<hr>
				
				<div class="row">
				<div class="col-lg-8" id="companyContent">
					<textarea class="form-control" id="content" name="companyContent" placeholder="내용을 입력하세요." rows="10" style="resize: none;"></textarea>
				</div>
				<div class="col-lg-4">

					<!-- Check Availability-->
					<div class="rn-small-search-form">
						<div class="rn-small-search-form-title">
							<h2>충전기 설치 업체 등록</h2>
						</div>
							<div class="rn-icon-input" id="companyName">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="companyName" placeholder="업체명을 입력하세요.">
							</div>
							<div class="rn-icon-input" id="phone">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="phone" placeholder="전화번호를 입력하세요.">
							</div>
							<div class="rn-icon-input" id="fax">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="fax" placeholder="팩스번호를 입력하세요.">
							</div>
							<div class="rn-icon-input" id="email">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="email" placeholder="이메일을 입력하세요.">
							</div>
							<div class="rn-icon-input" id="link">
								<i class="fas fa-map-marker-alt"></i> <input type="text" name="link" placeholder="링크를 입력하세요">
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
					<button id="submitButton" type="submit" class="btn btn-success">등록</button>
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
	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
</body>
</html>