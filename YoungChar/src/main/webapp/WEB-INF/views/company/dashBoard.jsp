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
			
			.card-body{
				height: 400px;
			}
			
			.col-md-3{
				display: inline-block;
				margin: 0 30px;
				padding: 0px !important;
			}
			
			.col-md-5, .col-md-6{
				display: inline-block;
				padding: 5px !important;
			}
			
			.col-md-8{
				padding: 0px !important;
			}
			
			.table-responsive{
				max-height: 300px;
			}
			
			.datepicker--cell{
				height: 40px !important;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: #112E3B;
			}
			
			.rn-service-item {
				display: inline-block;
				width: 100%;
				padding: 0px;
				cursor: pointer;
				border : 1px solid #d3d3d3b3 !important;
			}
			
			.rn-widget {
				margin-bottom: 40px;
				font-size: 20px;
				line-height: 60px;
			}
			


</style>
 <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/date-picker.css">



</head>
<body class="rn-preloader">

	<!-- Header-->
	<jsp:include page="../common/header.jsp"/>
	<!-- End Header-->


	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 order-lg-1 pb-15">

					<div class="col-lg-12">

						<!-- Section Title-->
						<div class="rn-section-title   ">
							<h2 class="rn-title">Today's tasks</h2>
							<p>오늘의 시승 예약 건과 대기 중인 업무를 확인해보세요.</p>
							<span class="rn-title-bg">Today's tasks</span>
						</div>
					</div>

					<!-- Service Item-->
					<div class="col-md-3">
					
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-calendar-full"></i>
						</div>
						<div class="rn-service-desc">
							<p>당일 예약</p>
						</div>
						<div class="rn-service-title">${aplCount} 건</div>
					</div>
					
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div id="waiting" class="col-md-3">
					
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-user"></i>
						</div>
						<div class="rn-service-desc">
							<p>승인 대기</p>
						</div>
						<div class="rn-service-title">${waitingCount} 건</div>
					</div>
					
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div id="review" class="col-md-3">
					
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-car"></i>
						</div>
						<div class="rn-service-desc">
							<p>시승 후기</p>
						</div>
						<div class="rn-service-title">${reviewCount} 건</div>
					</div>
					
					</div>
					<!-- End Service Item-->
					
					
					<div class="xl-50 calendar-sec col-md-5">
						<div class="card gradient-primary o-hidden">
              <div class="card-body">
                <div class="default-datepicker">
                  <div class="datepicker-here" data-language="en"></div>
                </div><span class="default-dots-stay overview-dots full-width-dots"><span class="dots-group"><span class="dots dots1"></span><span class="dots dots2 dot-small"></span><span class="dots dots3 dot-small"></span><span class="dots dots4 dot-medium"></span><span class="dots dots5 dot-small"></span><span class="dots dots6 dot-small"></span><span class="dots dots7 dot-small-semi"></span><span class="dots dots8 dot-small-semi"></span><span class="dots dots9 dot-small">                </span></span></span>
              </div>
            </div>
         </div>
         
         <div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="best-seller-table responsive-tbl">
								<div class="item">
									<div class="table-responsive product-list">
										<table class="table table-bordernone">
											<thead>
												<tr>
													<th><h6>Name</h6></th>
													<th><h6>Phone</h6></th>
													<th><h6>Car</h6></th>
													<th><h6>Time</h6></th>
												</tr>
											</thead>
											<tbody id="table">
												<c:if test="${empty apl }">
													<tr>
														<td colspan="5">금일 시승 예약건이 없습니다.</td>
													<tr>
												</c:if>
												<c:if test="${!empty apl }">
													<c:forEach var="apl" items="${apl}" varStatus="vs">
														<tr>
															<td>${apl.memNm}</td>
															<td>${apl.memPhone}</td>
															<td>${apl.carName}</td>
															<td>
																<%-- 날짜 출력 모양 지정 --%> 
																<span class="badge rounded-pill badge-warning text-dark">
																	<fmt:formatDate var="testDriveDt" value="${apl.testDriveDt}" pattern="HH:mm" />
																	${testDriveDt} 
																</span>
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
	
	  <script src="${contextPath}/resources/assets/js/datepicker/date-picker/datepicker.js"></script>
    <script src="${contextPath}/resources/assets/js/datepicker/date-picker/datepicker.en.js"></script>
    <script src="${contextPath}/resources/assets/js/datepicker/date-picker/datepicker.custom.js"></script>
		<script>
		
		$("#waiting").on('click', function(){
			
			location.href = "${contextPath}/company/applicationlist/n"
			
		});
		
		$("#review").on('click', function(){
			
			location.href = "${contextPath}/driveReview/search?sk=sc&sv=${company.cooName}"
			
		});
		
		
		$(document).on('click', '.datepicker--cell-day', function(){
			
			var date = $(this).attr("data-date");
			var month = $(this).attr("data-month");
			var year = $(this).attr("data-year");
			var searchDate = year + "-" + 3 + "-" + date;
			
			$.ajax({
				url : "${contextPath}/company/selectSchedule/" + searchDate,
				type : "post",
				dataType : "json",
				success : function(aList){
					
					var table = $("#table");
					
					table.html("");
						
					
					if(aList == ""){
						
						var tr = $("<tr>");
						var td = $("<td>").attr("colspan", 5).html(searchDate + " 의 시승 예약건이 없습니다.");
						
						tr.append(td);
						table.append(tr);
					}

					
					$.each(aList, function(index, item){
						
						var tr = $("<tr>");
						
						var memNm = $("<td>").html(item.memNm);
						var memPhone = $("<td>").html(item.memPhone);
						var carName = $("<td>").html(item.carName);
						var testDriveDt = $("<td>");
						var span = $("<span>").addClass("badge rounded-pill badge-warning text-dark").html(item.testDriveDt);
						testDriveDt.append(span);
						
						tr.append(memNm).append(memPhone).append(carName).append(testDriveDt);
						table.append(tr);
					});
					
					
				}, error : function(){
					console.log("예약 목록 조회 실패");
				}
				
			});
			
		});
		
		
		</script>


	<!-- Site Footer-->

	<!-- End Site Footer-->

	<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->


</body>
</html>