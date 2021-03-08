<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 검색, 비교검색</title>


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
<jsp:include page="../common/header.jsp" />

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
		<!-- Car Search Form-->
		<div class="rn-search-form-big rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-big-search-form rn-big-search-form-dark">
							<form action="carSearch">
								<div class="row">

									<div class="col-lg-3 ">
										<div class="row">
											<div class="col-lg-7 col-md-8 col-8">
												
											</div>
											<div class="col-lg-5 col-md-4 col-4">
												
											</div>
										</div>
									</div>
									
									<div class="col-lg-3 col-sm-6">
										<div class="rn-icon-input">
											<i class="fas fa-map-marker-alt"></i>
											<input type="text" placeholder="검색할 차량을 입력해 주세요.">
										</div>
									</div>


									
									
									
									<div class="col-lg-3 col-sm-6">
										<div class="rn-icon-input">
											<i class="fas fa-map-marker-alt"></i>
											<input type="text" placeholder="비교할 차량을 입력해 주세요.">
										</div>
									</div>


									<div class="col-lg-3 ">
										<div class="row">
											<div class="col-lg-7 col-md-8 col-8">
												
											</div>
											<div class="col-lg-5 col-md-4 col-4">
												 
											</div>
										</div>
									</div>


								</div>
								<div class="text-center">
									<button class="btn btn-orange btn-lg mt-30 btn-shadow" type="submit">
										<i class="fas fa-search"> </i> Find Now
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="rn-shape rn-shape-bottom"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
			<path class="rn-shape-fill" d="M500.2,94.7L0,0v100h1000V0L500.2,94.7z"/>
</svg>
			</div>
		</div>
		<!-- End Car Search Form-->

		<!-- Car Results-->
		<div class="rn-section rn-car-search-results">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Car Search Filters-->
						<div class="rn-car-search-filters">
							<div class="rn-car-search-filter-item">
								<label>Car Brand</label>
								<select>
									<option value="Any">Any</option>
									<option value="Rover">Rover</option>
									<option value="Lexus">Lexus</option>
									<option value="BMW">BMW</option>
									<option value="Tesla">Tesla</option>
									<option value="Lamborghini">Lamborghini</option>
								</select>
							</div>
							
							
							<div class="rn-car-search-filter-item rn-csf-item-last">
								<label>Sort by</label>
								<select>
									<option value="Default">Default</option>
									<option value="Relavent">Relavent</option>
									<option value="Price: High to Low">Price: High to Low</option>
									<option value="Price: Low to High">Price: Low to High</option>
									<option value="Name: A to Z">Name: A to Z</option>
									<option value="Name: Z to A">Name: Z to A</option>
								</select>
							</div>
						</div>
						<!-- End Car Search Filters-->

						<!-- Car Search Item-->

					 <c:if test= "${!empty carList }">
						<c:forEach var="list" items ="${carList}" varStatus="vs"> 
				

							<div class="rn-car-search-item">
							
							<input class="inputBox" type="checkbox" name="car" value="${list.carNo }" />
							
								<div class="rn-car-search-item-thumb">
									<c:forEach items="${thList}" var="th">
											<c:if test="${th.carNo  == list.carNo}">
												<img style="height: 250px" src="${contextPath}${th.filePath}/${th.fileName}">
											</c:if>
										</c:forEach>
								</div>
								<div class="rn-car-search-item-info">
									<h2 class="rn-car-search-item-title">
										${list.carName }

									</h2>
									<p>제조사 : ${list.categoryName } | 모델명 : ${list.carModel }</p>

									<div class="rn-car-reviews">
											

									</div>
									<br>
									<div class="rn-car-meta">
										<span> <i class="rni-car-seat"></i> ${list.personnel} Passengers
										</span> <span> <i class="rni-petrol-station"></i> ${list.fuel }
										</span> <span> <i class="rni-car-gear"></i> Auto
										</span> <span> <i class="rni-car-door"></i> 4 Doors
										</span>
									</div>
								</div>
								<div class="rn-car-search-item-pricing">
									<div class="rn-car-total-price">
										<span>${list.minPrice }만원 ~ ${list.maxPrice }만원</span>
									</div>
									<br> <a class="btn btn-main btn-lg btn-shadow viewBtn" ><input type="hidden" name= "carNo" value="${list.carNo }"/>상세보기</a>
								</div>
							</div>
						</c:forEach>

					</c:if>


					 	<!-- Load More Cars-->
						<!-- <div class="text-center">
							<a class="btn btn-lg btn-outline-light mb-40" href="#">Load More</a>
						</div> -->
						
							<!-- Post Pagination-->
					<div class="my-4">
							<nav class="rn-pagination rn-pagination-center">
										<ul >
										
										<c:set var="firstPage" value="?cp=1"/>
										<c:set var="lastPage" value="?cp=${pInfo.maxPage}"/>
										
										
										<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 5 }"  integerOnly="true" />
										<fmt:parseNumber var="prev" value="${ c1 * 5 }"  integerOnly="true" />
										<c:set var="prevPage" value="?cp=${prev}" />
					
										<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 4) / 5 }" integerOnly="true" />
										<fmt:parseNumber var="next" value="${ c2 * 5 + 1 }" integerOnly="true" />
										<c:set var="nextPage" value="?cp=${next}" />
											
											
										<c:if test="${pInfo.currentPage > pInfo.pageSize}">
										<li class="page-item"> <!-- 첫 페이지로 이동(<<) -->
											<a class="page-link" href="${firstPage}">&lt;&lt;</a>
										</li>
										
										<li class="page-item"> <!-- 이전 페이지로 이동 (<) -->
											<a class="page-link" href="${prevPage}">&lt;</a>
										</li>
										</c:if>	
											
										
										<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
											<c:choose>
												<c:when test="${pInfo.currentPage == page }">
													<li class="page-item disabled">
														<a class="page-link">${page}</a>
													</li>
												</c:when>
											
												<c:otherwise>
													<li  class="page-item">	
														<a class="page-link" href="?cp=${page}">${page}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										
										<c:if test="${next <= pInfo.maxPage}">
											<li class="page-item"> <!-- 다음 페이지로 이동 (>) -->
												<a class="page-link" href="${nextPage}">&gt;</a>
											</li>
											
											<li class="page-item"> <!-- 마지막 페이지로 이동(>>) -->
												<a class="page-link" href="${lastPage}">&gt;&gt;</a>
											</li>
										</c:if>
									</ul>
							</nav>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Car Results-->

		
		<!-- End Site Footer-->
		
		<script >
		
			$(".viewBtn").on("click", function() {
				
				var carNo = $(this).children().val();
				
				console.log(carNo);
				
				var carViewURL = "${contextPath}/car/carView/" + carNo;
				
				location.href = carViewURL;
				
				
			});
			
			$(".inputBox").on("click" , function(){
				
			var carNo1;
			var carNo2;
			
			var checkArr = [];
			
		  var len = $("input:checkbox[name='car']:checked").length;
			
			
		  console.log(len)
			
		  if(len < 3){
			  $("input[name='car']:checked").each(function(e){
				  
				checkArr.push($(this).val());
				
				  for(var i=0; i < 2; i++){
					 	carNo1 = checkArr[0];
					 	carNo2 = checkArr[1];
				  } 
			  });
		  }
		  
		  console.log("carNo1 : " + carNo1);
		  console.log("carNo2 : " + carNo2);
		  
		  if(len == 2){
			  var searchCarURL = "carSearch/" + carNo1 +"/" + carNo2;
				location.href = searchCarURL;
		  }
			
		  
		
				
				
			});
			
		
		</script>

		<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->
		
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>
	

</body>
</html>