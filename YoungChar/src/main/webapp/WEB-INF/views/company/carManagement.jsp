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

<title>car management</title>

<!-- Preloader CSS-->
		<style>
			.card{
			font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: rgb(85, 85, 85);
			}

			
			.rn-service-item {
				width: 230px;
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
			
			#titleName{
				margin-top: 30px;
				margin-bottom: 30px;
			}
			
			#searchBtn{
				background-color: #00D231;
			}

			#carList{
				margin-bottom : 15px;
			}
			#carListBtn{
				background-color: #00D231
			}
			
			.rn-car-item-review{
				display:none;
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
			<div id="side-bar">
						<!-- Sidebar-->
						<jsp:include page="sideMenu.jsp"/>
						<!-- End Slidebar-->

					</div>
				<div class="col-lg-8 order-lg-1 pb-15">

					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">car management</h2>
							<p>시승 가능 자동차 등록 / 수정 /삭제</p>
							<span class="rn-title-bg">car management</span>
						</div>

					</div>
					
				
		<!-- End Page Content-->
	<br>
	<div class="container">
			<div class="row">
				<div  class="col-lg-12">
				  <h3 id="titleName">시승 가능 차량 추가</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<input type="text" placeholder="모델명을 입력하세요." id="carSearch">
				</div>
				<div class="col">
					<button id="searchBtn" class="btn-main btn btn-shadow">검색</button>
				</div>
			</div>
		</div>
		
		<br>
		<div class="container">
			<div class="row">
				<div  class="col-lg-12">
					<hr>
				</div>
			</div>
		</div>

		<!-- Cars-->
		<section class="rn-section rn-car-list">
			<div class="container">
				<div class="row">
				
				
						<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
					<!-- Car Item-->
						<div class="col-lg-3 col-md-2">
						<div class="rn-car-item">
							<span class="rn-car-item-review">
								x
							</span>
							<div class="rn-car-item-thumb">
								<a href="car-single.html">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
								</a>
							</div>
							<div class="rn-car-item-info">
								<h3>
									<a href="car-single.html">Toyota Etios</a>
								</h3>
							</div>
						</div>
					</div>
						<!-- End Car Item-->
						
						
							
				</div>
				<!-- end row -->
			</div>
			
			<div class="row justify-content-md-center" id="carList">
		    <div class="col-lg-4">
					<input type="text" placeholder="모델명을 입력하세요." id="carListSearch">
				</div>
		    <div class="col-lg-1">
					<button id="carListBtn" class="btn-main btn btn-shadow">검색</button>
				</div>
 		 </div>
			</section>
			
 		 
						<div class="row">
						
							<div class="col-lg-12">

								<!-- Cars Pagination-->
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
								<!-- End Cars Pagination-->

					
							</div>
						</div>
			</div>

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
	<script>
		$(".rn-car-item").on("mouseover", function(){
			$(this).children().css("display", "inline-block");
		});
		
		$(".rn-car-item").on("mouseout", function(){
			$(this).children("span").css("display", "none");
		});
	</script>

</body>
</html>