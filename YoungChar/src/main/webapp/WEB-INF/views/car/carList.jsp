<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 검색, 비교검색</title>


	<!-- Google font-->
			<link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i&amp;display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900&amp;display=swap" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="assets/css/fontawesome.css">
		    <!-- ico-font-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/icofont.css">
			<!-- Themify icon-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/themify.css">
			<!-- Flag icon-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/flag-icon.css">
			<!-- Feather icon-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/feather-icon.css">
			<!-- Plugins css start-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/scrollbar.css">
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/animate.css">
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/chartist.css">
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/owlcarousel.css">
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/prism.css">
			<!-- Plugins css Ends-->
			<!-- Bootstrap css-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/bootstrap.css">
			<!-- App css-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/style2.css">
			<link id="color" rel="stylesheet" href="${contextPath}/resources/assets/css/color-1.css" media="screen">
			<!-- Responsive css-->
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/responsive.css">


</head>
	
	


<body>
<jsp:include page="../common/header.jsp" />

<!-- Page Title-->
		<div class="rn-page-title">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>Car Search</h1>
							<p>Cras eros lorem, rhoncus ac risus sit amet, fringilla ultrices purus.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->
		<!-- Car Search Form-->
		<div class="rn-search-form-big rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-big-search-form rn-big-search-form-dark">
							<form action="car-search.html">
								<div class="row">

									<div class="col-lg-3 ">
										<div class="row">
											<div class="col-lg-7 col-md-8 col-8">
												
											</div>
											<div class="col-lg-5 col-md-4 col-4">
												
											</div>
										</div>
									</div>
									
									<div class="col-lg-3 col-sm-6">
										<div class="rn-icon-input">
											<i class="fas fa-map-marker-alt"></i>
											<input type="text" placeholder="검색할 차량을 입력해 주세요.">
										</div>
									</div>


									
									
									
									<div class="col-lg-3 col-sm-6">
										<div class="rn-icon-input">
											<i class="fas fa-map-marker-alt"></i>
											<input type="text" placeholder="비교할 차량을 입력해 주세요.">
										</div>
									</div>


									<div class="col-lg-3 ">
										<div class="row">
											<div class="col-lg-7 col-md-8 col-8">
												
											</div>
											<div class="col-lg-5 col-md-4 col-4">
												 
											</div>
										</div>
									</div>


								</div>
								<div class="text-center">
									<button class="btn btn-orange btn-lg mt-30 btn-shadow" type="submit">
										<i class="fas fa-search"></i> Find Now
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="rn-shape rn-shape-bottom"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
			<path class="rn-shape-fill" d="M500.2,94.7L0,0v100h1000V0L500.2,94.7z"/>
</svg>
			</div>
		</div>
		<!-- End Car Search Form-->

		<!-- Car Results-->
		<div class="rn-section rn-car-search-results">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Car Search Filters-->
						<div class="rn-car-search-filters">
							<div class="rn-car-search-filter-item">
								<label>Car Brand</label>
								<select>
									<option value="Any">Any</option>
									<option value="Rover">Rover</option>
									<option value="Lexus">Lexus</option>
									<option value="BMW">BMW</option>
									<option value="Tesla">Tesla</option>
									<option value="Lamborghini">Lamborghini</option>
								</select>
							</div>
							
							
							<div class="rn-car-search-filter-item rn-csf-item-last">
								<label>Sort by</label>
								<select>
									<option value="Default">Default</option>
									<option value="Relavent">Relavent</option>
									<option value="Price: High to Low">Price: High to Low</option>
									<option value="Price: Low to High">Price: Low to High</option>
									<option value="Name: A to Z">Name: A to Z</option>
									<option value="Name: Z to A">Name: Z to A</option>
								</select>
							</div>
						</div>
						<!-- End Car Search Filters-->

						<!-- Car Search Item-->
						<div class="rn-car-search-item">
							<div class="rn-car-search-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="" />
									<!--srcset="assets/images/car-search-item-1.jpg 1x, assets/images/car-search-item-1@2x.jpg 2x"-->
								</a>
							</div>
							<div class="rn-car-search-item-info">
								<h2 class="rn-car-search-item-title">
									<a href="#">2021 테슬라 모델 Y</a>
									
								</h2>
								<p>제조사 : 테슬라 | 차종 : 중형</p>

								<div class="rn-car-reviews">

									<a href="#">3 Reviews</a>

								</div>
								<br>
								<div class="rn-car-meta">
									<span>
										<i class="rni-car-seat"></i> 4 Passengers
									</span>
								
									<span>
										<i class="rni-petrol-station"></i> Elctric
									</span>
									<span>
										<i class="rni-car-gear"></i> Auto
									</span>
									<span>
										<i class="rni-car-door"></i> 4 Doors
									</span>
								</div>
							</div>
							<div class="rn-car-search-item-pricing">
								<div class="rn-car-total-price">
									<span>5,999만원</span>
								</div>
								<br>
								<a class="btn btn-main btn-lg btn-shadow" href="carView">상세보기</a>
							</div>
						</div>
						<!-- End Car Search Item-->
							<div class="rn-car-search-item">
							<div class="rn-car-search-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="" />
									<!--srcset="assets/images/car-search-item-1.jpg 1x, assets/images/car-search-item-1@2x.jpg 2x"-->
								</a>
							</div>
							<div class="rn-car-search-item-info">
								<h2 class="rn-car-search-item-title">
									<a href="#">2021 테슬라 모델 Y</a>
									
								</h2>
								<p>제조사 : 테슬라 | 차종 : 중형</p>

								<div class="rn-car-reviews">

									<a href="#">3 Reviews</a>

								</div>
								<br>
								<div class="rn-car-meta">
									<span>
										<i class="rni-car-seat"></i> 4 Passengers
									</span>
								
									<span>
										<i class="rni-petrol-station"></i> Elctric
									</span>
									<span>
										<i class="rni-car-gear"></i> Auto
									</span>
									<span>
										<i class="rni-car-door"></i> 4 Doors
									</span>
								</div>
							</div>
							<div class="rn-car-search-item-pricing">
								<div class="rn-car-total-price">
									<span>5,999만원</span>
								</div>
								<br>
								<a class="btn btn-main btn-lg btn-shadow" href="#">상세보기</a>
							</div>
						</div>
						<!-- End Car Search Item-->


					

						<!-- Load More Cars-->
						<div class="text-center">
							<a class="btn btn-lg btn-outline-light mb-40" href="#">Load More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Car Results-->

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
										<img src="cesassets/images/logo.svg" alt="Logo">
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
								<img src="assets/images/payments.png" alt="payments" srcset="assets/images/payments.png 1x, assets/images/payments@2x.png 2x">
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

</body>
</html>