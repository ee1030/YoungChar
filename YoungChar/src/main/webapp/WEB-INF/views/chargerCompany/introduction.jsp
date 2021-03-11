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

<title>충전기 설치 업체</title>

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

<!-- Google Map JS-->
<script src="https://maps.googleapis.com/maps/api/js?key=[YOUR_API_KEY]"></script>
</head>
<body>

	<!-- Header-->
	<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>

	<!-- Page Title-->
	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1>CHARGER COMPANY</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Title-->

	<!-- Cars-->
	<section class="rn-section rn-car-list">
		<div class="container">
			<div class="row">

				<c:if test="${!empty cList }">
					<c:forEach var="chargerCompany" items="${cList}" varStatus="vs">
						<div class="col-lg-4 col-md-6">

							<!-- Item-->
							<div class="rn-car-item">
								<div class="rn-car-item-thumb">
									<a href="car-single.html">
									<c:forEach items="${thList}" var="th">
										<c:if test="${th.companyNo  == chargerCompany.companyNo}">
											<a href="../chargerCompany/${chargerCompany.companyNo}"><img src="${contextPath}${th.filePath}/${th.fileName}"></a>
										</c:if>
									</c:forEach>
									</a>
								</div>
								<div class="rn-car-item-info">
									<h3>
										<a href="../chargerCompany/${chargerCompany.companyNo}">${chargerCompany.companyName}</a>
									</h3>
									<p>${chargerCompany.introduction}</p>
									<div class="rn-car-list-n-price">
										<ul>
											<li>${chargerCompany.itemA}</li>
											<li>${chargerCompany.itemB}</li>
										</ul>
										<div class="rn-car-price-wrap">
											<a class="rn-car-price" href="../chargerCompany/${chargerCompany.companyNo}"><span class="rn-car-price-from">Go</span> </a>
										</div>
									</div>
								</div>
							</div>
							<!-- End Item-->

						</div>
					</c:forEach>
				</c:if>





			</div>

				<%-- 로그인이 되어있는 경우 --%>
				<c:if test="${!empty loginMember && loginMember.memberGrade == 'A'}">
					<a class="btn btn-success float-right" href="../chargerCompany/insertChargerCompany">등록</a>
				</c:if>
			
		<!-- Post Pagination-->
			<div class="my-4">
				<nav class="rn-pagination rn-pagination-center">
					<ul>

						<%-- 주소 조합 작업 --%>

						<!-- 화살표에 들어갈 주소를 변수로 생성 -->
						<c:set var="firstPage" value="${pageUrl}cp=1" />
						<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />



						<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"
							integerOnly="true" />
						<fmt:parseNumber var="prev" value="${ c1 * 10 }"
							integerOnly="true" />
						<c:set var="prevPage" value="${pageUrl}cp=${prev}" />


						<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) /10 }"
							integerOnly="true" />
						<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }"
							integerOnly="true" />
						<c:set var="nextPage" value="${pageUrl}cp=${next}" />



						<c:if test="${pInfo.currentPage > pInfo.pageSize}">
							<li>
								<!-- 첫 페이지로 이동(<<) --> <a href="${firstPage}"><i
									class="fas fa-angle-right">..</i></a>
							</li>

							<li>
								<!-- 이전 페이지로 이동 (<) --> <a href="${prevPage}"> <i
									class="fas fa-angle-left"></i></a>
							</li>
						</c:if>

						<!-- 페이지 목록 -->
						<c:forEach var="page" begin="${pInfo.startPage}"
							end="${pInfo.endPage}">
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
								<!-- 다음 페이지로 이동 (>) --> <a href="${nextPage}"><i
									class="fas fa-angle-right"></i></a>
							</li>

							<li>
								<!-- 마지막 페이지로 이동(>>) --> <a href="${lastPage}"><i
									class="fas fa-angle-right"></i></a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>



		</div>
	</section>
	<!-- End Cars-->

	<jsp:include page="../common/footer.jsp"/> 

	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
</body>
</html>