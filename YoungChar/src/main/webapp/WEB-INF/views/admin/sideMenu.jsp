<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#side-bar {
	width: 300px;
}

.bg-wrap .user-logo .img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: 0 auto;
	margin-bottom: 10px;
}

.bg-wrap .user-logo h3 {
	color: black;
	font-size: 18px;
}

.img {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

/* 서브메뉴(ul) 스타일 지정 */
#main-menu>li>ul {
	/* 서브메뉴를 투명하게 */
	/* opacity: 0; */
	display : none;
}

/* 서브메뉴에 있는 a태그 숨기기 */
#main-menu ul>li>a {
	display : none;
	/* opacity: 0; */
	/* opacity: (투명)0 ~ 1(불투명)  */
}

/* 서브메뉴 숨기기 */
#main-menu ul>li {
	height: 0;
	line-height: 0;
}

#main-menu>li:hover ul, #main-menu>li:hover ul a {
	/* 마우스가 올라간 메인메뉴의 후손 중
                                    ul 태그가 있고 그 ul의 후손중 a태그를 선택 */
	/* opacity: 1; */
	display : inline-block;
}

#main-menu li:hover ul li {
	/* 서브메뉴의 영역 크기를 지정하여 눈에 보이게 하기 */
	height: 40px;
	line-height: 40px;
}

/* 서브메뉴 슬라이드 효과 */
#main-menu li {
	transition-duration: 0.2s;
}

/* 서브메뉴 배경 fade in-out 효과 */
#main-menu li ul {
	transition-duration: 0.2s;
}
</style>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/style2.css">

</head>
<body class="rn-preloader">


	<!-- Sidebar-->
	<aside class="rn-widget-area rn-left-sidebar" id="secondary">

		<!-- Widget Item-->

		<div class="rn-widget">
			<div class="img bg-wrap text-center">
				<div class="user-logo">
					<div class="img" style="background-image: url(${contextPath}/resources/assets/images/adminImg.png);"></div>
					<h3>관리자</h3>
				</div>
			</div>
		</div>

		<section class="rn-widget">
			<h2 class="rn-widget-title">Categories</h2>
			<div class="rn-widget-content">
				<ul id="main-menu">
					<li><a href="dashboard">대시보드</a></li>
					<li><a href="">회원 관리</a>
						<ul>
							<li><a href="${contextPath}/admin/memberManagement">일반회원 관리</a></li>
							<li><a href="${contextPath}/admin/newCompanyManagement">신규 업체 승인</a></li>
							<li><a href="${contextPath}/admin/allCompanyManagement">기존 업체 관리</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/admin/allBoardManagement">게시판 관리</a>
						<ul>
							<li><a href="${contextPath}/admin/reviewBoardManagement">리뷰 게시판</a></li>
							<li><a href="${contextPath}/admin/infoBoardManagement">정보 게시판</a></li>
							<li><a href="${contextPath}/admin/freeBoardManagement">잡담 게시판</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/admin/replyManagement">댓글 관리</a></li>
					<li><a href="#">신고관리</a>
						<ul>
							<li><a href="${contextPath}/admin/reportBoardManagement">신고 게시글</a></li>
							<li><a href="${contextPath}/admin/reportReplyManagement">신고 댓글</a></li>
						</ul>
					</li>
					<li><a href="${contextPath}/admin/carDBManagement">DB 관리</a></li>
				</ul>
			</div>
		</section>
		<!-- End Widget Item-->


	</aside>
	<!-- End Slidebar-->

</body>
</html>