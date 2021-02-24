<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>시승 센터</title>

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
		<div class="rn-page-title" margin="">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>시승 센터</h1>
							<p>원하는 차량을 시승해보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<!-- What We Offer-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Service</h2>
							<p>원하는 서비스를 선택하세요</p>
							<span class="rn-title-bg">Service</span>
						</div>

					</div>
				</div>
				<div class="row">

					<div class="col-lg-6 col-md-6">

						<!-- Service Item-->
						<div class="rn-service-item"  OnClick="location.href ='reservation'" style="cursor:pointer;">
							<div class="rn-service-icon">
								<i class="lnr lnr-calendar-full"></i>
							</div>
							<div class="rn-service-title">시승 예약</div>
							<div class="rn-service-desc">
								<p>자동차 시승 예약</p>
							</div>
						</div>
						<!-- End Service Item-->

					</div>


					<div class="col-lg-6 col-md-6">

						<!-- Service Item-->
						<div class="rn-service-item"  OnClick="location.href ='myReservation'" style="cursor:pointer;">
							<div class="rn-service-icon">
								<i class="lnr lnr-user"></i>
							</div>
							<div class="rn-service-title">내 시승 예약</div>
							<div class="rn-service-desc">
								<p>예약 확인 / 수정 / 취소</p>
							</div>
						</div>
						<!-- End Service Item-->

					</div>

					
					
				</div>
			</div>
		</section>
		<!-- End What We Offer-->

		<!-- Call To Action-->
		<section class="rn-section rn-service-c2a">
			<div class="rn-section-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2>자동차 시승 후기가 궁금하신가요?</h2>
						<p>시승 후기 게시판에서 시승 후기를 확인하세요.</p>
						<a class="btn btn-main btn-lg btn-shadow" href="#">시승 후기 게시판</a>
					</div>
				</div>
			</div>
		</section>
		<!-- End Call To Action-->

		<!-- Clients-->
		<section class="rn-section rn-section-light-gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Review</h2>
							<p></p>
							<span class="rn-title-bg">Review</span>
						</div>

						<div class="rn-testimonials">
							<div class="rn-testimonials-carousel carousel slide" id="rn-testimonials" data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">

										<!-- Testimonial Item-->
										<blockquote class="rn-testimonial-item">
											<div class="rn-testimonial-author">
												<div class="rn-testimonial-author-thumb">
													<img src="${contextPath}/resources/assets/images/author-1.jpg" alt="John Doe" srcset="${contextPath}/resources/assets/images/author-1.jpg 1x, ${contextPath}/resources/assets/images/author-1@2x.jpg 2x"/>
												</div>
												<div class="rn-testimonial-author-info"><strong>안나공주</strong>
													<p>Anna princess</p>
												</div>
											</div>
											<p>테슬라 개 짱짱
												역시 전기차는 테슬라죠? 천슬라 가즈아
											</p>
											<footer>
												<div class="rn-testimonial-rating">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</footer>
										</blockquote>
										<!-- End Testimonial Item-->

									</div>
									<div class="carousel-item">

										<!-- Testimonial Item-->
										<blockquote class="rn-testimonial-item">
											<div class="rn-testimonial-author">
												<div class="rn-testimonial-author-thumb">
													<img src="${contextPath}/resources/assets/images/author-2.jpg" alt="John Doe" srcset="${contextPath}/resources/assets/images/author-2.jpg 1x, ${contextPath}/resources/assets/images/author-2@2x.jpg 2x"/>
												</div>
												<div class="rn-testimonial-author-info"><strong>페페</strong>
													<p>Elsa PePe</p>
												</div>
											</div>
											<p>개굴개굴개굴 페페페페
												렛잇고~!
											</p>
											<footer>
												<div class="rn-testimonial-rating">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</footer>
										</blockquote>
										<!-- End Testimonial Item-->

									</div>
									<div class="carousel-item">

										<!-- Testimonial Item-->
										<blockquote class="rn-testimonial-item">
											<div class="rn-testimonial-author">
												<div class="rn-testimonial-author-thumb">
													<img src="${contextPath}/resources/assets/images/author-3.jpg" alt="John Doe" srcset="${contextPath}/resources/assets/images/author-3.jpg 1x, ${contextPath}/resources/assets/images/author-3@2x.jpg 2x"/>
												</div>
												<div class="rn-testimonial-author-info"><strong>주얼리알파고</strong>
													<p>Alphago </p>
												</div>
											</div>
											<p>감자빵 사와라</p>
											<footer>
												<div class="rn-testimonial-rating">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</footer>
										</blockquote>
										<!-- End Testimonial Item-->

									</div>
								</div>
								<a class="carousel-control-prev" href="#rn-testimonials" role="button" data-slide="prev">
									<i class="fas fa-angle-left" aria-hidden="true"></i>
								</a>
								<a class="carousel-control-next" href="#rn-testimonials" role="button" data-slide="next">
									<i class="fas fa-angle-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Clients-->

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