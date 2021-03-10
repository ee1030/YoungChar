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

<style type="text/css">

.select-sk{
	
	display:none;

}

</style>



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
						<div >
								<!-- /spring/board/list/1or2 -> search/2 -->
								<form action="search" class="text-center" id="searchForm" >
									<span> <br> 
									
									<label for="exercise">테슬라</label> 
									<input type="checkbox" name="ct" value="테슬라" id="tesla"> &nbsp; 
									
									<label for="movie">현대자동차</label>
									<input type="checkbox" name="ct" value="현대자동차" id="hyundai"> &nbsp; 
									
									<label for="music">기아</label> 
									 <input type="checkbox" name="ct" value="기아" id="kia"> &nbsp; 
									 
									 <label for="cooking">벤츠</label>
									  <input type="checkbox" name="ct" value="벤츠" id="benz"> &nbsp; 
									  
									  <label for="game">BMW</label>
									   <input type="checkbox" name="ct" value="BMW" id="bmw"> &nbsp; 
									   
									  <label for="game">아우디</label>
									   <input type="checkbox" name="ct" value="아우디" id="audi"> &nbsp; 
									   
									  <label for="game">포르쉐</label>
									   <input type="checkbox" name="ct" value="포르쉐" id="porsche"> &nbsp;
									    
									  <label for="game">르노</label>
									   <input type="checkbox" name="ct" value="르노" id="renault"> &nbsp; 
									   
									   
									   
									</span> 
									<br> 
									<!-- <select  name="sk" class="form-control select-sk" style="width: 100px; display: inline-block; margin-bottom: 10px;">
										<option value="tit">글제목</option>
										<option value="con">내용</option>
										<option value="titcont">제목+내용</option>
									</select> <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;"> -->
									<!-- <button class="form-control btn btn-success" id="searchBtn" type="submit" style="width: 100px; display: inline-block;">검색</button> -->
								<div class="text-center">
									<button class="btn btn-orange btn-lg mt-30 btn-shadow" type="submit" id="searchBtn">
										<i class="fas fa-search"> </i> Find Now
									</button>
								</div>
								</form>
							</div>
							
							
							
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
												<img style="height: 250px; width: 210px;" src="${contextPath}${th.filePath}/${th.fileName}">
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
										<ul>
											
												<%-- 주소 조합 작업 --%>
										<c:choose>
											<%-- 검색이 된 경우 --%>
											<c:when test="${!empty search }">
												<%--선택된 카테고리를 하나의 쿼리스트링으로 조합 --%>

												<c:forEach items="${search.ct}" var="c">
													<c:set var="category" value="${category}ct=${c}&" />
												</c:forEach>

												<c:set var="searchStr" value="${category}" />

												<%-- 검색된 내용이 있다면 --%>
											 	<c:if test="${!empty search.sv}">
													<c:set var="searchStr" value="${category}sk=${search.sk}&sv=${search.sv}" />
												</c:if> 

												<c:url var="pageUrl" value="../search?${searchStr}&" />
												<c:set var="returnListURL" value="${contextPath}/car/search/${pageUrl}cp=${pInfo.currentPage }" scope="session" />
											</c:when>

											<%-- 안된 경우 --%>
											<c:otherwise>
												<c:url var="pageUrl" value="${pInfo.boardType}?" />
												<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
												<c:set var="returnListURL" value="${contextPath}/car/list/${pageUrl}cp=${pInfo.currentPage }" scope="session" />
											</c:otherwise>

										</c:choose>
										
										
										
										
										
										
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
			
			
			// ------- 검색 파라미터 유지 ----------
			$(function(){
				// 카테고리 
				<c:forEach items="${search.ct}" var="ctName">
					$("input[name=ct]").each(function(index, item){
						if($(item).val() == "${ctName}"){
							$(item).prop("checked",true);
						}
					});	
				
				</c:forEach>
				
				/* // 검색 조건(sk)
				$("select[name=sk] > option").each(function(index,item){
					if($(item).val() == "${search.sk}"){
						$(item).prop("selected",true);
					}
				}); 
				
				// 검색 값(sv)
				$("input[name=sv]").val("${search.sv}"); */
				
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