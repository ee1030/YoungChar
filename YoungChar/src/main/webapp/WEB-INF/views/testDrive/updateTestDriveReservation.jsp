<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Fullwidth | RentNow - Responsive Car Rental Template</title>
		<style>
		
		 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative; margin:5px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	
			.select1{
				width: 100%;
				height: 100px;
				background-color: #42DB0C;
				text-align : center;
				line-height: 100px;
				font-size: 25px;
			}
			
			.carSelect{
				border : 2px solid #a1f583 !important;
				box-shadow: 0 0 8px #64ec32 !important; 
			}
			
			#tableheight{
				max-height: 600px;
				overflow-y:auto;

			}

			#searchNo{
				text-align: center;
			}
			
			.brandName{
				margin-bottom : 7px !important;
				color : #49B53F !important;
				font-size: 1.2em !important;
			}
			
			.modelName{
				margin-bottom : 7px !important;
				color : #B4B4B4 !important;
			}
			
			.cursorP{
				cursor : pointer;
			}

			table h5{
				color : #888;
			}

		</style>
		<!-- Preloader CSS-->
		<style>#preloader:after,#preloader:before{content:"";display:block;left:-1px;top:-1px}#preloader-overlayer,#preloader:after,#preloader:before{position:absolute;height:100%;width:100%}#preloader-overlayer{position:fixed;top:0;left:0;background-color:#112E3B;z-index:999}#preloader{height:40px;width:40px;position:fixed;top:50%;left:50%;margin-top:-20px;margin-left:-20px;z-index:9999}#preloader:before{-webkit-animation:rotation 1s linear infinite;animation:rotation 1s linear infinite;border:2px solid #42DB0C;border-top:2px solid transparent;border-radius:100%}#preloader:after{border:1px solid rgba(255,255,255,.1);border-radius:100%}@media only screen and (min-width:768px){#preloader{height:60px;width:60px;margin-top:-30px;margin-left:-30px}#preloader:before{left:-2px;top:-2px;border-width:2px}}@media only screen and (min-width:1200px){#preloader{height:80px;width:80px;margin-top:-40px;margin-left:-40px}}@-webkit-keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}</style>
		
		
		<!-- Google Map JS-->
		<!-- <script src="https://maps.googleapis.com/maps/api/js?key=[YOUR_API_KEY]"></script> -->
		<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3211eab2bbc7c19d299e85e631e4b68&libraries=services,clusterer,drawing"></script>
	</head>
	

		<!-- Header-->
		<jsp:include page="../common/header.jsp"></jsp:include>

		<!-- Page Title-->
		<div class="rn-page-title">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>시승 예약</h1>
							<p>원하는 차량을 선택하여 시승 하세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<br><br><br>
		
		<!-- 선택안했을때 바 -->
		<div class="row justify-content-md-center selectBar1" >
			<div class="col-lg-10 select1 cursorP"> 
			<span class="carNameArea area1">모델 선택</span> 
			</div>
		</div>	
		<!-- end 선택안했을때 바 -->
		<br>

		<!-- Car Search Form-->
		<div class="rn-search-form-big rn-section selectBar s2 cursorP">
			<div class="container">
				<div class="row">

					<div class="col-lg-12">
						<div class="rn-big-search-form rn-big-search-form-dark">
							<form action="car-search.html">
								<div class="text-center">
									<h1> 
										모델 선택
									</h1>
								</div>
								<div class="text-center carNameArea"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="rn-shape rn-shape-bottom">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
					<path class="rn-shape-fill" d="M500.2,94.7L0,0v100h1000V0L500.2,94.7z"/>
				</svg>
			</div>
		</div>
		<!-- End Car Search Form-->
		<div class="selectBar">
		<!-- Car Results-->
		<div class="rn-section rn-car-search-results">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Car Search Filters-->
						<div class="rn-car-search-filters">
							<div class="rn-car-search-filter-item">
								<label>Brand :</label>
								<select name='brand'>
									<option value="Any" selected>Any</option>
											<c:forEach var="car" items="${bList}">
												<option value="${car}">${car}</option>
											</c:forEach>
								</select>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>	
						<!-- End Car Search Filters-->

		<!-- Cars-->
		<section class="rn-section rn-car-list">
			<div class="container">
				<div class="row" id="carList" >
				
						  <!-- 반복문으로 차동차 목록 가져오기 -->
							<c:forEach var="car" items="${cList}">
									<div class="col-lg-4 col-md-6 cursorP">
									<!-- Car Item-->
									<div class="rn-car-item">
										<div class="rn-car-item-thumb">
												<!-- 이미지 디비에서 불러오기 -->
											<img class="img-fluid" alt="자동차 이미지" srcset="/youngchar/resources/assets/images/tesla_model3.jpg 1x, /youngchar/resources/assets/images/tesla_model3.jpg 2x">
										</div>
										
										<div class="rn-car-item-info">
											<span style="display: none;">${car.carNo}</span>
											<h3>${car.carName}</h3>
											<p class="modelName">${car.carModel}</p>
											<p class="brandName">${car.brand}</p>
										</div>
										
									</div>
									<!-- End Car Item-->
									</div>
						</c:forEach>
				

				</div>
				
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
		</section>
	</div>
		<!-- End Cars-->


		<div class="row justify-content-md-center selectBar1 centerBar">
			<div class="col-lg-10 select1 centerName">센터 선택</div>
		</div>	
		<br>

		<!--  Search Form-->
		<div class="rn-search-form-big rn-section selectBar s2 search center cursorP">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-big-search-form rn-big-search-form-dark">
							<form action="car-search.html">
								<div class="text-center">
									<h1> 
										시승 센터 선택
									</h1>
								</div>
								<div class="text-center centerName">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="rn-shape rn-shape-bottom">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
					<path class="rn-shape-fill" d="M500.2,94.7L0,0v100h1000V0L500.2,94.7z"/>
				</svg>
			</div>
		</div>
		<!-- End Search Form-->



		<!-- 시승 센터 위치-->
		<section class="rn-section rn-car-list selectBar cursorP">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-10">
						<div class="row justify-content-md-center">
							<div id="tableheight" class="col-lg-10" >
								<h2 id="searchNo"></h2> <br>
								
									<table class="table table-hover">
										<tbody id="centerTable"></tbody>
									</table>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-10">
						<div id="map" style="width:500px;height:400px;"></div>
					</div>
				</div>
			</div>
		</section>

		<div class="row justify-content-md-center selectBar1">
			<div class="col-lg-10 select1"> 날짜 선택</div>
		</div>	
		<br>

		<!--  Search Form-->
		<div class="rn-search-form-big rn-section selectBar s2">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-big-search-form rn-big-search-form-dark">
							<form action="car-search.html">
								<div class="text-center">
									<h1> 
										날짜 선택
									</h1>
								</div>
								<div class="text-center">
									날짜, 시간 불러오기
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="rn-shape rn-shape-bottom">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
					<path class="rn-shape-fill" d="M500.2,94.7L0,0v100h1000V0L500.2,94.7z"/>
				</svg>
			</div>
		</div>
		<!-- End Search Form-->


		<section class="rn-section rn-car-list selectBar">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-10">
						달력
					</div>
					
				</div>
			</div>
		</div>
		</section>
		<br><br><br><br>
		<div class="row justify-content-md-center">
			<button class="col-lg-1 btn btn-main  btn-shadow btn-block" >완료</button>
		</div>

		<br><br>


		<!-- footer-->
		<jsp:include page="../common/footer.jsp"></jsp:include>

		<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->
		<script>
		
			             
   
			
		//-------------------------------------------------------------
			 $(document).ready(function(){
			  $(".selectBar").hide();
			  
			 });

			//바 누르면 열리게 하기
			$(".selectBar1").on("click", function(){
				
					$(this).nextUntil(".selectBar1").slideDown();
					$(this).hide();
				
			});

			//열린거 누르면 다시 닫기
			$(".s2").on("click",function(){
				if($(this).prev().prev().css('display')=='none'){
					$(this).prev().prev().slideDown();
					$(this).slideUp();
					$(this).next().slideUp();

				}
			});
			
			function openCenterBar(){					
					$(".centerBar").nextUntil(".selectBar1").slideDown();
					$(".centerBar").hide();
			}
			
			
				 var carList = $("#carList");
				 var originalCarList = carList.html();
				
				



				 
			//브랜드 카테고리 선택시 자동차 브랜드에 맞게 가져오기--------------------------------------------------------------
			$("select[name='brand']").on("change", function(){
				 var brandName = $(this).val();
				 		
				 	//목록 초기화
					 carList.html("");
					 
				 	if(brandName == "Any"){
				 		carList.html(originalCarList);
				 	}
					 var cList = ${cListJSON};
					 console.log(cList);
					 
					 
					 for(var car of cList){
						 
						 if(car.brand == brandName){
							 	var col =$("<div>").addClass("col-lg-4 col-md-6 carNo" + car.carNo);
								var rn = $("<div>").addClass("rn-car-item");
								var thumb = $("<div>").addClass("rn-car-item-thumb");
								var img = $("<img>").addClass("img-fluid").attr("alt", "자동차 이미지").attr("src", car.filePath).attr("srcset", "${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x");
								thumb.append(img);
								rn.append(thumb);

								var info = $("<div>").addClass("rn-car-item-info");
								var h3 = $("<h3>").text(car.carName);
								var model = $("<p>").addClass("modelName").text(car.carModel);
								var brand = $("<p>").addClass("brandName").text(car.brand);
								
								var carNo = $("<span>").css("display","none").text(car.carNo);
								info.append(carNo);
								info.append(h3);
								info.append(model);
								info.append(brand);
								rn.append(info);
								col.append(rn);
								carList.append(col); 
						 }
					 }
				 
			});
			
			var checkFlag = true; 
			//차 선택시 바에 이름 가져오기-----------------------------------------------------------------------------
			$(document).on("click",".rn-car-item", function(){
				openCenterBar();
				
				//선택된거 테두리 색변경하기
						$(this).addClass("carSelect");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
						$(this).parent().siblings().children().removeClass("carSelect");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰







				var carName = $(this).children().next().children("h3").text();
				var carNo = $(this).children().next().children("span").text();
				$(".carNameArea").text(carName);
				
				//trigger() 로 대리점 선택 바 열기
				
				
				
				console.log("carNo : "+carNo);
				//ajax로 차 등록되어있는 업체 가져오기.
				$.ajax({
					url: "getAddr",
					data : {"carNo": carNo},
					dataType: 'json',
					success(companyList){
						if(companyList != null){
							map(companyList);
						}else{
							var checkFlag = false; 
						}
						
					},
					error(){
						console.log("업체 불러오기 실패");
					}
					
				}); //ajax끝
				
				
				
				
			});// 차 선택 이벤트 끝
			
			
			// 대리점 불러오기!
			var comAddr = $("#centerTable").children(":first").children().text();
			console.log(comAddr);
			
	  	
			
		</script>
		<script src="${contextPath}/resources/assets/js/newTestDrive.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>
	</body>
</html>