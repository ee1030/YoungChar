<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>뉴스 상세페이지</title>


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
	<body>

		<!-- Header-->
	<jsp:include page="../common/header.jsp"></jsp:include>

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
					<div class="col-lg-8 rn-post-list">

						<!-- Blog Post Item -->
						<article class="rn-post-item rn-post-size-lg">
							<div class="rn-post-item-thumb">
								<a href="#">
									<img class="img-fluid" src="assets/images/post-item-1.jpg" alt="A standard blog post with image"/>
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
							<div class="rn-post-item-body">
								<p>Aliquam erat volutpat. Morbi eget velit ut lectus efficitur vulputate dictum vel ex. Etiam bibendum libero eget lorem malesuada, id mattis est egestas. Mauris eu quam bibendum, placerat odio non, ultrices leo. Proin laoreet purus nisl, non elementum tortor accumsan vitae. Proin commodo vulputate purus, eu dignissim ipsum lobortis ut. Sed ac nisi velit. Integer magna mi, faucibus a sapien eget, volutpat euismod dolor.</p>
							</div>
							<div class="rn-post-item-footer">
								<div class="rn-post-read-more">
									<a class="btn btn-dark" href="#">Read more</a>
								</div>
								<ul class="rn-post-love-n-view">
									<li>
										<button>
											<i class="fas fa-heart"></i>
										</button>
										<span>1k</span>
									</li>
									<li>
										<span class="rn-post-view-icon">
											<i class="far fa-eye"></i>
										</span>
										<span>50k</span>
									</li>
								</ul>
							</div>
						</article>
						<!-- End Blog Post Item -->


						<!-- Blog Post Item -->
						<article class="rn-post-item rn-post-size-lg">
							<div class="rn-post-item-thumb">
								<a href="#">
									<img class="img-fluid" src="assets/images/post-item-2.jpg" alt="A standard blog post with image"/>
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
							<div class="rn-post-item-body">
								<p>Aliquam erat volutpat. Morbi eget velit ut lectus efficitur vulputate dictum vel ex. Etiam bibendum libero eget lorem malesuada, id mattis est egestas. Mauris eu quam bibendum, placerat odio non, ultrices leo. Proin laoreet purus nisl, non elementum tortor accumsan vitae. Proin commodo vulputate purus, eu dignissim ipsum lobortis ut. Sed ac nisi velit. Integer magna mi, faucibus a sapien eget, volutpat euismod dolor.</p>
							</div>
							<div class="rn-post-item-footer">
								<div class="rn-post-read-more">
									<a class="btn btn-dark" href="#">Read more</a>
								</div>
								<ul class="rn-post-love-n-view">
									<li>
										<button>
											<i class="fas fa-heart"></i>
										</button>
										<span>1k</span>
									</li>
									<li>
										<span class="rn-post-view-icon">
											<i class="far fa-eye"></i>
										</span>
										<span>50k</span>
									</li>
								</ul>
							</div>
						</article>
						<!-- End Blog Post Item -->


						<!-- Blog Post Item -->
						<article class="rn-post-item rn-post-size-lg">
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
											<a href="#">A standard blog post without image</a>
										</h3>
									</div>
								</div>
							</div>
							<div class="rn-post-item-body">
								<p>Aliquam erat volutpat. Morbi eget velit ut lectus efficitur vulputate dictum vel ex. Etiam bibendum libero eget lorem malesuada, id mattis est egestas. Mauris eu quam bibendum, placerat odio non, ultrices leo. Proin laoreet purus nisl, non elementum tortor accumsan vitae. Proin commodo vulputate purus, eu dignissim ipsum lobortis ut. Sed ac nisi velit. Integer magna mi, faucibus a sapien eget, volutpat euismod dolor.</p>
							</div>
							<div class="rn-post-item-footer">
								<div class="rn-post-read-more">
									<a class="btn btn-dark" href="#">Read more</a>
								</div>
								<ul class="rn-post-love-n-view">
									<li>
										<button>
											<i class="fas fa-heart"></i>
										</button>
										<span>1k</span>
									</li>
									<li>
										<span class="rn-post-view-icon">
											<i class="far fa-eye"></i>
										</span>
										<span>50k</span>
									</li>
								</ul>
							</div>
						</article>
						<!-- End Blog Post Item -->

						<!-- Post Pagination-->
						<nav class="rn-pagination">
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
					<div class="col-lg-4">

						<!-- Sidebar-->
						<aside class="rn-widget-area" id="secondary">

							<!-- Widget Item-->
							<div class="rn-widget">
								<div class="rn-widget-content">
									<a href="#">
										<img class="img-fluid" src="assets/images/banner.png" alt="banner" srcset="assets/images/banner.png 1x, assets/images/banner@2x.png 2x">
									</a>
								</div>
							</div>
							<!-- End Widget Item-->


							<!-- Widget Item-->
							<section class="rn-widget">
								<h2 class="rn-widget-title">Categories</h2>
								<div class="rn-widget-content">
									<ul>
										<li>
											<a href="#">Lifestyle</a>
										</li>
										<li>
											<a href="#">Travel</a>
										</li>
										<li>
											<a href="#">Fashion</a>
										</li>
										<li>
											<a href="#">Music</a>
										</li>
										<li>
											<a href="#">Branding</a>
										</li>
									</ul>
								</div>
							</section>
							<!-- End Widget Item-->


							<!-- Widget Item-->
							<section class="rn-widget">
								<h2 class="rn-widget-title">Recent Posts</h2>
								<div class="rn-widget-content">
									<ul class="rn-recent-posts">
										<li>

											<!-- Extra Small Post-->
											<div class="rn-recent-post-item">
												<div class="rn-recent-post-item-thumb">
													<a href="#">
														<img class="img-fluid" src="assets/images/blog-item-xs-1.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-xs-1.jpg 1x, assets/images/blog-item-xs-1@2x.jpg 2x"/>
													</a>
												</div>
												<div class="rn-recent-post-item-info">
													<div class="rn-recent-post-item-meta">
														<span class="rn-recent-post-item-categories">In 
															<a href="#">News</a>
														</span>
														<span class="rn-recent-post-item-author">At 
															<a href="#">15 May, 2018</a>
														</span>
													</div>
													<div class="rn-recent-post-item-title">
														<h3>
															<a href="#">A standard blog post with image</a>
														</h3>
													</div>
												</div>
											</div>
											<!-- End Extra Small Post-->

										</li>
										<li>

											<!-- Extra Small Post-->
											<div class="rn-recent-post-item">
												<div class="rn-recent-post-item-thumb">
													<a href="#">
														<img class="img-fluid" src="assets/images/blog-item-xs-2.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-xs-2.jpg 1x, assets/images/blog-item-xs-2@2x.jpg 2x"/>
													</a>
												</div>
												<div class="rn-recent-post-item-info">
													<div class="rn-recent-post-item-meta">
														<span class="rn-recent-post-item-categories">In 
															<a href="#">News</a>
														</span>
														<span class="rn-recent-post-item-author">At 
															<a href="#">15 May, 2018</a>
														</span>
													</div>
													<div class="rn-recent-post-item-title">
														<h3>
															<a href="#">A standard blog post with image</a>
														</h3>
													</div>
												</div>
											</div>
											<!-- End Extra Small Post-->

										</li>
										<li>

											<!-- Extra Small Post-->
											<div class="rn-recent-post-item">
												<div class="rn-recent-post-item-thumb">
													<a href="#">
														<img class="img-fluid" src="assets/images/blog-item-xs-3.jpg" alt="A standard blog post with image" srcset="assets/images/blog-item-xs-3.jpg 1x, assets/images/blog-item-xs-3@2x.jpg 2x"/>
													</a>
												</div>
												<div class="rn-recent-post-item-info">
													<div class="rn-recent-post-item-meta">
														<span class="rn-recent-post-item-categories">In 
															<a href="#">News</a>
														</span>
														<span class="rn-recent-post-item-author">At 
															<a href="#">15 May, 2018</a>
														</span>
													</div>
													<div class="rn-recent-post-item-title">
														<h3>
															<a href="#">A standard blog post with image</a>
														</h3>
													</div>
												</div>
											</div>
											<!-- End Extra Small Post-->

										</li>
									</ul>
								</div>
							</section>
							<!-- End Widget Item-->


							<!-- Widget Item-->
							<section class="rn-widget">
								<h2 class="rn-widget-title">Tags</h2>
								<div class="rn-widget-content">
									<div class="tags">
										<a href="#">video</a>
										<a href="#">audio</a>
										<a href="#">images</a>
										<a href="#">javascript</a>
										<a href="#">php</a>
										<a href="#">wordpress</a>
										<a href="#">travel</a>
										<a href="#">music</a>
										<a href="#">python</a>
										<a href="#">ui/ux</a>
										<a href="#">cars</a>
									</div>
								</div>
							</section>
							<!-- End Widget Item-->

						</aside>
						<!-- End Sidebar-->

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