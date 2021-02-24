<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Drive Review</title>

	<!-- Preloader CSS-->
	<style>
		#preloader:after,
		#preloader:before {
			content: "";
			display: block;
			left: -1px;
			top: -1px
		}

		#preloader-overlayer,
		#preloader:after,
		#preloader:before {
			position: absolute;
			height: 100%;
			width: 100%
		}

		#preloader-overlayer {
			position: fixed;
			top: 0;
			left: 0;
			background-color: #112E3B;
			z-index: 999
		}

		#preloader {
			height: 40px;
			width: 40px;
			position: fixed;
			top: 50%;
			left: 50%;
			margin-top: -20px;
			margin-left: -20px;
			z-index: 9999
		}

		#preloader:before {
			-webkit-animation: rotation 1s linear infinite;
			animation: rotation 1s linear infinite;
			border: 2px solid #42DB0C;
			border-top: 2px solid transparent;
			border-radius: 100%
		}

		#preloader:after {
			border: 1px solid rgba(255, 255, 255, .1);
			border-radius: 100%
		}

		@media only screen and (min-width:768px) {
			#preloader {
				height: 60px;
				width: 60px;
				margin-top: -30px;
				margin-left: -30px
			}

			#preloader:before {
				left: -2px;
				top: -2px;
				border-width: 2px
			}
		}

		@media only screen and (min-width:1200px) {
			#preloader {
				height: 80px;
				width: 80px;
				margin-top: -40px;
				margin-left: -40px
			}
		}

		@-webkit-keyframes rotation {
			from {
				-webkit-transform: rotate(0);
				transform: rotate(0)
			}

			to {
				-webkit-transform: rotate(359deg);
				transform: rotate(359deg)
			}
		}

		@keyframes rotation {
			from {
				-webkit-transform: rotate(0);
				transform: rotate(0)
			}

			to {
				-webkit-transform: rotate(359deg);
				transform: rotate(359deg)
			}
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
		.rn-pagination {
			margin-bottom: 40px;
			text-align: center;
		}

		#head {
			display: inline-block;
			font-size: 21px;
			font-weight: bold;
		}

		#search-form{
			width: 400px;
			margin:0 auto;
		}

		#search-bar{
			width: 300px !important;
		}

	</style>
</head>

<body class="rn-preloader">
	<div id="preloader"></div>
	<div id="preloader-overlayer"></div>

	<!-- Header-->
	
	<!-- End Header-->


	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">

					<div class="card">
						<div class="card-header">
							<h2>R E V I E W</h2>
								<div id="search-form" class="theme-form">
									<div class="d-block">
										<label for="chk-ani1">
											<input class="checkbox_animated" id="chk-ani1" type="checkbox">Option 1
										</label>
										<label for="chk-ani2">
											<input class="checkbox_animated" id="chk-ani2" type="checkbox">Option 2
										</label>
										<label for="chk-ani3">
											<input class="checkbox_animated" id="chk-ani3" type="checkbox">Option 3
										</label>
										<label for="chk-ani4">
											<input class="checkbox_animated" id="chk-ani4" type="checkbox">Option 4
										</label>
									</div>
									<br>
									<div class="input-group m-0">
										<input id="search-bar" class="form-control-plaintext" type="search" placeholder="검색어를 입력해주세요.">
										<span class="btn btn-success input-group-text">Search</span>
									</div>
									</div>


						</div>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">별점</th>
										<th scope="col">브랜드</th>
										<th colspan="2" scope="col">제목</th>
										<th scope="col">글쓴이</th>
										<th scope="col">작성일시</th>
										<th scope="col">댓글</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>★★★★★</td>
										<td>테슬라</td>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>김영차</td>
										<td>21-02-02</td>
										<td>10</td>
										<td>20</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td>★★★★★</td>
										<td>테슬라</td>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>김영차</td>
										<td>21-02-02</td>
										<td>10</td>
										<td>20</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td>★★★★★</td>
										<td>테슬라</td>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>김영차</td>
										<td>21-02-02</td>
										<td>10</td>
										<td>20</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td>★★★★★</td>
										<td>테슬라</td>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>김영차</td>
										<td>21-02-02</td>
										<td>10</td>
										<td>20</td>
									</tr>
									<tr>
										<th scope="row">1</th>
										<td>★★★★★</td>
										<td>테슬라</td>
										<th colspan="2" scope="col">글제목입니다.</th>
										<td>김영차</td>
										<td>21-02-02</td>
										<td>10</td>
										<td>20</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>



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
		</div>
		<!-- End Page Content-->
	</section>
	
	<!-- Site Footer-->
	
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