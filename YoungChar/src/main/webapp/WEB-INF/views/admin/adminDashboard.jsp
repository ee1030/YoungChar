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
.card {
	font-family: 'Noto Sans KR', sans-serif;
}

.rn-header {
	position: inherit !important;
	background-color: rgba(17, 46, 59, 0.7);
}

.rn-service-item {
	width: 200px;
	display: inline-block;
	margin: 25px;
}

.card {
	background-color: #79cb4d1f !important;
	width: 850px;
	margin-left: 100px;
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
	<jsp:include page="../common/header.jsp" />
	<!-- End Header-->


	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<jsp:include page="sideMenu.jsp" />
				</div>
				<div class="col-lg-10 order-lg-1 pb-15">

					<div class="col-lg-12">
						<!-- Section Title-->
						<div class="rn-section-title">
							<h2 class="rn-title">관리자 메뉴</h2>
							<span class="rn-title-bg">관리자 메뉴</span>
						</div>

					</div>


					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-calendar-full"></i>
						</div>
						<div class="rn-service-desc">
							<p>신규 가입</p>
						</div>
						<div class="rn-service-title">${newMember} 건</div>
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-user"></i>
						</div>
						<div class="rn-service-desc">
							<p>신규 업체</p>
						</div>
						<div class="rn-service-title">${newCompany} 건</div>
					</div>
					<!-- End Service Item-->

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-car"></i>
						</div>
						<div class="rn-service-desc">
							<p>전체 게시글</p>
						</div>
						<div class="rn-service-title">${allBoardCount} 건</div>
					</div>

					<!-- Service Item-->
					<div class="rn-service-item">
						<div class="rn-service-icon">
							<i class="lnr lnr-car"></i>
						</div>
						<div class="rn-service-desc">
							<p>시승 예약</p>
						</div>
						<div class="rn-service-title">${testDrive} 건</div>
					</div>
					<!-- End Service Item-->

					<div class="card">
						<div class="card-header">
							<h5>신규가입 회원</h5>
						</div>
						<div class="card-body">
							<div class="user-status table-responsive">
								<table class="table table-bordernone text-center">
									<thead>
										<tr>
											<th scope="col">닉네임</th>
											<th scope="col">이름</th>
											<th scope="col">이메일</th>
											<th scope="col">가입일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${mList}">  
											<tr>
												<td class="bd-t-none u-s-tb">
													<div class="align-middle image-sm-size">
														<img class="img-radius align-top m-r-15 rounded-circle" src="${contextPath}/resources/assets/images/user/tmpImg.png" alt="">
														<div class="d-inline-block">
															<h6>
																${member.nickName} 
															</h6>
														</div>
													</div>
												</td>
												<td>${member.memberNm}</td>
												<td>
													${member.memberEmail}
												</td>
												<td>${member.signDt}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="code-box-copy">
								<button class="code-box-copy__btn btn-clipboard" data-clipboard-target="#example-head2" title="Copy">
									<i class="icofont icofont-copy-alt"></i>
								</button>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header">
							<h5>
								시승 브랜드 비율
							</h5>
						</div>
						<div id="piechart" style="width: 900px; height: 500px;"></div>
					</div>



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
	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.DataTable();
			data.addColumn('string', 'DataName');
			data.addColumn('number', 'Value');
			
			/* <c:forEach var="chartData" items="${cList}" >
				data.addRows(${chartData.})
			</c:forEach> */

			var options = {
				title : '브랜드 비율'
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>

</body>
</html>