<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<div class="product-slider owl-carousel owl-theme" id="sync1">
							<c:forEach var="at" items="${attachmentList1}" varStatus="vs">
								<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}" />
								<div class="item">
									<img src="${src}" /> <input type="hidden" value="${at.fileNo}">
								</div>
							</c:forEach>
							</div>
							
							<div class="owl-carousel owl-theme" id="sync2">
							<c:forEach var="at" items="${attachmentList1}" varStatus="vs">
								<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}" />
								<div class="item">
									<img src="${src}" /> <input type="hidden" value="${at.fileNo}">
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
					
					
				</div>



				<div class="col-xl-6 xl-cs-65 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-slider owl-carousel owl-theme sync3" id="sync3">
							
								<c:forEach var="at2" items="${attachmentList2}" varStatus="vs">
									<c:set var="src2" value="${contextPath}${at2.filePath}/${at2.fileName}" />
									<div class="item">
										<img src="${src2}" /> <input type="hidden" value="${at2.fileNo}">
									</div>
								</c:forEach>
							</div>

							<div class="owl-carousel owl-theme sync3" id="sync4">
								<c:forEach var="at2" items="${attachmentList2}" varStatus="vs">
									<c:set var="src2" value="${contextPath}${at2.filePath}/${at2.fileName}" />
									<div class="item">
										<img src="${src2}" /> <input type="hidden" value="${at2.fileNo}">
									</div>
								</c:forEach>
							</div>
							
						</div>
					</div>


				</div>







				<div class="col-xl-6 xl-100 box-col-12">
					<div class="card">
						<div class="card-body">
							<div class="product-page-details">
								<h3>${carInfo1.carName }</h3>
							</div>
							<div class="product-page-details">
								<h3>${carInfo1.carModel }</h3>
							</div>
							<br>
							<div class="product-price f-28">
								<p>(최소) ${carInfo1.minPrice }만원 ~  (최대) ${carInfo1.maxPrice }만원
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
											<td>${carInfo1.categoryName }</td>
										</tr>
										<tr>
											<td><b>연료 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td> 
											<td class="txt-success">${carInfo1.fuel }</td>
										</tr>
										<tr>
											<td><b>연비 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>CVY ${carInfo1.consumpt }km/kWh</td>
										</tr>
										<tr>
											<td><b>에너지 용량 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo1.capacity } kWh</td>
										</tr>
										<tr>
											<td><b>모터 최대 출력 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo1.maxPower } Kw</td>
										</tr>
										<tr>
											<td><b>모터 최대 토크 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo1.maxTorque } Nm</td>
										</tr>
										<tr>
											<td><b>1회 충전 주행 가능 거리 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo1.mileage } Km</td>
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
								<h3>${carInfo2.carName }</h3>
							</div>
							<div class="product-page-details">
								<h3>${carInfo2.carModel }</h3>
							</div>
							<br>
							<div class="product-price f-28">
								<p>(최소) ${carInfo2.minPrice }만원 ~  (최대) ${carInfo2.maxPrice }만원
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
											<td>${carInfo2.categoryName }</td>
										</tr>
										<tr>
											<td><b>연료 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td> 
											<td class="txt-success">${carInfo2.fuel }</td>
										</tr>
										<tr>
											<td><b>연비 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>CVY ${carInfo2.consumpt }km/kWh</td>
										</tr>
										<tr>
											<td><b>에너지 용량 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo2.capacity } kWh</td>
										</tr>
										<tr>
											<td><b>모터 최대 출력 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo2.maxPower } Kw</td>
										</tr>
										<tr>
											<td><b>모터 최대 토크 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo2.maxTorque } Nm</td>
										</tr>
										<tr>
											<td><b>1회 충전 주행 가능 거리 &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</b></td>
											<td>${carInfo2.mileage } Km</td>
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
				
					<div class="float-right" style="margin-bottom:50px;">
					 <a class="btn btn-success returnUrl" style="color: ghostwhite;">목록으로</a>
					</div>
			
			</div>
		</div>
		
		
		
		<jsp:include page="../common/footer.jsp"/> 
		
	</div>
							
							
	<script type="text/javascript">
	// 목록으로
	$(".returnUrl").on('click', function() {

		
		var returnURL = "../../list";

		location.href = returnURL;
	});
	
	</script>
							
							
							
							
							
							
							
							
							
							
							
							
							
							
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
    <%--<script src="${contextPath}/resources/assets/js/theme-customizer/customizer.js"></script> --%>
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