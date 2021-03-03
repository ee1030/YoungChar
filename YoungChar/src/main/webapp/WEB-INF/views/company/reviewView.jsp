<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Review View</title>
	<style>
		.card{
			font-family: 'Noto Sans KR', sans-serif;
		}
	
		#board-area{ margin-bottom:100px;}
		#board-content{ padding-bottom:150px;}
		#date-area{font-size: 12px; line-height: 12px}
		#date-area>p{margin: 0}
	
		.icofont-ui-rating{
	    color: #f8d62b;
			}
		
		.white-star{
    	color: #b5b5b5;
		}
		
		.img-60{
			height: 60px;
		}
			
	</style>

</head>

<body class="rn-preloader">

	<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
	<!-- End Header-->

		<!-- Page Title-->
		<div class="rn-page-title">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>D R I V E &nbsp; R E V I E W</h1>
							<p>지금 생생한 후기들을 확인해보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<br>

	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<h2>R E V I E W</h2>
			<br>
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<div class="invoice">
							  <div>
								<!-- End InvoiceTop-->
								<div class="row">
									<div class="col-md-10">
										  <h3 class="media-heading">${board.boardTitle}</h3>
										  <br>
									  <div class="media">
										<div class="media-left">
										
										<c:choose>
											<c:when test="${!empty board.memImgPath}">
												<img class="media-object rounded-circle img-60" src="${contextPath}${board.memImgPath}/${board.memImgName}">
											</c:when>
											<c:otherwise>
												<img class="media-object rounded-circle img-60" src="${contextPath}/resources/memberFile/user-basic.png">
											</c:otherwise>
										</c:choose>
										
										</div>
										<div class="media-body m-l-20">
										  <h5 class="media-heading">${board.memNickname} </h5>
										  <p>조회 ${board.readCount}  댓글 ${board.replyCount}  작성일 
													<fmt:formatDate var="createDate" value="${board.boardCreateDt }" pattern="yyyy-MM-dd HH:mm"/>
													<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm"/> 
													<c:choose>
														<c:when test="${createDate != now}">
															${createDate }
														</c:when>
														<c:otherwise>
															<fmt:formatDate value="${board.boardCreateDt }" pattern="HH:mm"/>
														</c:otherwise>
													</c:choose>
											</p>
										</div>
									  </div>
									</div>
									<div class="col-md-2">
									  <div class="text-md-end" id="project">
										<button type="button" class="btn btn-outline-danger btn-lg">신고</button>
									  </div>
									</div>
								  </div>
								  <div>
								  <br>
								  <hr>
								  <div class="row">
										<div class="col-sm-3">
											<h5>브랜드: ${board.categoryNm} </h5>
										</div>
										<div class="col-sm-3">
											<h5>센터: ${board.cooName} </h5>
										</div>
										<div class="col-sm-3">
											<h5>차명: ${board.carName} </h5>
										</div>
										<div class="col-sm-3">
											<h5>별점: 
													<c:forEach begin="1" end="${board.csat}">
														<i class="icofont icofont-ui-rating"></i>
													</c:forEach>
													<c:forEach begin="1" end="${5 - board.csat}">
														<i class="icofont icofont-ui-rating white-star"></i>
													</c:forEach>
											</h5>
										</div>
								  </div>
								</div>
								<!-- End Invoice Mid-->
								<div>
								  <div class="table-responsive invoice-table" id="table">
								  </div>
								  <!-- End Table-->
									<div id="board-content">
									   ${board.boardContent}
									</div>
								</div>
								<!-- End InvoiceBot-->
									<hr>
									<div>
										<div class="float-right">
											<c:if test="${empty sessionScope.returnListURL}">
												<c:set var="returnListURL" value="../reviewlist" scope="session"/>
											</c:if>
											<a class="btn btn-light" href="${sessionScope.returnListURL}">목록으로</a>

										</div>
									</div>
								</div>
					
								
							  </div>
							  <div>
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