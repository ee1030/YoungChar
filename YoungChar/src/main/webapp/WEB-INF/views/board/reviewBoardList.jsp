<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>

<style>
#ssss{
		margin-top: 20px;
    margin-bottom: 40px;
    left: 600px;
	

}
li {

	cursor: pointer;
}
 #list-view div > p{
	color : green;
} 

</style>



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
							<h1>News &amp; Updates</h1>
					4		<p>Cras eros lorem, rhoncus ac risus sit amet, fringilla ultrices purus.</p>
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
					<h1>리뷰 게시판</h1>

					<div id="ssss">


						<select name="sk" class="form-control" style="width: 100px; display: inline-block; margin: auto;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="titcont">제목+내용</option>
				</select> 
				<input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
				<button class="form-control btn btn-success" id="searchBtn" type="button" style="width: 100px; display: inline-block;">검색</button>
			</div>
			
		</div>

			<div class="col-lg-12 rn-post-list">

				<div class="col-md-2" style="float: left;">
					<section class="rn-widget">
						<h2 class="rn-widget-title">Categories</h2>
						<div class="rn-widget-content" id="categoryNm">
							<ul>
								<li>테슬라</li>
								<li>현대자동차</li>
								<li>기아</li>
								<li>벤츠</li>
								<li>BMW</li>
								<li>아우디</li>
								<li>포르쉐</li>
								<li>르노</li>
							</ul>

						</div>
					</section>
					<section class="rn-widget">
						<h2 class="rn-widget-title">게시판 이동</h2>
						<div class="rn-widget-content">
							<ul>
								<c:if test="${pInfo.boardType == 1 }">
									<li><a href="${contextPath }/board/list/2">정보 게시판</a></li>
									<li><a href="${contextPath }/board/list/3">잡담 게시판</a></li>
								</c:if>


							</ul>
						</div>
					</section>
				</div>


				<div class="row">
					<c:if test="${!empty bList }">
						<c:forEach var="board" items="${bList}" varStatus="vs">
							<div class="col-md-4">

								<!-- Blog Post Item (Small Size)-->
								<div class="rn-post-item rn-post-size-sm list-view" >
									<div class="rn-post-item-thumb">
										<c:forEach items="${thList}" var="th">
											<c:if test="${th.parentBoardNo  == board.boardNo}">
												<img style="height: 250px" src="${contextPath}${th.filePath}/${th.fileName}">
											</c:if>
										</c:forEach>
									</div>
									<div class="rn-post-item-header">
										<div class="rn-post-date">
											<div class="rn-post-date-inner" >
												 <span class="rn-post-item-categories bno" >${board.boardNo }</span>
												<fmt:formatDate var="createDate" value="${board.boardCreateDate }" pattern="yy-MM-dd" />
												<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
												<div class="rn-post-date-m-y">${createDate }</div>
											</div>
										</div>
										<div class="rn-post-item-title-meta">
											<div class="rn-post-item-title-meta-inner">
												<div class="rn-post-item-meta">
													<span class="rn-post-item-author">${board.memberId } </span> <span class="rn-post-item-categories">${board.categoryName } </span> <span class="rn-post-item-categories">views ${board.readCount } </span>
												</div>
												<span>
													<p>${board.boardTitle}</p>
												</span>
											</div>
										</div>
									</div>
								</div>
								
								<!-- End Blog Post Item (Small Size)-->

							</div>

						</c:forEach>


					</c:if>

					<%-- 로그인이 되어있는 경우 --%>
					<c:if test="${!empty loginMember }">
						<a class="btn btn-success " style="width: 100px; margin-top: 10px;" href="../${pInfo.boardType}/insert">글쓰기</a>
					</c:if>




					<!-- Post Pagination-->
					<div class="my-4">
						<nav class="rn-pagination rn-pagination-center">
							<ul>

								<%-- 주소 조합 작업 --%>
								<c:url var="pageUrl" value="${pInfo.boardType}?" />

								<!-- 화살표에 들어갈 주소를 변수로 생성 -->
								<c:set var="firstPage" value="${pageUrl}cp=1" />
								<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />



								<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
								<c:set var="prevPage" value="${pageUrl}cp=${prev}" />


								<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) /10 }" integerOnly="true" />
								<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
								<c:set var="nextPage" value="${pageUrl}cp=${next}" />



								<c:if test="${pInfo.currentPage > pInfo.pageSize}">
									<li>
										<!-- 첫 페이지로 이동(<<) --> <a href="${firstPage}"><i class="fas fa-angle-right">..</i></a>
									</li>

									<li>
										<!-- 이전 페이지로 이동 (<) --> <a href="${prevPage}"> <i class="fas fa-angle-left"></i></a>
									</li>
								</c:if>

								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}">
									<c:choose>
										<c:when test="${pInfo.currentPage == page }">
											<li><a class="page-link">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
								<c:if test="${next <= pInfo.maxPage}">
									<li>
										<!-- 다음 페이지로 이동 (>) --> <a href="${nextPage}"><i class="fas fa-angle-right"></i></a>
									</li>

									<li>
										<!-- 마지막 페이지로 이동(>>) --> <a href="${lastPage}"><i class="fas fa-angle-right"></i></a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>

				</div>
			</div>
		</div>
		</div>
		<!-- End Page Content-->

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
									<a class="brand-name" href="index.html">
										<img src="assets/images/logo.svg" alt="Logo">
									</a>
									<p>Sed sit amet ligula ac nulla finibus euismod nec nec diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent semper, risus eget ornare maximus, ipsum ante semper.</p>
									<ul class="rn-widget-social">
										<li>
											<a href="#">
												<i class="fab fa-facebook-f"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-twitter"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-instagram"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-linkedin-in"></i>
											</a>
										</li>
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
												<li>
													<a href="#">About Us</a>
												</li>
												<li>
													<a href="#">Contact Us</a>
												</li>
												<li>
													<a href="#">Support</a>
												</li>
												<li>
													<a href="#">View Booking</a>
												</li>
												<li>
													<a href="#">Affiliate Programme</a>
												</li>
												<li>
													<a href="#">Marketplace</a>
												</li>
											</ul>
										</div>
										<div class="col-6">
											<ul>
												<li>
													<a href="#">Site Map</a>
												</li>
												<li>
													<a href="#">Careers</a>
												</li>
												<li>
													<a href="#">Press</a>
												</li>
												<li>
													<a href="#">Get a Receipt</a>
												</li>
												<li>
													<a href="#">Community</a>
												</li>
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
							<span class="rn-pyament-methods">
								<span>We Accept</span>
								<img src="assets/images/payments.png" alt="payments" srcset="assets/images/payments.png 1x, assets/images/payments@2x.png 2x">
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- End Footer Copyright-->

		</footer>
		<!-- End Site Footer-->
		<script>
		// 게시글 상세보기 기능 
		$(".list-view").on("click", function() {

			var boardNo = $(this).find('.bno').text();
			
			console.log(boardNo);
			
			var boardViewURL = "../${pInfo.boardType}/" + boardNo;

			location.href = boardViewURL;
		});
		
		$("#categoryNm li").on('click',function(){
			
			var category = $(this).text();
			
			console.log(category);
			
			var categoryCode = 0;
			
			
			
			switch(category){
			case "테슬라" : categoryCode = 1; break;
			case "현대자동차" : categoryCode = 2; break;
			case "기아" : categoryCode = 3 ; break;
			case "벤츠" : categoryCode = 4; break;
			case "BMW" : categoryCode = 5; break;
			case "아우디" : categoryCode = 6; break;
			case "포르쉐" : categoryCode = 7; break;
			case "르노" : categoryCode = 8; break;
			
			}
			
			console.log(categoryCode);
			
			var selectCategoryURL = "${pInfo.boardType}/" + categoryCode;
			location.href = selectCategoryURL;
			
		});
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