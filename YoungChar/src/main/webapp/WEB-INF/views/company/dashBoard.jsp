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

<title>Dash board</title>

<!-- Preloader CSS-->
		<style>
			.card{
			font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: #112E3B;
			}

			
			.rn-service-item {
				width: 230px;
				display: inline-block;
				margin: 25px;
			}
			
			.card {
				background-color: #79cb4d1f !important;
				width: 850px;
			}
			
			.rn-widget {
				margin-bottom: 40px;
				font-size: 20px;
				line-height: 60px;
			}

</style>




</head>
<body class="rn-preloader">

	<!-- Header-->
	<jsp:include page="../common/header.jsp"/>
	<!-- End Header-->


	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 order-lg-1 pb-15">

					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Today's tasks</h2>
							<p>오늘의 시승 예약 건과 대기 중인 업무를 확인해보세요.</p>
							<span class="rn-title-bg">Today's tasks</span>
						</div>

					</div>
					             


					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-calendar-full"></i>
						</div>
						<div class="rn-service-desc">
							<p>당일 예약</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-user"></i>
						</div>
						<div class="rn-service-desc">
							<p>승인 대기</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-car"></i>
						</div>
						<div class="rn-service-desc">
							<p>시승 후기</p>
						</div>
						<div class="rn-service-title">5 건</div>
					</div>
					<!-- End Service Item-->



					<div class="card">
						<div class="card-body">
							<div class="best-seller-table responsive-tbl">
								<div class="item">
									<div class="table-responsive product-list">
										<table class="table table-bordernone">
											<thead>
												<tr>
													<th class="f-22"><h2>Today</h2></th>
													<th>이름</th>
													<th>전화번호</th>
													<th>차량</th>
													<th>예약일시</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty rList }">
													<tr>
														<td colspan="5">금일 시승 예약건이 없습니다.</td>
													<tr>
												</c:if>
												<c:if test="${!empty rList }">
													<c:forEach var="booking" items="${rList}" varStatus="vs">
														<tr>
															<td>${booking.bookingNo}</td>
															<td>${booking.memberNm}</td>
															<td>${booking.memberPhone}</td>
															<td>${booking.bookingCar}</td>
															<td>
																<%-- 날짜 출력 모양 지정 --%> 
																<fmt:formatDate var="bookingDate" value="${booking.bookingDate }" pattern="yyyy-MM-dd" /> 
																<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> 
																<c:choose>
																	<c:when test="${bookingDate != now}">
																	${bookingDate }
																</c:when>
																	<c:otherwise>
																		<fmt:formatDate value="${booking.bookingDate }" pattern="HH:mm" />
																	</c:otherwise>
																</c:choose>
															</td>
														</tr>
													</c:forEach>
												</c:if>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div id="side-bar">
						<!-- Sidebar-->
						<jsp:include page="sideMenu.jsp"/>
						<!-- End Slidebar-->

					</div>
			</div>
		</div>
		<!-- End Page Content-->
	</section>

	<!-- Site Footer-->

	<!-- End Site Footer-->

	<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->


</body>
</html>