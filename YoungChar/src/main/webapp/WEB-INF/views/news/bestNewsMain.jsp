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

<title>뉴스 메인</title>

<!-- Preloader CSS-->
<style>
#recentImage {
	width: 100%;
	height: 100%;
}

#eyeIcon {
	margin-right: 5px;
}

#eyeICON {
	float: right;
}

#preloader:after, #preloader:before {
	content: "";
	display: block;
	left: -1px;
	top: -1px
}

#preloader-overlayer, #preloader:after, #preloader:before {
	position: absolute;
	height: 100%;
	width: 100%
}

#preloader-overlayer {
	position: fixed;
	top: 0;
	left: 0;
	background-color: #112E3B;
	z-index: 999
}

#preloader {
	height: 40px;
	width: 40px;
	position: fixed;
	top: 50%;
	left: 50%;
	margin-top: -20px;
	margin-left: -20px;
	z-index: 9999
}

#preloader:before {
	-webkit-animation: rotation 1s linear infinite;
	animation: rotation 1s linear infinite;
	border: 2px solid #42DB0C;
	border-top: 2px solid transparent;
	border-radius: 100%
}

#preloader:after {
	border: 1px solid rgba(255, 255, 255, .1);
	border-radius: 100%
}

@media only screen and (min-width:768px) {
	#preloader {
		height: 60px;
		width: 60px;
		margin-top: -30px;
		margin-left: -30px
	}
	#preloader:before {
		left: -2px;
		top: -2px;
		border-width: 2px
	}
}

@media only screen and (min-width:1200px) {
	#preloader {
		height: 80px;
		width: 80px;
		margin-top: -40px;
		margin-left: -40px
	}
}

@
-webkit-keyframes rotation {
	from {-webkit-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(359deg);
	transform: rotate(359deg)
}

}
@
keyframes rotation {
	from {-webkit-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(359deg);
	transform: rotate(359deg)
}
}
</style>

<!-- Preloader CSS-->
<style>
#preloader:after, #preloader:before {
	content: "";
	display: block;
	left: -1px;
	top: -1px
}

#preloader-overlayer, #preloader:after, #preloader:before {
	position: absolute;
	height: 100%;
	width: 100%
}

#preloader-overlayer {
	position: fixed;
	top: 0;
	left: 0;
	background-color: #112E3B;
	z-index: 999
}

#preloader {
	height: 40px;
	width: 40px;
	position: fixed;
	top: 50%;
	left: 50%;
	margin-top: -20px;
	margin-left: -20px;
	z-index: 9999
}

#preloader:before {
	-webkit-animation: rotation 1s linear infinite;
	animation: rotation 1s linear infinite;
	border: 2px solid #42DB0C;
	border-top: 2px solid transparent;
	border-radius: 100%
}

#preloader:after {
	border: 1px solid rgba(255, 255, 255, .1);
	border-radius: 100%
}

@media only screen and (min-width:768px) {
	#preloader {
		height: 60px;
		width: 60px;
		margin-top: -30px;
		margin-left: -30px
	}
	#preloader:before {
		left: -2px;
		top: -2px;
		border-width: 2px
	}
}

@media only screen and (min-width:1200px) {
	#preloader {
		height: 80px;
		width: 80px;
		margin-top: -40px;
		margin-left: -40px
	}
}

@
-webkit-keyframes rotation {
	from {-webkit-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(359deg);
	transform: rotate(359deg)
}

}
@
keyframes rotation {
	from {-webkit-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(359deg);
	transform: rotate(359deg)
}
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
						<p>새로운 뉴스와 소식을 이곳에서 접하세요!!</p>
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
				<div class="col-lg-8 rn-post-list rn-grid-post-col-2">
					<div class="row">

						<c:if test="${!empty bestList }">
							<c:forEach var="news" items="${bestList}" varStatus="vs">
								<div class="col-md-6">

									<!-- Blog Post Item (Small Size)-->
									<div class="rn-post-item rn-post-size-sm">
										<div class="rn-post-item-thumb">
											<a href="car-single.html"> <c:forEach items="${thList}" var="th">
													<c:if test="${th.newsNo  == news.newsNo}">
														<a href="../news/${news.newsNo}"><img src="${contextPath}${th.filePath}/${th.fileName}"></a>
													</c:if>
												</c:forEach>
											</a>
										</div>
										<div class="rn-post-item-header">
											<div class="rn-post-date">
												<a href="../news/${news.newsNo}">
													<div class="rn-post-date-inner">
														<span class="rn-post-date-m-y">click</span>
													</div>
												</a>

											</div>
											<div class="rn-post-item-title-meta">
												<div class="rn-post-item-title-meta-inner">

													<div class="rn-post-item-meta">
														<span class="rn-post-item-categories"><a href="#">${news.press}</a> </span> <span class="rn-post-item-author">By <a href="#">${news.reporter}</a>
														</span> <span id="eyeICON" class="rn-post-view-icon"> <i id="eyeIcon" class="far fa-eye"></i>${news.readCount}</span>
													</div>
													<h3 class="rn-post-item-title">
														<a href="../news/${news.newsNo}">${news.newsTitle}</a>
													</h3>
													<span class="rn-recent-post-item-author">${news.newsCreateDate} </span>
												</div>

											</div>

										</div>
									</div>
									<!-- End Blog Post Item (Small Size)-->

								</div>
							</c:forEach>
						</c:if>


					</div>


				</div>
				<div class="col-lg-4">

					<!-- Sidebar-->
					<aside class="rn-widget-area" id="secondary">



						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">CATEGORI</h2>
							<div class="rn-widget-content">
								<ul>
									<li><a href="../news/newsMain">NEWEST</a></li>
									<li><a href="../news/oldestNewsMain">OLDEST</a></li>
									<li><a href="../news/bestNewsMain"><b>BEST</b></a></li>
									<li><a href="../news/worstNewsMain">WOSRT</a></li>
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
															</span> <span class="rn-recent-post-item-author">${news.newsCreateDate} </span>
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
					<%-- 로그인이 되어있는 경우 --%>
					<c:if test="${!empty loginMember}">
						<a class="btn btn-success float-right" href="../news/insertNews">등록하기</a>
					</c:if>



				</div>
			</div>
		</div>
	</div>
	<!-- End Page Content-->


	<!-- Post Pagination-->
	<div class="my-4">
		<nav class="rn-pagination rn-pagination-center">
			<ul>


				<c:url var="pageUrl" value="${pInfo}?" />
				<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
				<c:set var="returnListURL" value="${contextPath}/news/list/${pageUrl}cp=${pInfo.currentPage }" scope="session" />


				<c:set var="firstPage" value="?cp=1" />
				<c:set var="lastPage" value="?cp=${pInfo.maxPage}" />


				<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 5 }" integerOnly="true" />
				<fmt:parseNumber var="prev" value="${ c1 * 5 }" integerOnly="true" />
				<c:set var="prevPage" value="?cp=${prev}" />

				<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 4) / 5 }" integerOnly="true" />
				<fmt:parseNumber var="next" value="${ c2 * 5 + 1 }" integerOnly="true" />
				<c:set var="nextPage" value="?cp=${next}" />


				<c:if test="${pInfo.currentPage > pInfo.pageSize}">
					<li class="page-item">
						<!-- 첫 페이지로 이동(<<) --> <a class="page-link" href="${firstPage}">&lt;&lt;</a>
					</li>

					<li class="page-item">
						<!-- 이전 페이지로 이동 (<) --> <a class="page-link" href="${prevPage}">&lt;</a>
					</li>
				</c:if>


				<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}">
					<c:choose>
						<c:when test="${pInfo.currentPage == page }">
							<li class="page-item disabled"><a class="page-link">${page}</a></li>
						</c:when>

						<c:otherwise>
							<li class="page-item"><a class="page-link" href="?cp=${page}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<c:if test="${next <= pInfo.maxPage}">
					<li class="page-item">
						<!-- 다음 페이지로 이동 (>) --> <a class="page-link" href="${nextPage}">&gt;</a>
					</li>

					<li class="page-item">
						<!-- 마지막 페이지로 이동(>>) --> <a class="page-link" href="${lastPage}">&gt;&gt;</a>
					</li>
				</c:if>

			</ul>
		</nav>
	</div>

	<jsp:include page="../common/footer.jsp"/> 

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