<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Application list</title>

		<!-- Preloader CSS-->
		<style>
		
			.rn-header{
				position: inherit !important;
				background-color: rgb(85, 85, 85);
			}
		
					#side-bar{
				width: 300px;
			}

			.bg-wrap .user-logo .img {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				margin: 0 auto;
				margin-bottom: 10px; }
			.bg-wrap .user-logo h3 {
				color: black;
				font-size: 18px; }

			.img {
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center center; 
			}	

			.rn-service-item {
				width: 230px;
				display: inline-block;
				margin: 25px;
			}

			.card{
				width: 850px;
			}

			.rn-widget {
				margin-bottom: 40px;
				font-size: 20px;
				line-height: 60px;
			}

			.rn-pagination {
				margin-bottom: 40px;
				text-align: center;
			}

			#select1{
				width: 100px;
				display: inline-block;
				float: right;
			}

			#select2{
				width: 100px;
				padding: 0px;
			}

			#head{
				display: inline-block;
				font-size: 21px;
				font-weight: bold;
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

						
						<div class="col-sm-12">
							<div class="card">
							  <div class="card-header">
								<div id="head">시승 신청 내역</div>
									<select id="select1">
										<option value="none">--선택--</option>
										<option value="N">승인대기</option>
										<option value="A">승인완료</option>
										<option value="Y">시승완료</option>
										<option value="C">시승취소</option>
									</select>
							 </div>
							  <div class="table-responsive">
								<table class="table table-hover">
								  <thead>
									<tr>
									  <th scope="col">No</th>
									  <th scope="col">이름</th>
									  <th scope="col">전화번호</th>
									  <th scope="col">차량</th>
									  <th scope="col">예약일시</th>
									  <th scope="col">예약상태</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <th scope="row">1</th>
									  <td>Alexander</td>
									  <td>Orton</td>
									  <td>@mdorton</td>
									  <td>Admin</td>
									  <td>
										  <select id="select2">
											  <option value="none">승인대기</option>
											  <option value="none">승인완료</option>
											  <option value="none">시승완료</option>
											  <option value="none">시승취소</option>
										  </select>



									  </td>
									</tr>
									<tr>
									  <th scope="row">2</th>
									  <td>John Deo</td>
									  <td>Deo</td>
									  <td>@johndeo</td>
									  <td>User</td>
									  <td>USA</td>
									</tr>
									<tr>
									  <th scope="row">3</th>
									  <td>Randy Orton</td>
									  <td>the Bird</td>
									  <td>@twitter</td>
									  <td>admin</td>
									  <td>UK</td>
									</tr>
									<tr>
									  <th scope="row">4</th>
									  <td>Randy Mark</td>
									  <td>Ottandy</td>
									  <td>@mdothe</td>
									  <td>user</td>
									  <td>AUS</td>
									</tr>
									<tr>
									  <th scope="row">5</th>
									  <td>Ram Jacob</td>
									  <td>Thornton</td>
									  <td>@twitter</td>
									  <td>admin</td>
									  <td>IND</td>
									</tr>
								  </tbody>
								</table>
							  </div>
							</div>
						  						<!-- Post Pagination-->
						  </div>

						<nav class="rn-pagination">
							<ul>
								<li>
									<a href="#">
										<i class="fas fa-angle-left"></i>
									</a>
								</li>
								<li>
									<a class="rn-active" href="#">1</a>
								</li>
								<li>
									<a href="#">2</a>
								</li>
								<li>
									<a href="#">3</a>
								</li>
								<li>
									<a href="#">4</a>
								</li>
								<li>
									<a href="#">
										<i class="fas fa-angle-right"></i>
									</a>
								</li>
							</ul>
						</nav>
						  

		
					</div>
					<div id="side-bar">

						<!-- Sidebar-->
						<aside class="rn-widget-area rn-left-sidebar" id="secondary">
		
							<!-- Widget Item-->
							
							<div class="rn-widget">
								<div class="img bg-wrap text-center">
									<div class="user-logo">
										<div class="img" style="background-image: url(${contextPath}/resources/assets/images/dog.PNG);"></div>
										<h3>company name</h3>
									</div>
								</div>
							</div>
								
							<section class="rn-widget">
								<h2 class="rn-widget-title">Categories</h2>
								<div class="rn-widget-content">
									<ul>
										<li>
											<a href="dashboard">Dash board</a>
										</li>
										<li>
											<a href="schedule">Schedule</a>
										</li>
										<li>
											<a href="applicationlist">Application list</a>
										</li>
										<li>
											<a href="companyinfo">Company Info</a>
										</li>
									</ul>
								</div>
							</section>
							<!-- End Widget Item-->
						</aside>
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
		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>

	</body>
</html>