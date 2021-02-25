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

<title>Dash board</title>

<!-- Preloader CSS-->
		<style>
			.card{
			font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: rgba(17, 46, 59, 0.7);
			}

			
			.rn-service-item {
				width: 200px;
				display: inline-block;
				margin: 25px;
			}
			
			.card {
				background-color: #79cb4d1f !important;
				width: 850px;
			}
			
			.rn-widget {
				margin-bottom: 40px;
				font-size: 20px;
				line-height: 60px;
			}

</style>




</head>
<body class="rn-preloader">

	<!-- Header-->
	<jsp:include page="../common/header.jsp"/>
	<!-- End Header-->


	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<jsp:include page="sideMenu.jsp"/>
				</div>
				<div class="col-lg-10 order-lg-1 pb-15">

					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title">
							<h2 class="rn-title">관리자 메뉴</h2>
							<span class="rn-title-bg">관리자 메뉴</span>
						</div>

					</div>
					             


					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-calendar-full"></i>
						</div>
						<div class="rn-service-desc">
							<p>당일 예약</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-user"></i>
						</div>
						<div class="rn-service-desc">
							<p>승인 대기</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-car"></i>
						</div>
						<div class="rn-service-desc">
							<p>시승 후기</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					
					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-car"></i>
						</div>
						<div class="rn-service-desc">
							<p>시승 후기</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					<!-- End Service Item-->
				
				</div>
				
				
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