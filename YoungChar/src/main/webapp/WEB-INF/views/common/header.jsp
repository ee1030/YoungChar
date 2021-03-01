<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
		<!-- Preloader CSS-->
		<style>
			#preloader:after,#preloader:before{content:"";display:block;left:-1px;top:-1px}#preloader-overlayer,#preloader:after,#preloader:before{position:absolute;height:100%;width:100%}#preloader-overlayer{position:fixed;top:0;left:0;background-color:#112E3B;z-index:999}#preloader{height:40px;width:40px;position:fixed;top:50%;left:50%;margin-top:-20px;margin-left:-20px;z-index:9999}#preloader:before{-webkit-animation:rotation 1s linear infinite;animation:rotation 1s linear infinite;border:2px solid #42DB0C;border-top:2px solid transparent;border-radius:100%}#preloader:after{border:1px solid rgba(255,255,255,.1);border-radius:100%}@media only screen and (min-width:768px){#preloader{height:60px;width:60px;margin-top:-30px;margin-left:-30px}#preloader:before{left:-2px;top:-2px;border-width:2px}}@media only screen and (min-width:1200px){#preloader{height:80px;width:80px;margin-top:-40px;margin-left:-40px}}@-webkit-keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}
		
			.mem > ul > li a{
				color : #00D231;
			}
			
			.mem > ul > li{
				list-style : none;
				display : inline-block;
				padding : 10px;
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
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
		
		
</head>
<body>

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
								<div class="mem">
										<ul>
										
										<c:choose>
											<c:when test="${empty sessionScope.loginMember }">
												<li>
													<a href="${contextPath}/member/login">로그인</a>
												</li>
												<li>
													<a href="${contextPath}/member/signUp">회원가입</a>
												</li>
											</c:when>
											
											<c:otherwise>
												<li class="nav-item">
				                	<a class="nav-link" href="${contextPath}/member/mypage">${loginMember.nickName}</a>
				                	
				                </li>
				                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/logout">Logout</a></li>
											</c:otherwise>
										</c:choose>
										
											<li>
												<a href="${contextPath}/admin/dashboard">관리자</a>
											</li>
											<li>
												<a href="${contextPath}/company/dashboard">업체</a>
											</li>
										</ul>
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
							<a class="brand-name" href="${contextPath}">
								<img class="img-fluid" src="${contextPath}/resources/assets/images/0char_logo(200).png" alt="Logo">
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
									<li class="active">
										<a href="${contextPath }">Home</a>
									</li>
									<li>
										<a href="${contextPath}/chargerLocation/location">충전소</a>
									</li>
									<li>
										<a href="${contextPath}/chargerCompany/introduction">충전기 설치 업체</a>
									</li>
									<li>
										<a href="service.html">Service</a>
									</li>
									<li>
										<a href="${contextPath}/news/newsMain">뉴스</a>
									</li>
									<li>
										<a href="${contextPath}/testDrive/main">시승예약
											<i class="lnr lnr-chevron-down"></i>
										</a>
										<ul>
											<li>
												<a href="${contextPath}/testDrive/main">메인</a>
											</li>
											<li>
												<a href="${contextPath}/testDrive/reservation">예약하기</a>
											</li>
											<li>
												<a href="${contextPath}/testDrive/myReservation">내 예약</a>
											</li>
											<li>
												<a href="${contextPath}/driveReview/reviewlist">시승후기</a>
											</li>
										</ul>
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

	<!-- 곻통 스크립트 경로 -->	
	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
	

		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>
</html>