<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />




	<!-- End Page Title-->


	<div class="container-fluid" >
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
				<div class="col-xl-6 xl-cs-65 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-slider owl-carousel owl-theme sync1" id="sync1">
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
							</div>
							<div class="owl-carousel owl-theme sync2" id="sync2">
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
				
				
				
						<div class="col-xl-6 xl-cs-65 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-slider owl-carousel owl-theme sync3" id="sync3">
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
								<div class="item">
									<img src="${contextPath}/resources/assets/images/tesla-roadster.jpg" alt="">
								</div>
							</div>
							<div class="owl-carousel owl-theme sync3" id="sync4">
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
				
			
				
			
				
				
				
				<div class="col-xl-6 xl-100 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-page-details">
								<h3>${carInfo.carName }</h3>
							</div>
							<div class="product-page-details">
								<h3>${carInfo.carModel }</h3>
							</div>
							<br>
							<div class="product-price f-28">
								<p>(최소) ${carInfo.minPrice }만원 ~  (최대) ${carInfo.maxPrice }만원
							</div>
					
							<br>
							<hr>
							<br>
							
							<br>
							<hr>
							<br>
							<div>
								<table class="product-page-width">
									<tbody>
										<tr>
											<td><b> Brand &nbsp;&nbsp;&nbsp;:</b></td>
											<td>${carInfo.categoryName }</td>
										</tr>
										<tr>
											<td><b>연료 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td> 
											<td class="txt-success">${carInfo.fuel }</td>
										</tr>
										<tr>
											<td><b>연비 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>CVY ${carInfo.consumpt }km/kWh</td>
										</tr>
										<tr>
											<td><b>에너지 용량 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.capacity } kWh</td>
										</tr>
										<tr>
											<td><b>모터 최대 출력 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.maxPower } Kw</td>
										</tr>
										<tr>
											<td><b>모터 최대 토크 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.maxTorque } Nm</td>
										</tr>
										<tr>
											<td><b>1회 충전 주행 가능 거리 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.mileage } Km</td>
										</tr>
									</tbody>
								</table>
							</div>
							<br>
							<hr>
							<br>
				
							<hr>
						
						</div>
					</div>
				</div>
				
				<div class="col-xl-6 xl-100 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-page-details">
								<h3>${carInfo.carName }</h3>
							</div>
							<div class="product-page-details">
								<h3>${carInfo.carModel }</h3>
							</div>
							<br>
							<div class="product-price f-28">
								<p>(최소) ${carInfo.minPrice }만원 ~  (최대) ${carInfo.maxPrice }만원
							</div>
					
							<br>
							<hr>
							<br>
							
							<br>
							<hr>
							<br>
							<div>
								<table class="product-page-width">
									<tbody>
										<tr>
											<td><b> Brand &nbsp;&nbsp;&nbsp;:</b></td>
											<td>${carInfo.categoryName }</td>
										</tr>
										<tr>
											<td><b>연료 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td> 
											<td class="txt-success">${carInfo.fuel }</td>
										</tr>
										<tr>
											<td><b>연비 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>CVY ${carInfo.consumpt }km/kWh</td>
										</tr>
										<tr>
											<td><b>에너지 용량 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.capacity } kWh</td>
										</tr>
										<tr>
											<td><b>모터 최대 출력 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.maxPower } Kw</td>
										</tr>
										<tr>
											<td><b>모터 최대 토크 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.maxTorque } Nm</td>
										</tr>
										<tr>
											<td><b>1회 충전 주행 가능 거리 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo.mileage } Km</td>
										</tr>
									</tbody>
								</table>
							</div>
							<br>
							<hr>
							<br>
				
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
    <script src="${contextPath}/resources/assets/js/ecommerce2.js"></script>
    <script src="${contextPath}/resources/assets/js/tooltip-init.js"></script>							

</body>
</html>