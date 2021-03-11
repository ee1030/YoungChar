<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>시승 예약 확인</title>

		<style>
			.completion{
				background-color: darkgray;
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				border: 1px solid #e9eff2;
				border-radius: 3px;
				margin-bottom: 30px;
				padding: 30px;
			}

			.completion-btn{
				background-color: #e9eff2;
			}
			.btn-block{
			margin-top: 0 !important;
			}
			
			.click-green{
				background-color : #00D231 !important;
			}
			
			#noRs{
				text-align : center;
				font-size : 25px;
			}
			
			.img-fluid{
				max-width: 300px !important;
			}
			
			
		</style>
		<!-- Preloader CSS-->
		<style>#preloader:after,#preloader:before{content:"";display:block;left:-1px;top:-1px}#preloader-overlayer,#preloader:after,#preloader:before{position:absolute;height:100%;width:100%}#preloader-overlayer{position:fixed;top:0;left:0;background-color:#112E3B;z-index:999}#preloader{height:40px;width:40px;position:fixed;top:50%;left:50%;margin-top:-20px;margin-left:-20px;z-index:9999}#preloader:before{-webkit-animation:rotation 1s linear infinite;animation:rotation 1s linear infinite;border:2px solid #42DB0C;border-top:2px solid transparent;border-radius:100%}#preloader:after{border:1px solid rgba(255,255,255,.1);border-radius:100%}@media only screen and (min-width:768px){#preloader{height:60px;width:60px;margin-top:-30px;margin-left:-30px}#preloader:before{left:-2px;top:-2px;border-width:2px}}@media only screen and (min-width:1200px){#preloader{height:80px;width:80px;margin-top:-40px;margin-left:-40px}}@-webkit-keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}</style>
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
							<h1>시승 예약 확인</h1>
							<p>예약 확인 | 예약 취소</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<br>
		<!-- 버튼 영역 -->
		<div class="row justify-content-md-center">
			<button class="col-lg-2 btn btn-main btn-shadow btn-block colorBtn click-green" id="reservation">예약 중</button>
			<button class="col-lg-2 btn btn-main btn-shadow btn-block colorBtn" id="complete">시승 완료</button>
		</div>
		<!-- 버튼 끝 -->

		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
					
							<c:if test='${empty rList}'>
								<div id="noRs"> 예약 내역이 없습니다.</div>
								</c:if>
								
						<!--  A:승인완료---------------------------------------------------->
					<div  class="col-lg-12 reservationArea">
						<c:forEach var="rs" items="${rList}">
					<c:if test='${rs.approvalStatus == "A"}'>
								<div class="rn-cart-item">
									<div class="rn-cart-item-thumb">
										<!-- 이미지 디비에서 불러오기 -->
												<c:choose>
													<c:when test="${empty rs.fileName}">
														<c:set var="src" value="/youngchar/resources/assets/images/teslaCar.jpg"/>
													</c:when>
													<c:otherwise>
														<c:set var="src" value="${contextPath}${rs.filePath}/${rs.fileName} 1x, ${contextPath}${rs.filePath}/${rs.fileName} 2x "/>
													</c:otherwise>
												</c:choose>
											<img class="img-fluid" alt="자동차 이미지" srcset="${src}">
										<%-- <img class="img-fluid" src="${contextPath}/resources/assets/images/cart-item-1.jpg" alt="Cart Item" srcset="${contextPath}/resources/assets/images/cart-item-1.jpg 1x, ${contextPath}/resources/assets/images/cart-item-1@2x.jpg 2x"/>
									 --%></div>
									<div class="rn-cart-item-info">
										<div class="rn-cart-item-title-price">
										<span>승인완료</span> <br>
											<h2>
												<a href="#">${rs.carName}</a>
											</h2>
											<span>${rs.carModel}</span>
										</div>
										<div class="rn-locations">
											<div class="rn-pickup-location">
													<div class="rn-location">${rs.memAdress}</div>
											</div>
											<div class="rn-drop-location">
												<div class="rn-date-n-time">${rs.testDriveDate}</div>
											</div>
										</div>
										
									</div>
									 <div class="rn-cart-item-actions">
									 	<span class="btn btn-delete btn-secondary rsCansle" id="${rs.reservationNo}" onclick="cancle(this)">예약 취소</span>
									</div> 
								</div>
					</c:if>
						</c:forEach> 
							</div>
								<!--  N:승인대기---------------------------------------------------->
							<div  class="col-lg-12 reservationArea">
						<c:forEach var="rs" items="${rList}">
							<c:if test='${rs.approvalStatus == "N"}'>
								<div class="rn-cart-item">
									<div class="rn-cart-item-thumb">
									<c:choose>
													<c:when test="${empty rs.fileName}">
														<c:set var="src" value="/youngchar/resources/assets/images/teslaCar.jpg"/>
													</c:when>
													<c:otherwise>
														<c:set var="src" value="${contextPath}${rs.filePath}/${rs.fileName} 1x, ${contextPath}${rs.filePath}/${rs.fileName} 2x "/>
													</c:otherwise>
												</c:choose>
											<img class="img-fluid" alt="자동차 이미지" srcset="${src}">
									</div>
									<div class="rn-cart-item-info">
										<div class="rn-cart-item-title-price">
										<span>승인대기</span> <br>
											<h2>
												<a href="#">${rs.carName}</a>
											</h2>
											<span>${rs.carModel}</span>
										</div>
										<div class="rn-locations">
											<div class="rn-pickup-location">
													<div class="rn-location">${rs.memAdress}</div>
											</div>
											<div class="rn-drop-location">
												<div class="rn-date-n-time">${rs.testDriveDate}</div>
											</div>
										</div>
										
									</div>
									<div class="rn-cart-item-actions">
										<span class="btn btn-delete btn-secondary rsCansle" id="${rs.reservationNo}" onclick="cancle(this)">예약 취소</span>
									</div>
								</div>
					</c:if>
					</c:forEach>
					</div>
					
					


						<div class="col-lg-12 completeArea">
						 <c:forEach var="rs" items="${rList}"> 
						
						<!-- Y:시승완료 --------------------------------------------------------------------->
						<c:if test='${rs.approvalStatus == "Y"}'>
								<div class="rn-cart-item">
									<div class="rn-cart-item-thumb">
									<c:choose>
													<c:when test="${empty rs.fileName}">
														<c:set var="src" value="/youngchar/resources/assets/images/teslaCar.jpg"/>
													</c:when>
													<c:otherwise>
														<c:set var="src" value="${contextPath}${rs.filePath}/${rs.fileName} 1x, ${contextPath}${rs.filePath}/${rs.fileName} 2x "/>
													</c:otherwise>
												</c:choose>
											<img class="img-fluid" alt="자동차 이미지" srcset="${src}">
									</div>
									<div class="rn-cart-item-info">
										<div class="rn-cart-item-title-price">
										<span>시승완료</span> <br>
											<h2>
												<a href="#">${rs.carName}</a>
											</h2>
											<span>${rs.carModel}</span>
										</div>
										<div class="rn-locations">
											<div class="rn-pickup-location">
													<div class="rn-location">${rs.memAdress}</div>
											</div>
											<div class="rn-drop-location">
												<div class="rn-date-n-time">${rs.testDriveDate}</div>
											</div>
										</div>
										
									</div>
									<div class="rn-cart-item-actions">
										<a class="btn btn-main btn-primary" id="${rs.reservationNo}" href="${contextPath}/driveReview/insertreview/${rs.reservationNo}">시승 후기 남기기</a>
									</div>
								</div>
						</c:if>
						</c:forEach>
						<!-- End Cart Item-->
						</div>

					</div>
				</div>
				
			</div>
		</section>
		<!-- End Page Content-->
		
		<!-- footer-->
		<jsp:include page="../common/footer.jsp"></jsp:include>

		<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->
		<script type="text/javascript">
		$(document).ready(function(){
			$(".reservationArea").css("display","inline-block");
			$(".completeArea").css("display","none");
		})
		//예약 버튼 눌렀을때 버튼 배경색 변경
		$(".colorBtn").on("click",function(){
			if($(this).is("click-green")){
				$(this).removeClass("click-green");
			}
			$(this).addClass("click-green");
			$(this).siblings().removeClass("click-green");
		});
		
		//예약중 버튼 눌렀을때 화면 띄우기
		$("#reservation").on("click",function(){
			$(".reservationArea").css("display","inline-block");
			$(".completeArea").css("display","none");
		});
		$("#complete").on("click",function(){
			$(".completeArea").css("display","inline-block");
			$(".reservationArea").css("display","none");
		});
		
		
		//예약 취소 버튼 눌렀을때 swal
		function cancle(e){
			//console.log($(e).attr('id'));
			swal({
				  title: "예약을 취소하시겠습니까?",
				  text: "",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				}).then((willDelete) => {
					  if (willDelete) {
						    
						    var h = "cancleReservation/"+$(e).attr('id');
						    //console.log
						    location.href=h; 
						  } 
						});
				
			
		}
		
		</script>
		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>
	</body>
</html>