<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>

<style>
#ssss{
		margin-top: 20px;
    margin-bottom: 40px;
    left: 600px;
	

}

</style>



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
							<h1>News &amp; Updates</h1>
							<p>Cras eros lorem, rhoncus ac risus sit amet, fringilla ultrices purus.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<!-- Page Content-->
		
		<div class="rn-section">
			<div class="container">
				
				<div class="row">
					<h1>리뷰 게시판</h1>

					<div id="ssss">


						<select name="sk" class="form-control" style="width: 100px; display: inline-block; margin: auto;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="titcont">제목+내용</option>
				</select> 
				<input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
				<button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block;">검색</button>
			</div>
			
		</div>
					
					<div class="col-lg-12 rn-post-list">

						<div class="col-md-2" style="float: left;">
							<section class="rn-widget">
								<h2 class="rn-widget-title">Categories</h2>
								<div class="rn-widget-content">
									<ul>
										<li>
											<a href="#">Tesla</a>
										</li>
										<li>
											<a href="#">BYD</a>
										</li>
										<li>
											<a href="#">Rimac</a>
										</li>
										<li>
											<a href="#">르노-닛산</a>
										</li>
										<li>
											<a href="#">Volkswagen</a>
										</li>
									</ul>

								</div>
							</section>
							<section class="rn-widget">
								<h2 class="rn-widget-title">게시판 이동</h2>
								<div class="rn-widget-content">
									<ul>
										<li>
											<a href="#">리뷰 게시판</a>
										</li>
										<li>
											<a href="#">잡담 게시판</a>
										</li>
									
										
									</ul>
								</div>
							</section>
						</div>

						
						<div class="row">

							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="A standard blog post with image"/>
											<!-- srcset="assets/images/blog-item-sm-1.jpg 1x, assets/images/blog-item-sm-1@2x.jpg 2x" -->
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">2018-02</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-author">유저일
													</span>
													<span class="rn-post-item-categories">Tesla <br>
													</span>
													<span class="rn-post-item-categories">views 1000
													</span>
												</div>
												<span>
													<p>내 테슬라 어떰 ? 봐줄만 한가요 ? 얼른와서 한번 구경해보세요 !</p>
												</span>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-2.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-2.jpg 1x, assets/images/blog-item-sm-2@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-3.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-3.jpg 1x, assets/images/blog-item-sm-3@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-4.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-4.jpg 1x, assets/images/blog-item-sm-4@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-5.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-5.jpg 1x, assets/images/blog-item-sm-5@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-6.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-6.jpg 1x, assets/images/blog-item-sm-6@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-7.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-7.jpg 1x, assets/images/blog-item-sm-7@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-8.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-8.jpg 1x, assets/images/blog-item-sm-8@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
							
							
					
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm">
									<div class="rn-post-item-thumb">
										<a href="#">
											<img class="img-fluid" src="assets/images/blog-item-sm-12.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-sm-12.jpg 1x, assets/images/blog-item-sm-12@2x.jpg 2x"/>
										</a>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner">
												<div class="rn-post-date-d">15</div>
												<div class="rn-post-date-m-y">May, 2018</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-categories">In 
														<a href="#">News</a>
													</span>
													<span class="rn-post-item-author">By 
														<a href="#">John Doe</a>
													</span>
												</div>
												<h3 class="rn-post-item-title">
													<a href="#">A standard blog post with image</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- End Blog Post Item (Small Size)-->

							</div>
						</div>

						<!-- Post Pagination-->
						<nav class="rn-pagination rn-pagination-center">
							<ul>
								<li>
									<a href="#">
										<i class="fas fa-angle-left"></i>
									</a>
								</li>
								<li>
									<a class="rn-active" href="#">1</a>
								</li>
								<li>
									<a href="#">2</a>
								</li>
								<li>
									<a href="#">3</a>
								</li>
								<li>
									<a href="#">4</a>
								</li>
								<li>
									<a href="#">
										<i class="fas fa-angle-right"></i>
									</a>
								</li>
							</ul>
						</nav>

					</div>
				</div>
			</div>
		</div>
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

		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>

</body>
</html>