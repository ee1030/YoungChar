<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
	
<style>
/* @media (min-width: 1400px) {
  .container, .container-sm, .container-md, .container-lg, .container-xl, .container-xxl {
    max-width: 1320px; } } */
</style>



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
<!-- 헤더  -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- Page Title-->
		

		<div class="rn-page-title">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>Left Sidebar</h1>
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
					<div class="col-lg-8 order-lg-1 pb-15" style="margin: auto;">
						<div class="col-sm-12">
							<div class="card">
							  <div class="card-header">
								<div id="head">
									
								
								</div>
							 </div>
							  <div class="table-responsive">
								<table class="table table-hover">
								  <thead>
									<tr>
									  <th scope="col">No</th>
									  <th colspan="2" scope="col">제목</th>
									  <th scope="col">작성자</th>
									  <th scope="col">작성일</th>
									  <th scope="col">댓글</th>
									  <th scope="col">조회수</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <th scope="row">1</th>
									  <th colspan="2" scope="col">글제목입니다.</th>
									  <td>홍길동</td>
									  <td>21-02-20</td>
									  <td>1</td>
									  <td>1</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">6</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">7</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">8</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">9</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">10</th>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>홍길동</td>
										<td>21-02-20</td>
										<td>1</td>
										<td>1</td>
									</tr>
								  </tbody>
								</table>
							  </div>
							</div>
						  </div>
					</div>
					<div class="col-lg-4">

						<!-- Sidebar-->
						<aside class="rn-widget-area rn-left-sidebar" id="secondary">

							<div style="height: 100px;">
									<!-- 게시판 명 얻어오기 -->
									<h1>
									<%-- 	${bList[0].boardName } --%>
										<c:choose>
											<c:when test="${pInfo.boardType == 2 }">자유게시판	</c:when>
											<c:when test="${pInfo.boardType == 3 }">잡담게시판	</c:when>
										</c:choose>
											
										
									</h1>

							</div>

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
											<a href="#">Tesla</a>
										</li>
										<li>
											<a href="#">BYD</a>
										</li>
										<li>
											<a href="#">Rimac</a>
										</li>
										<li>
											<a href="#">르노 닛산</a>
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
							<!-- End Widget Item-->


							<!-- Widget Item-->
					
							<!-- End Widget Item-->


							<!-- Widget Item-->
							
							<!-- End Widget Item-->

						</aside>
						<!-- End Slidebar-->

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