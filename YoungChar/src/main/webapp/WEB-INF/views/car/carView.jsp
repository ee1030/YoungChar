<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- 	<!-- Google font-->
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
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/responsive.css"> --%>
	

			
<body>
 	<jsp:include page="../common/header.jsp" /> 

	<div class="container-fluid">
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
		<div>
			<div class="row product-page-main">
				<div class="col-xl-4 xl-cs-65 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-slider owl-carousel owl-theme" id="sync1">
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/02.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/03.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/04.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/05.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/06.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/07.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/08.jpg" alt="">
								</div>
							</div>
							<div class="owl-carousel owl-theme" id="sync2">
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/01.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/02.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/03.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/04.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/05.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/06.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/07.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/ecommerce/08.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-7 xl-100 box-col-7">
					<div class="card">
						<div class="card-body">
							<div class="product-page-details">
								<h3>로드스터(Roadster)</h3>
							</div>
							<div class="product-page-details">
								<h3>A-1085</h3>
							</div>
							<br>
							<div class="product-price f-28">
								<p>(최소) 5900만원 ~  (최대) 6300만원
							</div>
					
							<br>
							<hr>
							<br>
							<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that.</p>
							<br>
							<hr>
							<br>
							<div>
								<table class="product-page-width">
									<tbody>
										<tr>
											<td><b> Brand &nbsp;&nbsp;&nbsp;:</b></td>
											<td>테슬라</td>
										</tr>
										<tr>
											<td><b>연료 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td> 
											<td class="txt-success">Electric</td>
										</tr>
										<tr>
											<td><b>연비 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>CVY 4.4km/kWh</td>
										</tr>
										<tr>
											<td><b>에너지 용량 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>50.0 kWh</td>
										</tr>
										<tr>
											<td><b>모터 최대 출력 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>175.0 Kw</td>
										</tr>
										<tr>
											<td><b>모터 최대 토크 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>375.0 Nm</td>
										</tr>
										<tr>
											<td><b>1회 충전 주행 가능 거리 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>388 Km</td>
										</tr>
									</tbody>
								</table>
							</div>
							
						
							<br>
							<hr>
							<br>
							<div class="row">
								<div class="col-md-6">
									<h6 class="product-title">Rate Now</h6>
								</div>
								<div class="col-md-6">
									<div class="d-flex">
										<select id="u-rating-fontawesome" name="rating" autocomplete="off">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select><span>(250 review)</span>
									</div>
								</div>
							</div>
							<hr>
							<div class="m-t-15">
								<button class="btn btn-primary m-r-10" type="button" title="">
									<i class="fa fa-shopping-basket me-1"></i>Add To Cart
								</button>
								<button class="btn btn-success m-r-10" type="button" title="">
									<i class="fa fa-shopping-cart me-1"></i>Buy Now
								</button>
								<a class="btn btn-secondary" href="#"> <i class="fa fa-heart me-1"></i>Add To WishList
								</a>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp"/> 
		
	</div>
	
	

	    <!-- latest jquery-->
    <script src="${contextPath}/resources/assets/js/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap js-->
    <script src="${contextPath}/resources/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
    <!-- feather icon js-->
    <script src="${contextPath}/resources/assets/js/icons/feather-icon/feather.min.js"></script>
    <script src="${contextPath}/resources/assets/js/icons/feather-icon/feather-icon.js"></script>
    
    <!-- Sidebar jquery-->
    <script src="${contextPath}/resources/assets/js/config.js"></script>
    <!-- Theme js-->
    <script src="${contextPath}/resources/assets/js/script.js"></script>
    <script src="${contextPath}/resources/assets/js/theme-customizer/customizer.js"></script>
    <!-- login js-->
    
    <!-- 없읍 -->
    
    <!-- scrollbar js-->
    <script src="${contextPath}/resources/assets/js/scrollbar/simplebar.js"></script>
    <script src="${contextPath}/resources/assets/js/scrollbar/custom.js"></script>
    <!-- Plugins JS start-->
    <script src="${contextPath}/resources/assets/js/sidebar-menu.js"></script>
    <script src="${contextPath}/resources/assets/js/rating/jquery.barrating.js"></script>
    <script src="${contextPath}/resources/assets/js/rating/rating-script.js"></script>
    
    <script src="${contextPath}/resources/assets/js/owlcarousel/owl.carousel.js"></script> 
    <script src="${contextPath}/resources/assets/js/ecommerce.js"></script>
    <script src="${contextPath}/resources/assets/js/tooltip-init.js"></script>
    <!-- Plugins JS Ends-->
  
    <!-- Plugin used-->

</body>
</html>