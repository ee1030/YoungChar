<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Company Info</title>

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

		    <!-- Google font-->
			<link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i&amp;display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900&amp;display=swap" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/fontawesome.css">
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

		<!-- Google Map JS-->
		<script src="https://maps.googleapis.com/maps/api/js?key=[YOUR_API_KEY]"></script>
		<style>
			#side-bar{
				width: 300px;
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
		</style>
	</head>
	<body class="rn-preloader">
		<div id="preloader"></div>
		<div id="preloader-overlayer"></div>

		<!-- Header-->
		<header class="rn-header">

			<!-- Topbar-->
			<div class="rn-topbar">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-12 col-sm-5 col-lg-3">

							<!-- Tobar Social-->
							<ul class="rn-social">
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
										<i class="fab fa-google-plus-g"></i>
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
						<div class="col-12 col-sm-7 col-lg-9">

							<!-- Topbar Contact with Icon-->
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
					</div>
				</div>
			</div>
			<!-- End Topbar-->


			<!-- Menubar-->
			<div class="rn-menubar">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-4">
							<!-- Logo-->
							<a class="brand-name" href="index.html">
								<img class="img-fluid" src="assets/images/logo.svg" alt="Logo">
							</a>
						</div>
						<div class="col-8">
							<nav class="rn-navbar-container">

								<!-- Navbar Toggle Button for Only Tablet and Phone-->
								<button class="rn-navbar-toggler" id="rn-navbar-toggler">
									<span class="rn-navbar-toggler-bar"></span>
									<span class="rn-navbar-toggler-bar"></span>
									<span class="rn-navbar-toggler-bar"></span>
								</button>

								<!-- Main Nav Menu-->
								<ul class="rn-navbar">
									<li>
										<a href="index.html">Home</a>
									</li>
									<li>
										<a href="#">Cars 
											<i class="lnr lnr-chevron-down"></i>
										</a>
										<ul>
											<li>
												<a href="cars.html">Car List</a>
											</li>
											<li>
												<a href="car-search.html">Car Search</a>
											</li>
											<li>
												<a href="car-single.html">Car Single</a>
											</li>
											<li>
												<a href="checkout.html">Checkout</a>
											</li>
											<li>
												<a href="cart.html">Cart</a>
											</li>
										</ul>
									</li>
									<li>
										<a href="#">Pages 
											<i class="lnr lnr-chevron-down"></i>
										</a>
										<ul>
											<li>
												<a href="about.html">About Us</a>
											</li>
											<li>
												<a href="fullwidth.html">Fullwidth Page</a>
											</li>
											<li>
												<a href="right-sidebar.html">Right Sidebar Page</a>
											</li>
											<li class="active">
												<a href="left-sidebar.html">Left Sidebar Page</a>
											</li>
											<li>
												<a href="faq.html">FAQ</a>
											</li>
											<li>
												<a href="404.html">404 Error</a>
											</li>
											<li>
												<a href="#">Gallery 
													<i class="lnr lnr-chevron-right"></i>
												</a>
												<ul>
													<li>
														<a href="gallery-col-2.html">2 Columns</a>
													</li>
													<li>
														<a href="gallery-col-3.html">3 Columns</a>
													</li>
													<li>
														<a href="gallery-col-4.html">4 Columns</a>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>
										<a href="service.html">Service</a>
									</li>
									<li>
										<a href="#">Blog 
											<i class="lnr lnr-chevron-down"></i>
										</a>
										<ul>
											<li>
												<a href="blog.html">Blog List</a>
											</li>
											<li>
												<a href="blog-grid.html">Blog Grid</a>
											</li>
											<li>
												<a href="blog-grid-sidebar.html">Blog Grid - Sidebar</a>
											</li>
											<li>
												<a href="blog-single.html">Single Post</a>
											</li>
										</ul>
									</li>
									<li>
										<a href="contact.html">Contact</a>
									</li>
								</ul>

							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- End Menubar-->

		</header>
		<!-- End Header-->


		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">

					
						<div class="col-xl-8">
							<form class="card">
							  <div class="card-header">
									<div class="img bg-wrap text-center">
										<div class="user-logo">
											<div class="img" style="background-image: url(${contextPath}/resources/assets/images/dog.png);"></div>
											<h4 class="card-title mb-0">Company name</h4>
											<h6 class="card-title mb-0">110-80-11111</h6>
										</div>
									</div>
								<div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
							  </div>
							  <div class="card-body">
								<div class="row">
								  <div class="col-md-12">
									<div class="mb-3">
									  <label class="form-label">현재 비밀번호</label>
									  <input class="form-control" type="text" placeholder="정보 수정을 위해 현재 비밀번호를 입력해주세요.">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">새 비밀번호</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">새 비밀번호 확인</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">전화번호 *</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">이메일 *</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-4">
									<div class="mb-3">
									  <label class="form-label">주소</label>
									  <input class="form-control" type="text" placeholder="우편번호">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-2">
									<div class="mb-3">
									  <label class="form-label">&nbsp;</label>
									  <button class="form-control btn btn-outline-success" type="submit">검색</button>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input class="form-control" type="text" placeholder="도로명주소">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input class="form-control" type="text" placeholder="상세주소">
									</div>
								  </div>
								</div>
							  </div>
							  <div class="card-footer text-end">
								<button class="left btn btn-light" type="button">계정 탈퇴</button>
								<button class="right btn btn-success" type="submit">정보 수정</button>
							  </div>
							</form>
						  </div>


		
					</div>
					<div id="side-bar">

						<!-- Sidebar-->
						<aside class="rn-widget-area rn-left-sidebar" id="secondary">
		
							<!-- Widget Item-->
							
							<div class="rn-widget">
								<div class="img bg-wrap text-center">
									<div class="user-logo">
										<div class="img" style="background-image: url(${contextPath}/resources/assets/images/dog.png);"></div>
										<h3>company name</h3>
									</div>
								</div>
							</div>
								
							<section class="rn-widget">
								<h2 class="rn-widget-title">Categories</h2>
								<div class="rn-widget-content">
									<ul>
										<li>
											<a href="#">Dash board</a>
										</li>
										<li>
											<a href="#">Schedule</a>
										</li>
										<li>
											<a href="#">Application list</a>
										</li>
										<li>
											<a href="#">Review</a>
										</li>
										<li>
											<a href="#">Company Info</a>
										</li>
									</ul>
								</div>
							</section>
							<!-- End Widget Item-->
				

						</aside>
						<!-- End Slidebar-->

					</divid=>
				</div>
		</div>
		<!-- End Page Content-->
		</section>
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
										<img src="assets/images/logo.svg" alt="Logo">
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
</html>