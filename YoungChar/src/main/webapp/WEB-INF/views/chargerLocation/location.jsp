<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>충전소 위치</title>

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
							<h1>Fullwidth</h1>
							<p>Cras eros lorem, rhoncus ac risus sit amet, fringilla ultrices purus.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<!-- Page Content-->
		<div class="rn-section">
			<div class="container pb-15">
				<div class="row">
					<div class="col-lg-12">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultricies erat non augue pretium mollis. Nunc ut mauris volutpat, imperdiet nunc et, mattis erat. Sed id pretium est. Suspendisse magna diam, ultrices ac arcu ut, aliquam tincidunt est. In nisl nulla, dapibus id ante eget, interdum ultricies magna. Maecenas lectus urna, pulvinar consequat lobortis sed, sodales a libero. Pellentesque ac magna tellus. Phasellus nisl lorem, convallis vel cursus porttitor, ullamcorper nec dui.</p>
						<p>Aenean at nibh massa. Mauris magna sapien, sollicitudin eget finibus eu, aliquet at lectus. Cras cursus eget libero id blandit. Fusce quis ligula id tellus euismod posuere. Nunc nunc ex, ultrices ac pellentesque eu, ultricies nec justo. Aenean dolor neque, tristique in lectus at, ornare bibendum ligula. Curabitur scelerisque, ligula sit amet aliquet finibus, diam erat pharetra dolor, ac vulputate nunc ex vel ante. Etiam nec efficitur sem. Suspendisse nisl velit, rutrum nec magna at, cursus egestas nunc. Maecenas laoreet quam sit amet erat pretium, vel lobortis nunc fermentum. Cras ullamcorper mi nec vehicula sagittis. Mauris ut neque orci. Nunc non ornare neque, vel vestibulum libero.</p>
						<p>Duis gravida ante sed mi mattis hendrerit. Nullam efficitur ligula eget feugiat vehicula. Aliquam quis dui scelerisque, tempus velit posuere, sodales justo. Cras in faucibus ante. Suspendisse eget viverra nunc. Nam luctus risus diam, efficitur bibendum mauris feugiat a. Sed efficitur sit amet sapien quis porta. Cras nec nisl erat. Integer rutrum augue non pharetra placerat. Duis quis condimentum velit. Morbi placerat nec ipsum eget aliquam.</p>
						<p>Curabitur hendrerit gravida risus, consectetur sollicitudin mauris. Praesent fringilla consequat velit, at eleifend lectus tempor at. Donec auctor pretium tempus. Donec sit amet est nec nulla sagittis malesuada. Aenean ac felis urna. Aliquam ipsum ligula, rutrum id consectetur eu, dapibus sit amet quam. Donec varius malesuada turpis. Phasellus volutpat non dolor vel lacinia. Pellentesque ultrices ut libero vel pellentesque. Curabitur in quam porta, elementum lorem nec, euismod arcu. Mauris laoreet ipsum eros, id ornare nibh varius et. Duis bibendum a purus a euismod. Sed a pretium sem, nec sollicitudin urna.</p>
						<p>Nulla lacinia turpis non justo congue, eu tincidunt dolor pulvinar. Duis laoreet sed sem quis eleifend. Phasellus sed cursus tortor. Morbi rhoncus mi non vulputate imperdiet. Aenean sem mi, rhoncus vel rhoncus ut, sollicitudin convallis enim. Nunc malesuada pretium felis vel scelerisque. Sed vulputate, augue dictum venenatis sagittis, urna leo condimentum orci, id pellentesque ipsum tortor at dolor. Integer lobortis nulla ullamcorper commodo ullamcorper. Aliquam erat volutpat. Mauris vehicula nibh vel mauris efficitur, eu sollicitudin felis ornare. Sed nec laoreet est. Vivamus fringilla quam ex, id ultricies risus tincidunt et. In tincidunt felis tortor, et sodales magna accumsan et. Proin sit amet erat ut magna tempor posuere. Nunc eleifend dictum nisl, non condimentum purus pellentesque quis. Praesent pharetra volutpat leo, eget accumsan nisl porttitor eu.</p>
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