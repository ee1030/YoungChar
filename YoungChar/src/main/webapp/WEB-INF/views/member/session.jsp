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

		<title>회원 탈퇴</title>

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
			
			.form-label{
				font-weight: bold;
			}
			
			.btn{
				height: 40px;
			}
			
			.fa-asterisk{
				color: red;
				font-size: 8px;
				margin-right: 5px;
			}
			
			#text1{
				text-align: center;
			}
			
			#secession{
				width: 80%;
				height: 40px;
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

					
						<div class="col-xl-8">
							<form class="card" method="POST" action="updateAction" name="updateAction" onsubmit="return updateValidate();">
							  <div class="card-header">
									<div class="img bg-wrap text-center">
										<div class="user-logo">
											<div class="img" style="background-image: url(${contextPath}${company.memImgPath}/${company.memImgName});"></div>
											<h4 class="card-title mb-0">${company.categoryNm}&nbsp;${company.cooName}</h4>
											<h6 class="card-title mb-0">${company.memId}</h6>
										</div>
									</div>
								<div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
							  </div>
							  <div class="card-body">
								<div class="row">
								  <div class="col-md-12">
									<div class="mb-3">
									  <i class="fas fa-asterisk"></i><label class="form-label"> 현재 비밀번호</label>
									  <input id="memberPwd" name="memberPwd" class="form-control" type="password" placeholder="정보 수정을 위해 현재 비밀번호를 입력해주세요." required>
									</div>
									
									<div class="mb-3" id="text1">
										<button class="left btn btn-light" type="button" id="secession">계정 탈퇴</button>
									</div>
								  </div>

								</div>
							  </div>
							  <div class="card-footer text-end" id="text1">
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
		<jsp:include page="../common/footer.jsp"/>
		
	<script>
	

		</script>

	</body>
</html>