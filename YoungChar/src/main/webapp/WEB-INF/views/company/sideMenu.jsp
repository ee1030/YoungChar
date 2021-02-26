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

		<title>Side Menu</title>

		<!-- Preloader CSS-->
		<style>
			#side-bar{
				width: 300px;
			}

			.bg-wrap .user-logo .img {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				margin: 0 auto;
				margin-bottom: 10px; 
				border : 1px solid gray;
				}
			.bg-wrap .user-logo h3 {
				color: black;
				font-size: 18px; }

			.img {
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center center; 
			}	
		
		</style>
		

	</head>
	<body class="rn-preloader">

		
						<!-- Sidebar-->
						<aside class="rn-widget-area rn-left-sidebar" id="secondary">
		
							<!-- Widget Item-->
							
							<div class="rn-widget">
								<div class="img bg-wrap text-center">
									<div class="user-logo">
										<div class="img" style="background-image: url(${contextPath}${memberFile.memImgPath}/${memberFile.memImgName});"></div>
										<h3>${memberFile.categoryNm}&nbsp;${memberFile.cooName}</h3>
									</div>
								</div>
							</div>
							<br>
								
							<section class="rn-widget">
								<h2 class="rn-widget-title">Categories</h2>
								<div class="rn-widget-content">
									<ul>
										<li>
											<a href="dashboard">Dash board</a>
										</li>
										<li>
											<a href="#">Schedule</a>
										</li>
										<li>
											<a href="applicationlist">Application list</a>
										</li>
										<li>
											<a href="companyinfo">Company Info</a>
										</li>
										<li>
											<a href="#">Cars</a>
										</li>
									</ul>
								</div>
							</section>
							<!-- End Widget Item-->
				

						</aside>
						<!-- End Slidebar-->

	</body>
</html>