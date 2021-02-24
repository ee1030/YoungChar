<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Cart | RentNow - Responsive Car Rental Template</title>

		<style>
			.completion{
				background-color: darkgray;
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				border: 1px solid #e9eff2;
				border-radius: 3px;
				margin-bottom: 30px;
				padding: 30px;
			}

			.completion-btn{
				background-color: #e9eff2;
			}
		</style>
		<!-- Preloader CSS-->
		<style>#preloader:after,#preloader:before{content:"";display:block;left:-1px;top:-1px}#preloader-overlayer,#preloader:after,#preloader:before{position:absolute;height:100%;width:100%}#preloader-overlayer{position:fixed;top:0;left:0;background-color:#112E3B;z-index:999}#preloader{height:40px;width:40px;position:fixed;top:50%;left:50%;margin-top:-20px;margin-left:-20px;z-index:9999}#preloader:before{-webkit-animation:rotation 1s linear infinite;animation:rotation 1s linear infinite;border:2px solid #42DB0C;border-top:2px solid transparent;border-radius:100%}#preloader:after{border:1px solid rgba(255,255,255,.1);border-radius:100%}@media only screen and (min-width:768px){#preloader{height:60px;width:60px;margin-top:-30px;margin-left:-30px}#preloader:before{left:-2px;top:-2px;border-width:2px}}@media only screen and (min-width:1200px){#preloader{height:80px;width:80px;margin-top:-40px;margin-left:-40px}}@-webkit-keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}</style>
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
	</head>


		<!-- Header-->
		<jsp:include page="../common/header.jsp"></jsp:include>

		<!-- Page Title-->
		<div class="rn-page-title">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>시승 예약 확인</h1>
							<p>예약 확인 | 예약 수정 | 예약 취소</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<br>
		<!-- 버튼 영역 -->
		<div class="row justify-content-md-center">
			<button class="col-lg-2 btn btn-main btn-shadow btn-block">예약 중</button>
			<button class="col-lg-2 btn completion-btn btn-shadow btn-block">시승 완료</button>
		</div>
		<!-- 버튼 끝 -->

		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Cart Item-->
						<div class="rn-cart-item">
							<div class="rn-cart-item-thumb">
								<img class="img-fluid" src="${contextPath}/resources/assets/images/cart-item-1.jpg" alt="Cart Item" srcset="${contextPath}/resources/assets/images/cart-item-1.jpg 1x, ${contextPath}/resources/assets/images/cart-item-1@2x.jpg 2x"/>
							</div>
							<div class="rn-cart-item-info">
								<div class="rn-cart-item-title-price">
									<h2>
										<a href="#">Tesla Model Y</a>
									</h2>
									<span>--</span>
								</div>
								<div class="rn-locations">
									<div class="rn-pickup-location">
										<div class="rn-location">서울특별시 노원구 ~동 보리센터</div>
									</div>
									<div class="rn-drop-location">
										<div class="rn-date-n-time">2021/02/17 8:00 AM</div>
									</div>
								</div>
								
							</div>
							<div class="rn-cart-item-actions">
								<a class="btn btn-main" href="#">예약 수정</a>
								<a class="btn btn-delete" href="#">예약 취소</a>
							</div>
						</div>
						<!-- End Cart Item-->


						<!-- Cart Item-->
						<div class="rn-cart-item">
							<div class="rn-cart-item-thumb">
								<img class="img-fluid" src="${contextPath}/resources/assets/images/cart-item-1.jpg" alt="Cart Item" srcset="${contextPath}/resources/assets/images/cart-item-1.jpg 1x, ${contextPath}/resources/assets/images/cart-item-1@2x.jpg 2x"/>
							</div>
							<div class="rn-cart-item-info">
								<div class="rn-cart-item-title-price">
									<h2>
										<a href="#">Tesla Model Y</a>
									</h2>
									<span>--</span>
								</div>
								<div class="rn-locations">
									<div class="rn-pickup-location">
										<div class="rn-location">서울특별시 노원구 ~동 보리센터</div>
									</div>
									<div class="rn-drop-location">
										<div class="rn-date-n-time">2021/02/17 8:00 AM</div>
									</div>
								</div>
								
							</div>
							<div class="rn-cart-item-actions">
								<a class="btn btn-main" href="#">예약 수정</a>
								<a class="btn btn-delete" href="#">예약 취소</a>
							</div>
						</div>
						<!-- End Cart Item-->

						<!-- Cart Item-->
						<div class="rn-cart-item completion" >

							<div class="rn-cart-item-thumb">
								<img class="img-fluid" src="${contextPath}/resources/assets/images/cart-item-1.jpg" alt="Cart Item" srcset="${contextPath}/resources/assets/images/cart-item-1.jpg 1x, ${contextPath}/resources/assets/images/cart-item-1@2x.jpg 2x"/>
							</div>
							<div class="rn-cart-item-info">
								<div class="rn-cart-item-title-price">
									<h2>
										<a href="#">Tesla Model Y</a>
									</h2>
									<span>--</span>
								</div>
								<div class="rn-locations">
									<div class="rn-pickup-location">
										<div class="rn-location">서울특별시 노원구 ~동 보리센터</div>
									</div>
									<div class="rn-drop-location">
										<div class="rn-date-n-time">2021/02/17 8:00 AM</div>
									</div>
								</div>
								
							</div>
							<div class="rn-cart-item-actions">
								<a class="btn btn-main" href="#">후기 남기기</a>
							</div>
						</div>
						<!-- End Cart Item-->
						

					</div>
				</div>
				
			</div>
		</section>
		<!-- End Page Content-->

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
									<a class="brand-name" href="index.html">
										<img src="${contextPath}/resources/assets/images/logo.svg" alt="Logo">
									</a>
									<p>Sed sit amet ligula ac nulla finibus euismod nec nec diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent semper, risus eget ornare maximus, ipsum ante semper.</p>
									<ul class="rn-widget-social">
										<li>
											<a href="#">
												<i class="fab fa-facebook-f"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-twitter"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-instagram"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-linkedin-in"></i>
											</a>
										</li>
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
												<li>
													<a href="#">About Us</a>
												</li>
												<li>
													<a href="#">Contact Us</a>
												</li>
												<li>
													<a href="#">Support</a>
												</li>
												<li>
													<a href="#">View Booking</a>
												</li>
												<li>
													<a href="#">Affiliate Programme</a>
												</li>
												<li>
													<a href="#">Marketplace</a>
												</li>
											</ul>
										</div>
										<div class="col-6">
											<ul>
												<li>
													<a href="#">Site Map</a>
												</li>
												<li>
													<a href="#">Careers</a>
												</li>
												<li>
													<a href="#">Press</a>
												</li>
												<li>
													<a href="#">Get a Receipt</a>
												</li>
												<li>
													<a href="#">Community</a>
												</li>
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
							<span class="rn-pyament-methods">
								<span>We Accept</span>
								<img src="${contextPath}/resources/assets/images/payments.png" alt="payments" srcset="${contextPath}/resources/assets/images/payments.png 1x, ${contextPath}/resources/assets/images/payments@2x.png 2x">
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- End Footer Copyright-->

		</footer>
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
	</body>
</html>