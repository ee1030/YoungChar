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
.rn-header {
	position: inherit !important;
	background-color: rgba(17, 46, 59, 0.7);
}

.card {
	background-color: #79cb4d1f !important;
	width: 1000px;
	margin-left: 100px;
	font-family: 'Noto Sans KR', sans-serif;
}

.rn-widget {
	margin-bottom: 40px;
	font-size: 20px;
	line-height: 60px;
}

.card-title {
	display: inline-block;
}

.search-page {
	margin-left: 50px;
	display: inline-block;
}

.search-page input {
	border-color: #3f901d !important;
}

.rn-pagination ul {
	margin-left: 120px !important;
	display: inline-block;
}

.btn-danger {
	display: inline-block;
}

.btn-success {
	display: inline-block;
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
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title">신규업체</h5>
								<div class="search-page">
									<form class="theme-form">
										<div class="input-group m-0">
											<input class="form-control-plaintext" type="search" placeholder="검색할 단어를 입력하세요"><span class="btn btn-success input-group-text">Search</span>
										</div>
									</form>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-lg text-center">
									<thead>
										<tr>
											<th scope="col"><input type="checkbox" id="checkAll" /></th>
											<th scope="col">업체번호</th>
											<th scope="col">업체이름</th>
											<th scope="col">전화번호</th>
											<th scope="col">주소</th>
											<th scope="col">신청일자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>갑돌모터스</td>
											<td>02-826-4578</td>
											<td>서울시 응애구 응애동 애기빌딩 10</td>
											<td>2021-03-02</td>
										</tr>
										
									

									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<!-- Cars Pagination-->
					<nav class="rn-pagination rn-pagination-center">
						<button class="btn btn-danger">승인</button>
						<button class="btn btn-success">거부</button>
						<ul>
							<li><a href="#"> <i class="fas fa-angle-left"></i>
							</a></li>
							<li><a class="rn-active" href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"> <i class="fas fa-angle-right"></i>
							</a></li>
						</ul>
					</nav>
					<!-- End Cars Pagination-->
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

	<script>
		$(document).ready(function() {
			$('#checkAll').click(function() {
				$('.chk').prop('checked', this.checked);
			});
		});
	</script>


</body>
</html>