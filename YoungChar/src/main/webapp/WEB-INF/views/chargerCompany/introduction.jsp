<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>충전기 설치 업체</title>

<!-- Preloader CSS-->
<style>
#preloader:after, #preloader:before {
	content: "";
	display: block;
	left: -1px;
	top: -1px
}

#preloader-overlayer, #preloader:after, #preloader:before {
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

@
-webkit-keyframes rotation {
	from {-webkit-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(359deg);
	transform: rotate(359deg)
}

}
@
keyframes rotation {
	from {-webkit-transform: rotate(0);
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

<!-- Google Map JS-->
<script src="https://maps.googleapis.com/maps/api/js?key=[YOUR_API_KEY]"></script>
</head>
<body>

	<!-- Header-->
	<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>

	<!-- Page Title-->
	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1>All Cars</h1>
						<p>Cras eros lorem, rhoncus ac risus sit amet, fringilla ultrices purus.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Title-->

	<!-- Cars-->
	<section class="rn-section rn-car-list">
		<div class="container">
			<div class="row">

				<c:if test="${!empty cList }">
					<c:forEach var="chargerCompany" items="${cList}" varStatus="vs">
						<div class="col-lg-4 col-md-6">

							<!-- Item-->
							<div class="rn-car-item">
								<div class="rn-car-item-thumb">
									<a href="car-single.html">
									<c:forEach items="${thList}" var="th">
										<c:if test="${th.companyNo  == chargerCompany.companyNo}">
											<img src="${contextPath}${th.filePath}/${th.fileName}">
										</c:if>
									</c:forEach>
									</a>
								</div>
								<div class="rn-car-item-info">
									<h3>
										<a href="car-single.html">${chargerCompany.companyName}</a>
									</h3>
									<p>업체 간단한 소개 글 등등..</p>
									<div class="rn-car-list-n-price">
										<ul>
											<li>항목1</li>
											<li>항목2</li>
											<li>항목3</li>
										</ul>
										<div class="rn-car-price-wrap">
											<a class="rn-car-price" href="../chargerCompany/${chargerCompany.companyNo}"><span class="rn-car-price-from">Go</span> </a>
										</div>
									</div>
								</div>
							</div>
							<!-- End Item-->

						</div>
					</c:forEach>
				</c:if>




				<%-- 로그인이 되어있는 경우 --%>
				<c:if test="${!empty loginMember}">
					<a class="btn btn-success float-right" href="../chargerCompany/insertChargerCompany">등록하기</a>
				</c:if>



				<!-- 
				<div class="col-lg-4 col-md-6">
				</div>
				
				<div class="col-lg-4 col-md-6">
				</div>
				
				
				<div class="col-lg-12 d-none d-lg-block">
					<a href="#"> <img class="img-fluid mb-50" src="assets/images/big-banner.png" alt="banner" srcset="assets/images/big-banner.png 1x, assets/images/big-banner@2x.png 2x">
					</a>
				</div>
				
				
				<div class="col-lg-4 col-md-6">
				</div>
				
				<div class="col-lg-4 col-md-6">
				</div>
				
				<div class="col-lg-4 col-md-6">
				</div>
				
				
				<div class="col-lg-12 d-none d-lg-block">
					<a href="#"> <img class="img-fluid mb-50" src="assets/images/big-banner.png" alt="banner" srcset="assets/images/big-banner.png 1x, assets/images/big-banner@2x.png 2x">
					</a>
				</div>
				
				
				<div class="col-lg-4 col-md-6">
				</div>
				
				<div class="col-lg-4 col-md-6">
				</div>
				
				<div class="col-lg-4 col-md-6">	
				</div>
				
			-->
			</div>
			
		<!-- Post Pagination-->
			<div class="my-4">
				<nav class="rn-pagination rn-pagination-center">
					<ul>

						<%-- 주소 조합 작업 --%>

						<!-- 화살표에 들어갈 주소를 변수로 생성 -->
						<c:set var="firstPage" value="${pageUrl}cp=1" />
						<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />



						<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"
							integerOnly="true" />
						<fmt:parseNumber var="prev" value="${ c1 * 10 }"
							integerOnly="true" />
						<c:set var="prevPage" value="${pageUrl}cp=${prev}" />


						<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) /10 }"
							integerOnly="true" />
						<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }"
							integerOnly="true" />
						<c:set var="nextPage" value="${pageUrl}cp=${next}" />



						<c:if test="${pInfo.currentPage > pInfo.pageSize}">
							<li>
								<!-- 첫 페이지로 이동(<<) --> <a href="${firstPage}"><i
									class="fas fa-angle-right">..</i></a>
							</li>

							<li>
								<!-- 이전 페이지로 이동 (<) --> <a href="${prevPage}"> <i
									class="fas fa-angle-left"></i></a>
							</li>
						</c:if>

						<!-- 페이지 목록 -->
						<c:forEach var="page" begin="${pInfo.startPage}"
							end="${pInfo.endPage}">
							<c:choose>
								<c:when test="${pInfo.currentPage == page }">
									<li><a class="page-link">${page}</a></li>
								</c:when>

								<c:otherwise>
									<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
						<c:if test="${next <= pInfo.maxPage}">
							<li>
								<!-- 다음 페이지로 이동 (>) --> <a href="${nextPage}"><i
									class="fas fa-angle-right"></i></a>
							</li>

							<li>
								<!-- 마지막 페이지로 이동(>>) --> <a href="${lastPage}"><i
									class="fas fa-angle-right"></i></a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>



		</div>
	</section>
	<!-- End Cars-->

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
								<a class="brand-name" href="index.html"> <img src="assets/images/logo.svg" alt="Logo">
								</a>
								<p>Sed sit amet ligula ac nulla finibus euismod nec nec diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent semper, risus eget ornare maximus, ipsum ante semper.</p>
								<ul class="rn-widget-social">
									<li><a href="#"> <i class="fab fa-facebook-f"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-twitter"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-instagram"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-linkedin-in"></i>
									</a></li>
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
											<li><a href="#">About Us</a></li>
											<li><a href="#">Contact Us</a></li>
											<li><a href="#">Support</a></li>
											<li><a href="#">View Booking</a></li>
											<li><a href="#">Affiliate Programme</a></li>
											<li><a href="#">Marketplace</a></li>
										</ul>
									</div>
									<div class="col-6">
										<ul>
											<li><a href="#">Site Map</a></li>
											<li><a href="#">Careers</a></li>
											<li><a href="#">Press</a></li>
											<li><a href="#">Get a Receipt</a></li>
											<li><a href="#">Community</a></li>
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
						<span class="rn-pyament-methods"> <span>We Accept</span> <img src="assets/images/payments.png" alt="payments" srcset="assets/images/payments.png 1x, assets/images/payments@2x.png 2x">
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