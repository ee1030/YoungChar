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

		<title>아이디 찾기</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
			
			
			#t3{
			margin-top: 30px;
				text-align: center;
			}
			
			
			[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 150px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;
}

#contentImg1:hover{
	cursor: pointer;
}

#t4{
	color: gray;
}
		
		</style>
		

	</head>
	<body class="rn-preloader">
<c:set var="address" value="${fn:split(loginMember.memberAddr, ',') }" />
		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
			<!-- End Header-->



		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">

					
						<div class="col-xl-8">
							<form class="card" action="mypageUpdate" name="findIdAction">
							  
							  <div class="card-body">
								<div class="row">
								  
								  <h2 style="text-align: center">아이디 찾기 결과</h2><br><br><br><hr>
								  
								  <div class="mb-3" id="resultId">
								  <h3 id="t3">회원님께서 가입하신 아이디</h3>
								  <h4 id="t4" style="text-align: center;">${memberId}</h4>
								  
									</div>
								  
								</div>
							  </div>
							  <div class="card-footer text-end">
								<a href="${contextPath}/member/login"><button class="right btn btn-success" type="button" id="findIdBtn">로그인 하기</button></a>
							  </div>
							</form>
						  </div>


		
					</div>
					<div id="side-bar">

						<!-- Sidebar-->
							<jsp:include page="sideMenu2.jsp"/>
						<!-- End Slidebar-->

					</div>
				</div>
		</div>
		
		
		

	
		<!-- End Page Content-->
		</section>
		<jsp:include page="../common/footer.jsp"/>
		
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
		
     	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>

	   
		
				

				


				
				
				
				
				
				
			</script>

	</body>
</html>