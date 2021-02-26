<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Insert Review</title>
	<style>
			.card{
				font-family: 'Noto Sans KR', sans-serif;
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
			<h2><i class="fas fa-arrow-left"></i></h2>
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
										<h4>센터: OO지점 </h4>
									</div>
									<div class="col-sm-3">
										<h4>차명: 아이오닉 </h4>
									</div>
									<div class="col-sm-3">
										<select id="select1">
											<option value="5">★★★★★</option>
											<option value="4">★★★★☆</option>
											<option value="3">★★★☆☆</option>
											<option value="2">★★☆☆☆</option>
											<option value="1">★☆☆☆☆</option>
										</select>
									</div>
								  </div>
								</div>
								<hr>
								<!-- End InvoiceTop-->
								<div class="row">
								  <div class="col-md-12">
									<input type="text" class="form-control" id="title" name="boardTitle" size="70" placeholder="제목을 입력해주세요.">
								  </div>
								</div>
								<!-- End Invoice Mid-->
								<div>
								  <div class="table-responsive invoice-table" id="table">
								  </div>
								  <!-- End Table-->
								  <textarea class="form-control" id="summernote" name="boardContent"
								  rows="10" style="resize: none;"></textarea>

								</div>
								<!-- End InvoiceBot-->
							  </div>
							  <div class="col-sm-12 text-center mt-3">
								<button class="btn btn-success btn-lg" type="button">시승 후기 남기기</button>
							  </div>
							  <!-- End Invoice-->
							  <!-- End Invoice Holder-->
							  <!-- Container-fluid Ends-->
							</div>
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