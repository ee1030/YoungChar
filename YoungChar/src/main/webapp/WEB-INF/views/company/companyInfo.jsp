<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Company Info</title>

		<!-- Preloader CSS-->
		<style>
				.card{
				font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: rgb(85, 85, 85);
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

			.left{
				float: left;
			}

			.right{
				float: right;
			}
		
		</style>
		

	</head>
	<body class="rn-preloader">

		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
			<!-- End Header-->


		<c:set var="phone" value="${fn:split(loginMember.memberPhone , '-' ) }"/>
		<c:set var="address" value="${fn:split(loginMember.memberAddress , ',' ) }"/>

		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">

					
						<div class="col-xl-8">
							<form class="card">
							  <div class="card-header">
									<div class="img bg-wrap text-center">
										<div class="user-logo">
											<div class="img" style="background-image: url(${contextPath}${memberFile.memImgPath}/${memberFile.memImgName});"></div>
											<h4 class="card-title mb-0">${memberFile.categoryNm}&nbsp;${memberFile.cooName}</h4>
											<h6 class="card-title mb-0">110-80-11111</h6>
										</div>
									</div>
								<div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
							  </div>
							  <div class="card-body">
								<div class="row">
								  <div class="col-md-12">
									<div class="mb-3">
									  <label class="form-label">현재 비밀번호</label>
									  <input class="form-control" type="text" placeholder="정보 수정을 위해 현재 비밀번호를 입력해주세요.">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">새 비밀번호</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">새 비밀번호 확인</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">전화번호 *</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">이메일 *</label>
									  <input class="form-control" type="text" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-4">
									<div class="mb-3">
									  <label class="form-label">주소</label>
									  <input class="form-control" type="text" placeholder="우편번호">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-2">
									<div class="mb-3">
									  <label class="form-label">&nbsp;</label>
									  <button class="form-control btn btn-outline-success" type="submit">검색</button>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input class="form-control" type="text" placeholder="도로명주소">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input class="form-control" type="text" placeholder="상세주소">
									</div>
								  </div>
								</div>
							  </div>
							  <div class="card-footer text-end">
								<button class="left btn btn-light" type="button">계정 탈퇴</button>
								<button class="right btn btn-success" type="submit">정보 수정</button>
							  </div>
							</form>
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
		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>

	</body>
</html>