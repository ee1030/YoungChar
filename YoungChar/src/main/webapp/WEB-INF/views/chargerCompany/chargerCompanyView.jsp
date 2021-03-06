<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>충전기 설치 업체 상세페이지</title>

<style>
#buttonsFam{
	margin-top: 50px;
}
#deleteBtn, #updateBtn {
	float: right;
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

<!-- Header-->
<jsp:include page="../common/header.jsp"></jsp:include>

</head>
<body>

	<!-- Single Car Header-->
	<div class="rn-single-car-header">
		<div class="rn-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-car-single-info"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Single Car Header-->

	<!-- Single Car Content-->
	<section class="rn-section">
		<div class="container">

			<div class="row">
				<div class="col-lg-8" id="content">
					<h3>${chargerCompany.companyName}</h3>
					<br>
					<div id="chargerCompany-content">
						<%-- ${board.boardContent} --%>
						<%-- JSTL을 이용한 개행문자 처리 --%>
						<%-- <%%>는 원래 자바코드 --%>
						<%
					pageContext.setAttribute("newLine", "\n");
				%>
						${fn:replace(chargerCompany.companyContent , newLine, "<br>") }
						<%-- el jstl은 컴파일시 자바코드로 변환  --%>
					</div>
				</div>
				<div class="col-lg-4">

					<!-- Check Availability-->
					<div class="rn-small-search-form">

						<div class="rn-small-search-form-title">
							<h2>INFORMATION</h2>
						</div>
						<form>
							<div class="rn-icon-input" id="title">업체명 : ${chargerCompany.companyName}</div>
							<hr>
							<div class="rn-icon-input" id="phone">전화번호 : ${chargerCompany.phone}</div>
							<hr>
							<div class="rn-icon-input" id="fax">팩스 : ${chargerCompany.fax}</div>
							<hr>
							<div class="rn-icon-input" id="email">이메일 : ${chargerCompany.email}</div>
							<hr>
							<div class="rn-icon-input" id="link">
								<a href="${chargerCompany.link}">사이트 바로 가기</a>
							</div>
							<hr>

						</form>
					</div>
					<!-- End Check Availability-->

					<!-- Car Sharing Buttons-->
					<div class="rn-car-share">
						<span>Share this car:</span>
						<ul>
							<li><a href="#"> <i class="fab fa-facebook-f"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-twitter"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-google-plus-g"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-linkedin-in"></i>
							</a></li>
						</ul>
					</div>
					<!-- End Car Sharing Buttons-->
					<div class="text-center" id="buttonsFam">
						<a class="btn btn-success float-right" href="javascript:history.back();">이전</a>

						<c:url var="updateUrl" value="${chargerCompany.companyNo}/chargerCompanyUpdate" />

						<!-- 로그인된 회원이 글 작성자인 경우 -->
						<c:if test="${!empty loginMember && loginMember.memberGrade == 'A'}">
							<a href="${updateUrl}" id="updateBtn" class="btn btn-success ml-1 mr-1">수정</a>
							<form method="POST" action="${chargerCompany.companyNo}/deleteCompany" enctype="multipart/form-data" onsubmit="return validate();">
								<button id="deleteBtn" class="btn btn-success">삭제</button>
							</form>
						</c:if>
					</div>

				</div>
			</div>

			<!-- Car Facilities-->
			<div class="row rn-facilities">
				<div class="col-lg-12">
					<h2 class="rn-simple-title">MAIN ITEMS</h2>
				</div>
				<div class="col-md-3 col-6">
					<ul>
						<li><i class="fas fa-check"></i>${chargerCompany.itemA}</li>
						<li><i class="fas fa-check"></i>${chargerCompany.itemB}</li>
					</ul>
				</div>
			<!-- End Car Facilities-->

		</div>
	</section>
	<!-- End Single Car Content-->



<jsp:include page="../common/footer.jsp"/> 

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