<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Review View</title>
	<style>
	#board-area{ margin-bottom:100px;}
	#board-content{ padding-bottom:150px;}
	#date-area{font-size: 12px; line-height: 12px}
	#date-area>p{margin: 0}
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

		    <!-- Google font-->
			<link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i&amp;display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900&amp;display=swap" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/fontawesome.css">
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

<body class="rn-preloader">

	<!-- Header-->
	


	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<h2>R E V I E W</h2>
			<hr>
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<div class="invoice">
							  <div>
								<div>
								  <div class="row">
									<div class="col-sm-3">
										<h4>브랜드: 현대 </h4>
									</div>
									<div class="col-sm-3">
										<h4>업체: OO지점 </h4>
									</div>
									<div class="col-sm-3">
										<h4>차종: 아이오닉 </h4>
									</div>
									<div class="col-sm-3">
										<h4>별점: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
											</h4>
									</div>
								  </div>
								</div>
								<hr>
								<!-- End InvoiceTop-->
								<div class="row">
									<div class="col-md-10">
									  <div class="media">
										<div class="media-left"><img class="media-object rounded-circle img-60" src="assets/images/user/1.jpg" alt=""></div>
										<div class="media-body m-l-20">
										  <h4 class="media-heading">Johan Deo</h4>
										  <p>JohanDeo@gmail.com</p>
										</div>
									  </div>
									</div>
									<div class="col-md-2">
									  <div class="text-md-end" id="project">
										<button type="button" class="btn btn-outline-danger btn-lg">신고</button>
									  </div>
									</div>
								  </div>
								<!-- End Invoice Mid-->
								<div>
								  <div class="table-responsive invoice-table" id="table">
								  </div>
								  <!-- End Table-->
									<div id="board-content">
										<%-- ${board.boardContent} --%>
									
										<%-- JSTL을 이용한 개행문자 처리 --%>
										
										<% pageContext.setAttribute("newLine", "\n"); %>
										${fn:replace(board.boardContent, newLine, "<br>")}
										<!-- el/jstl은 컴파일 후 java 코드로 변환되는데 이스케이프 문자를 인식하지 못한다.
										스크립틀릿은 java 이므로 java 변수를 생성해서 jstl을 사용해준다.
										 -->
									</div>

								</div>
								<!-- End InvoiceBot-->
				
									<div>
										<div class="float-right">
										
											<%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
											<c:if test="${empty sessionScope.returnListURL}">
												<c:set var="returnListURL" value="../list/${board.boardCode}" scope="session"/>
											</c:if>
											<a class="btn btn-light" href="${sessionScope.returnListURL}">목록으로</a>
					       							<!-- ex)기존주소: /spring/1/505 , 상대 경로 시 현재 위치인 505부터 변경됨.-->
						                	<c:url var="updateUrl" value="${board.boardNo}/update" />
						                	
						                	<!-- 로그인된 회원이 글 작성자인 경우 -->
											<c:if test="${(loginMember != null) && (board.memberId == loginMember.memberId)}">
												<a href="${updateUrl}" class="btn btn-light">수정</a>
												<button id="deleteBtn" class="btn btn-light">삭제</button> 
											</c:if>
										</div>
									</div>
								</div>
					
								
							  </div>
							  <div class="col-sm-12 text-center mt-3">
							
								
								<jsp:include page="reply.jsp"/>
								
									

							  </div>
							  <!-- End Invoice-->
							  <!-- End Invoice Holder-->
							  <!-- Container-fluid Ends-->
							</div>
						  </div>
					</div>
				</div>
			</div>
		<!-- End Page Content-->
	</section>


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