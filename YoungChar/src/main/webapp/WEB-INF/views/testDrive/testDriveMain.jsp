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

		<title>시승 메인 페이지</title>

		<!-- Preloader CSS-->
		<style>#preloader:after,#preloader:before{content:"";display:block;left:-1px;top:-1px}#preloader-overlayer,#preloader:after,#preloader:before{position:absolute;height:100%;width:100%}#preloader-overlayer{position:fixed;top:0;left:0;background-color:#112E3B;z-index:999}#preloader{height:40px;width:40px;position:fixed;top:50%;left:50%;margin-top:-20px;margin-left:-20px;z-index:9999}#preloader:before{-webkit-animation:rotation 1s linear infinite;animation:rotation 1s linear infinite;border:2px solid #42DB0C;border-top:2px solid transparent;border-radius:100%}#preloader:after{border:1px solid rgba(255,255,255,.1);border-radius:100%}@media only screen and (min-width:768px){#preloader{height:60px;width:60px;margin-top:-30px;margin-left:-30px}#preloader:before{left:-2px;top:-2px;border-width:2px}}@media only screen and (min-width:1200px){#preloader{height:80px;width:80px;margin-top:-40px;margin-left:-40px}}@-webkit-keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes rotation{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}
		
		/* .buttonColor{
			 background-color : grey !important; 
		} */
		
		.btn-main {
		background-color: #00b92b !important;
  border-color: #00b92b !important;
  color: #fff !important;
	
}

.btn-main:hover {
  	
  background-color: #00D231 !important;
  border-color: #00D231 !important;
  color: #fff !important;
}
		.carImg{
			max-width : 200px !important;
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

	</head>
	

		<!-- Header-->
		<jsp:include page="../common/header.jsp"></jsp:include>

		<!-- Page Title-->
		<div class="rn-page-title" margin="">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>시승 센터</h1>
							<p>원하는 차량을 시승해보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<!-- What We Offer-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Service</h2>
							<p>원하는 서비스를 선택하세요</p>
							<span class="rn-title-bg">Service</span>
						</div>

					</div>
				</div>
				<div class="row">

					<div class="col-lg-6 col-md-6">

						<!-- Service Item-->
						<div class="rn-service-item"  OnClick="location.href ='reservation'" style="cursor:pointer;">
							<div class="rn-service-icon">
								<i class="lnr lnr-calendar-full"></i>
							</div>
							<div class="rn-service-title">시승 예약</div>
							<div class="rn-service-desc">
								<p>자동차 시승 예약</p>
							</div>
						</div>
						<!-- End Service Item-->

					</div>


					<div class="col-lg-6 col-md-6">

						<!-- Service Item-->
						<div class="rn-service-item"  OnClick="location.href ='myReservation'" style="cursor:pointer;">
							<div class="rn-service-icon">
								<i class="lnr lnr-user"></i>
							</div>
							<div class="rn-service-title">내 시승 예약</div>
							<div class="rn-service-desc">
								<p>예약 확인 / 수정 / 취소</p>
							</div>
						</div>
						<!-- End Service Item-->

					</div>

					
					
				</div>
			</div>
		</section>
		<!-- End What We Offer-->

		<!-- Call To Action-->
		<section class="rn-section rn-service-c2a">
			<div class="rn-section-overlayer" >
				<!-- <div id="background"></div> -->
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2>자동차 시승 후기가 궁금하신가요?</h2>
						<p>시승 후기 게시판에서 시승 후기를 확인하세요.</p>
						<a class="btn btn-main btn-lg btn-shadow buttonColor" href="${contextPath}/driveReview/reviewlist">시승 후기 게시판</a>
					</div>
				</div>
			</div>
		</section>
		<!-- End Call To Action-->

		<!-- Clients-->
		<section class="rn-section rn-section-light-gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Review</h2>
							<p></p>
							<span class="rn-title-bg">Review</span>
						</div>

						<div class="rn-testimonials">
							<div class="rn-testimonials-carousel carousel slide" id="rn-testimonials" data-ride="carousel">
								<div class="carousel-inner">
								
								
								 <div class="carousel-item active">
										<blockquote class="rn-testimonial-item">
											<div class="rn-testimonial-author">
												<div class="rn-testimonial-author-thumb">
													<!-- <img class="carImg" src="/youngchar/resources/assets/images/teslaCar.jpg" srcset="/youngchar/resources/assets/images/teslaCar.jpg 1x, /youngchar/resources/assets/images/teslaCar.jpg 2x"/>
 -->
												</div>
												<div class="rn-testimonial-author-info"><strong>${reviewList[0].memNickname}</strong>
													<p>${reviewList[0].carName}</p>
												</div>
											</div>
											<p> ${ reviewList[0].boardTitle}
											</p>
											<footer>
												<div class="rn-testimonial-rating">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</footer>
										</blockquote>
									</div>
									
									<div class="carousel-item">
										<blockquote class="rn-testimonial-item">
											<div class="rn-testimonial-author">
												<div class="rn-testimonial-author-thumb">
													<%-- <img class="carImg" src="${contextPath}${memImgPath}/${memImgName}" srcset="${contextPath}${memImgPath}/${memImgName} 1x, ${contextPath}${memImgPath}/${memImgName} 2x"/>
												 --%></div>
												<div class="rn-testimonial-author-info"><strong>${reviewList[0].memNickname}</strong>
													<p>${reviewList[0].carName}</p>
												</div>
											</div>
											<p> ${ reviewList[0].boardTitle}
											</p>
											<footer>
												<div class="rn-testimonial-rating">
												<c:set var="star" value="${csat}"/>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</footer>
										</blockquote>
									</div>
									
									<div class="carousel-item">
										<blockquote class="rn-testimonial-item">
											<div class="rn-testimonial-author">
												<div class="rn-testimonial-author-thumb">
													<!-- <img class="carImg" src="/youngchar/resources/assets/images/teslaCar.jpg" srcset="/youngchar/resources/assets/images/teslaCar.jpg 1x, /youngchar/resources/assets/images/teslaCar.jpg 2x"/>
											 -->	</div>
												<div class="rn-testimonial-author-info"><strong>${reviewList[0].memNickname}</strong>
													<p>${reviewList[0].carName}</p>
												</div>
											</div>
											<p> ${ reviewList[0].boardTitle}
											</p>
											<footer>
												<div class="rn-testimonial-rating">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</div>
											</footer>
										</blockquote>
									</div>

								</div>
								<a class="carousel-control-prev" href="#rn-testimonials" role="button" data-slide="prev">
									<i class="fas fa-angle-left" aria-hidden="true"></i>
								</a>
								<a class="carousel-control-next" href="#rn-testimonials" role="button" data-slide="next">
									<i class="fas fa-angle-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Clients-->

		<!-- footer-->
		<jsp:include page="../common/footer.jsp"></jsp:include>

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