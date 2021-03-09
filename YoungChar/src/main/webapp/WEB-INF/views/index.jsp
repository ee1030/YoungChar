<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>영차영차 메인</title>
	</head>
	<jsp:include page="common/header.jsp"></jsp:include>

		<!-- Slider-->
		<div class="rn-carousel carousel slide" id="carouselExampleControls" data-ride="carousel">
			<div class="carousel-inner">

				<!-- Slider Item 1-->
				<div class="carousel-item beactive">
					<div class="carousel-caption">
						<h2 class="rn-fade-bottom mb-25">No.1 Electric Cars Community</h2>
						<p class="rn-fade-bottom rn-caption-item-2 mb-35">전기차 커뮤니티 이용자 수 1위, 영차영차에 오신 것을 환영합니다.</p>
					</div>
					<div class="rn-slider-overlayer"></div>
					<img class="d-block w-100" src="${contextPath}/resources/assets/images/영차메인3.jpg" alt="slide">
				</div>

				<!-- Slider Item 2-->
				<div class="carousel-item">
					<div class="carousel-caption">
						<h2 class="rn-fade-bottom mb-25">Join Us Now!</h2>
						<p class="rn-fade-bottom rn-caption-item-2 mb-35">영차영차의 회원이 되시고 다양한 정보를 받아보세요.</p>
					</div>
					<div class="rn-slider-overlayer"></div>
					<img class="d-block w-100" src="${contextPath}/resources/assets/images/영차메인2.jpg" alt="slide">
				</div>

			</div>
			<!-- Slider Controls -->
			<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				<span class="lnr lnr-chevron-left" aria-hidden="true"></span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				<span class="lnr lnr-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
		<!-- End slider-->

	

		<!-- Why People Like Us Section-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Why People Like Us?</h2>
							<p>영차영차에는 이 모든 것이 있습니다.</p>
							<span class="rn-title-bg">Why RentNow</span>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-6">

						<!-- Feature with dot-->
						<div class="rn-dot-feature">
							<div class="rn-the-dot"></div>
							<div class="rn-dot-feature-info">
								<h3>충전소</h3>
								<p>전국 1000여곳 이상의 충전소 위치 제공</p>
							</div>
						</div>
						<!-- End Feature with dot-->

					</div>
					<div class="col-lg-3 col-md-6">

						<!-- Feature with dot-->
						<div class="rn-dot-feature">
							<div class="rn-the-dot"></div>
							<div class="rn-dot-feature-info">
								<h3>회원 수</h3>
								<p>60,000명 이상의 국내 최다 이용자 보유</p>
							</div>
						</div>
						<!-- End Feature with dot-->

					</div>
					<div class="col-lg-3 col-md-6">

						<!-- Feature with dot-->
						<div class="rn-dot-feature">
							<div class="rn-the-dot"></div>
							<div class="rn-dot-feature-info">
								<h3>전기차 정보</h3>
								<p>매일 새로운 신차 출시 정보 <br>
								</p>
							</div>
						</div>
						<!-- End Feature with dot-->

					</div>
					<div class="col-lg-3 col-md-6">

						<!-- Feature with dot-->
						<div class="rn-dot-feature">
							<div class="rn-the-dot"></div>
							<div class="rn-dot-feature-info">
								<h3>시승 예약</h3>
								<p>출시 예정인 신차 사전 시승 예약 가능 </p>
							</div>
						</div>
						<!-- End Feature with dot-->

					</div>
				</div>

			</div>
		</section>
		<!-- End Why People Like Us Section-->

		<!-- Popular Cars Section-->
<section class="rn-section rn-section-light-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<!-- Section Title-->
				<div class="rn-section-title  rn-title-bg-color-white ">
					<h2 class="rn-title">New Cars</h2>
					<p>새로운 전기차들을 만나보세요.</p>
					<span class="rn-title-bg">New Cars</span>
				</div>

			</div>
		</div>
		<div class="row">
				<c:if test="${!empty carList }">
					<c:forEach var="list" items="${carList}" begin="0" end="5" varStatus="vs">
				<!-- Car Item-->

						<div class="col-md-4 listView">

							<!-- Blog Post Item (Small Size)-->
							<div class="rn-post-item rn-post-size-sm list-view">
								<div class="rn-post-item-thumb">
									<c:forEach items="${thList}" var="th">
										<c:if test="${th.carNo  == list.carNo}">
											<img style="height: 250px" src="${contextPath}${th.filePath}/${th.fileName}">
										</c:if>
									</c:forEach>
								</div>
								<div class="rn-post-item-header">
									<div class="rn-post-date">
										<div class="rn-post-date-inner">
											No.<span class="rn-post-item-categories bno">${list.carNo }</span>
										</div>
									</div>
									<div class="rn-post-item-title-meta">
										<div class="rn-post-item-title-meta-inner">
											<div class="rn-post-item-meta">
												<span class="rn-post-item-author"> ${list.carName } </span> <br> <span class="rn-post-item-categories">제조사 : ${list.categoryName } </span>
												 <span class="rn-post-item-categories">모델명 ${list.carModel } </span>
											</div>
											<span>
												<h5>${list.minPrice}만원~${list.maxPrice}만원</h5>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- End Car Item-->
				
					
					</c:forEach>
				</c:if>

		</div>
	</div>

</section>


		<!-- Recent New/Posts-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">News &amp; Updates</h2>
							<p>Inbecilloque elegans errorem concedo etsi electram.</p>
							<span class="rn-title-bg">News &amp; Updates</span>
						</div>

					</div>
				</div>
				<div class="row rn-post-list">
					<div class="col-md-4">

						<!-- Blog Post Item (Small Size)-->
						<div class="rn-post-item rn-post-size-sm">
							<div class="rn-post-item-thumb">
								<a href="#">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/blog-item-sm-1.jpg" alt="Expanding Your Home Network’s Reach" srcset="${contextPath}/resources/assets/images/blog-item-sm-1.jpg 1x, ${contextPath}/resources/assets/images/blog-item-sm-1@2x.jpg 2x"/>
								</a>
							</div>
							<div class="rn-post-item-header">
								<div class="rn-post-date">
									<div class="rn-post-date-inner">
										<div class="rn-post-date-d">15</div>
										<div class="rn-post-date-m-y">May, 2018</div>
									</div>
								</div>
								<div class="rn-post-item-title-meta">
									<div class="rn-post-item-title-meta-inner">
										<div class="rn-post-item-meta">
											<span class="rn-post-item-categories">In 
												<a href="#">News</a>
											</span>
											<span class="rn-post-item-author">By 
												<a href="#">John Doe</a>
											</span>
										</div>
										<h3 class="rn-post-item-title">
											<a href="#">Expanding Your Home Network’s Reach</a>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<!-- End Blog Post Item (Small Size)-->

					</div>
					<div class="col-md-4">

						<!-- Blog Post Item (Small Size)-->
						<div class="rn-post-item rn-post-size-sm">
							<div class="rn-post-item-thumb">
								<a href="#">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/blog-item-sm-2.jpg" alt="Hannah Bronfman: Beauty Hound" srcset="${contextPath}/resources/assets/images/blog-item-sm-2.jpg 1x, ${contextPath}/resources/assets/images/blog-item-sm-2@2x.jpg 2x"/>
								</a>
							</div>
							<div class="rn-post-item-header">
								<div class="rn-post-date">
									<div class="rn-post-date-inner">
										<div class="rn-post-date-d">15</div>
										<div class="rn-post-date-m-y">May, 2018</div>
									</div>
								</div>
								<div class="rn-post-item-title-meta">
									<div class="rn-post-item-title-meta-inner">
										<div class="rn-post-item-meta">
											<span class="rn-post-item-categories">In 
												<a href="#">News</a>
											</span>
											<span class="rn-post-item-author">By 
												<a href="#">John Doe</a>
											</span>
										</div>
										<h3 class="rn-post-item-title">
											<a href="#">Hannah Bronfman: Beauty Hound</a>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<!-- End Blog Post Item (Small Size)-->

					</div>
					<div class="col-md-4">

						<!-- Blog Post Item (Small Size)-->
						<div class="rn-post-item rn-post-size-sm">
							<div class="rn-post-item-thumb">
								<a href="#">
									<img class="img-fluid" src="${contextPath}/resources/assets/images/blog-item-sm-3.jpg" alt="Daily Report: A Busy Week Ahead" srcset="${contextPath}/resources/assets/images/blog-item-sm-3.jpg 1x, ${contextPath}/resources/assets/images/blog-item-sm-3@2x.jpg 2x"/>
								</a>
							</div>
							<div class="rn-post-item-header">
								<div class="rn-post-date">
									<div class="rn-post-date-inner">
										<div class="rn-post-date-d">15</div>
										<div class="rn-post-date-m-y">May, 2018</div>
									</div>
								</div>
								<div class="rn-post-item-title-meta">
									<div class="rn-post-item-title-meta-inner">
										<div class="rn-post-item-meta">
											<span class="rn-post-item-categories">In 
												<a href="#">News</a>
											</span>
											<span class="rn-post-item-author">By 
												<a href="#">John Doe</a>
											</span>
										</div>
										<h3 class="rn-post-item-title">
											<a href="#">Daily Report: A Busy Week Ahead</a>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<!-- End Blog Post Item (Small Size)-->

					</div>
				</div>
			</div>
		</section>
		<!-- End Recent New/Posts-->

		<!-- Site Footer-->
		<jsp:include page="common/footer.jsp"/>
		<!-- End Site Footer-->
	
	
	
		<script >
		
		
		$(".list-view").on("click", function() {

			var carNo = $(this).find('.bno').text();
			
			console.log(carNo);
			
			var carViewURL = "${contextPath}/car/carView/" + carNo;

			location.href = carViewURL;
		});
		
		</script>
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