<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>뉴스 상세페이지</title>

<style>
#buttonsFam{
	margin-top: 50px;
}
#deleteBtn, #updateBtn {
	float: right;
}
#replyTextArea {
height:150px;}
.rn-post-item-footer .text-center {
	display:
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

<!-- Google Map JS-->
</head>
<body>

	<!-- Header-->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- Page Title-->
	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1>News &amp; Updates</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Title-->

	<!-- Page Content-->
	<div class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 rn-post-list">

					<!-- Blog Post Item -->
					<article class="rn-post-item rn-post-size-lg">
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
										<span class="rn-post-item-categories"> <a href="#">${news.press}</a>
										</span> <span class="rn-post-item-author">By <a href="#">${news.reporter}</a>
										</span>
									</div>
									<h3 class="rn-post-item-title">${news.newsTitle}</h3>
								</div>
							</div>
						</div>
						
						<!-- 이미지 부분 -->
				 <c:if test="${!empty newsList }">

					<div class="carousel slide m-3" id="carousel-325626">

						<div class="carousel-inner boardImgArea">
							<c:forEach var="at" items="${newsList}" varStatus="vs">
								<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}" />
								<div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
									<img class="d-block w-100 boardImg" src="${src}" /> <input type="hidden" value="${at.fileNo}">
								</div>
							</c:forEach>
						</div>

						 <a class="carousel-control-prev" href="#carousel-325626" data-slide="prev">
						<span class="carousel-control-prev-icon"></span> 
						<span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-325626" data-slide="next"> 
						<span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a> 
					</div>
				</c:if> 
						
						
						
						<div class="rn-post-item-body">
								<!-- Content -->
				<div id="newscontent">
				<%-- ${board.boardContent} --%>
				<%-- JSTL을 이용한 개행문자 처리 --%>
				<%-- <%%>는 원래 자바코드 --%>
				<%
					pageContext.setAttribute("newLine", "\n");
				%>
				${fn:replace(news.newsContent , newLine, "<br>") }
				<%-- el jstl은 컴파일시 자바코드로 변환  --%>
				</div>
						</div>
						<div class="rn-post-item-footer">

							<ul class="rn-post-love-n-view">
								<li>
									<button>
										<i class="fas fa-thumbs-up"></i>
									</button> <span>${news.best}</span>
								</li>
								<li>
									<button>
										<i class="fas fa-thumbs-down"></i>
									</button> <span>${news.worst}</span>
								</li>
								<li><span class="rn-post-view-icon"> <i class="far fa-eye"></i>
								</span> <span>${news.readCount}</span></li>
							</ul>
						</div>

					</article>
					
					<hr>
					
					<div class="text-center">
						<a class="btn btn-success float-right" href="javascript:history.back();">이전</a>

						<c:url var="updateUrl" value="${news.newsNo}/updateNews" />

						<!-- 로그인된 회원이 글 작성자인 경우 -->
						<c:if test="${(loginMember != null) }">
							<a href="${updateUrl}" id="updateBtn" class="btn btn-success ml-1 mr-1">수정</a>
							<form method="POST" action="${news.newsNo}/deleteNews" enctype="multipart/form-data" onsubmit="return validate();">
								<button id="deleteBtn" class="btn btn-success">삭제</button>
							</form>
						</c:if>
					</div>
					
				

					<!-- End Blog Post Item -->

				</div>
				


				<div class="col-lg-4">

					<!-- Sidebar-->
					<aside class="rn-widget-area" id="secondary">

						<!-- Widget Item-->
						<div class="rn-widget">
							<div class="rn-widget-content">
								<a href="#"> <img class="img-fluid" src="assets/images/banner.png" alt="banner" srcset="assets/images/banner.png 1x, assets/images/banner@2x.png 2x">
								</a>
							</div>
						</div>
						<!-- End Widget Item-->


						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">CATEGORI</h2>
							<div class="rn-widget-content">
								<ul>
									<li><a href="#">NEWEST</a></li>
									<li><a href="#">OLDEST</a></li>
									<li><a href="#">BEST</a></li>
									<li><a href="#">WOSRT</a></li>
									<li><a href="#">MOST COMMENTS</a></li>
								</ul>
							</div>
						</section>
						<!-- End Widget Item-->


						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">RECENT NEWS</h2>
							<div class="rn-widget-content">
								<ul class="rn-recent-posts">
								
								
								<c:if test="${!empty recentList }">
					<c:forEach var="news" items="${recentList}" varStatus="vs">
									<li id="recentPostsItem">
										<!-- Extra Small Post-->
										<div class="rn-recent-post-item">
											<div class="rn-recent-post-item-thumb">
												<c:forEach items="${thList}" var="th">
										<c:if test="${th.newsNo  == news.newsNo}">
											<a href="../news/${news.newsNo}"><img src="${contextPath}${th.filePath}/${th.fileName}" id="recentImage"></a>
										</c:if>
									</c:forEach>
												
											</div>
											<div class="rn-recent-post-item-info">
												<div class="rn-recent-post-item-meta">
													<span class="rn-recent-post-item-categories">${news.reporter}</a>
													</span> <span class="rn-recent-post-item-author">At 15 May, 2018
													</span>
												</div>
												<div class="rn-recent-post-item-title">
													<span class=""><a href="../news/${news.newsNo}">${news.newsTitle}</a></span>
												</div>
											</div>
										</div> <!-- End Extra Small Post-->

									</li>
									
									</c:forEach>
									</c:if>
								</ul>
							</div>
						</section>
						<!-- End Widget Item-->




					</aside>
					<!-- End Sidebar-->

				</div>
			</div>
		</div>
	

	</div>
	<!-- End Page Content-->
	
	
<jsp:include page="newsReply.jsp"/>



	<!-- Site Footer-->
	<footer class="rn-footer">

		<!-- Footer Widgets-->
		<div class="rn-footer-widgets">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">About Us</h2>
							<div class="rn-widget-content">
								<a class="brand-name" href="index.html"> <img src="assets/images/logo.svg" alt="Logo">
								</a>
								<p>Sed sit amet ligula ac nulla finibus euismod nec nec diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent semper, risus eget ornare maximus, ipsum ante semper.</p>
								<ul class="rn-widget-social">
									<li><a href="#"> <i class="fab fa-facebook-f"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-twitter"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-instagram"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-linkedin-in"></i>
									</a></li>
								</ul>
							</div>
						</section>
						<!-- End Widget Item-->

					</div>
					<div class="col-md-5">

						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">Quick Links</h2>
							<div class="rn-widget-content">
								<div class="row rn-quick-links">
									<div class="col-6">
										<ul>
											<li><a href="#">About Us</a></li>
											<li><a href="#">Contact Us</a></li>
											<li><a href="#">Support</a></li>
											<li><a href="#">View Booking</a></li>
											<li><a href="#">Affiliate Programme</a></li>
											<li><a href="#">Marketplace</a></li>
										</ul>
									</div>
									<div class="col-6">
										<ul>
											<li><a href="#">Site Map</a></li>
											<li><a href="#">Careers</a></li>
											<li><a href="#">Press</a></li>
											<li><a href="#">Get a Receipt</a></li>
											<li><a href="#">Community</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>
						<!-- End Widget Item-->

					</div>
					<div class="col-md-3">

						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">Contact Us</h2>
							<div class="rn-widget-content">
								<div class="rn-icon-contents">
									<div class="rn-phone rn-icon-content">
										<div class="rn-icon">
											<i class="lnr lnr-phone"></i>
										</div>
										<div class="rn-info">
											<ul>
												<li>(954)-944-1250</li>
												<li>(954)-944-1251</li>
											</ul>
										</div>
									</div>
									<div class="rn-email rn-icon-content">
										<div class="rn-icon">
											<i class="lnr lnr-envelope"></i>
										</div>
										<div class="rn-info">
											<ul>
												<li>support@example.coms</li>
												<li>sale@example.com</li>
											</ul>
										</div>
									</div>
									<div class="rn-address rn-icon-content">
										<div class="rn-icon">
											<i class="lnr lnr-map-marker"></i>
										</div>
										<div class="rn-info">
											<ul>
												<li>1425 Pointe Lane, Miami</li>
												<li>Florida – 33169, USA</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- End Widget Item-->

					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Widgets-->

		<!-- Footer Copyright-->
		<div class="rn-footer-copyright">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6">
						<p>Copyright &copy; RentNow 2018. All rights reserved.</p>
					</div>
					<div class="col-md-6 text-right">
						<span class="rn-pyament-methods"> <span>We Accept</span> <img src="assets/images/payments.png" alt="payments" srcset="assets/images/payments.png 1x, assets/images/payments@2x.png 2x">
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Copyright-->

	</footer>
	<!-- End Site Footer-->

	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
	
	<script>
		function validate() {
			return confirm("정말로 삭제하시겠습니까?");
		}
	</script>
</body>
</html>