<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>뉴스 상세페이지</title>

<style>
#buttonsFam{
	margin-top: 50px;
}
#deleteBtn, #updateBtn {
	float: right;
}
#replyTextArea {
height:150px;}
.rn-post-item-footer .text-center {
	display:
}
</style>

<!--
		All CSS Codes Loaded
		Ex: bootstrap, fontawesome, style, etc.
		-->
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/fontawesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/linearicons/linearicons.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/rentnow-icons.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/style.css">

<!-- Google Map JS-->
</head>
<body>

	<!-- Header-->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- Page Title-->
	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1>News &amp; Updates</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Title-->

	<!-- Page Content-->
	<div class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 rn-post-list">

					<!-- Blog Post Item -->
					<article class="rn-post-item rn-post-size-lg">
						<div class="rn-post-item-header">
							
							<div class="rn-post-item-title-meta">
								<div class="rn-post-item-title-meta-inner">
									<div class="rn-post-item-meta">
									<span class="rn-post-item-author">${news.newsCreateDate}</span>
										<span class="rn-post-item-categories"> <a href="#">${news.press}</a>
										</span> <span class="rn-post-item-author">By <a href="#">${news.reporter}</a>
										</span>
									</div>
									<h3 class="rn-post-item-title">${news.newsTitle}</h3>
								</div>
							</div>
						</div>
						
						<!-- 이미지 부분 -->
				 <c:if test="${!empty newsList }">

					<div class="carousel slide m-3" id="carousel-325626">

						<div class="carousel-inner boardImgArea">
							<c:forEach var="at" items="${newsList}" varStatus="vs">
								<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}" />
								<div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
									<img class="d-block w-100 boardImg" src="${src}" /> <input type="hidden" value="${at.fileNo}">
								</div>
							</c:forEach>
						</div>

						 <a class="carousel-control-prev" href="#carousel-325626" data-slide="prev">
						<span class="carousel-control-prev-icon"></span> 
						<span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-325626" data-slide="next"> 
						<span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a> 
					</div>
				</c:if> 
						
						
						
						<div class="rn-post-item-body">
								<!-- Content -->
				<div id="newscontent">
				<%-- ${board.boardContent} --%>
				<%-- JSTL을 이용한 개행문자 처리 --%>
				<%-- <%%>는 원래 자바코드 --%>
				<%
					pageContext.setAttribute("newLine", "\n");
				%>
				${fn:replace(news.newsContent , newLine, "<br>") }
				<%-- el jstl은 컴파일시 자바코드로 변환  --%>
				</div>
						</div>
						<div class="rn-post-item-footer">

							<ul class="rn-post-love-n-view">
								<li>
									<button>
										<i class="fas fa-thumbs-up"></i>
									</button> <span>${news.best}</span>
								</li>
								<li>
									<button>
										<i class="fas fa-thumbs-down"></i>
									</button> <span>${news.worst}</span>
								</li>
								<li><span class="rn-post-view-icon"> <i class="far fa-eye"></i>
								</span> <span>${news.readCount}</span></li>
							</ul>
						</div>

					</article>
					
					<hr>
					
					<div class="text-center">
						<a class="btn btn-success float-right" href="javascript:history.back();">이전</a>

						<c:url var="updateUrl" value="${news.newsNo}/updateNews" />

						<!-- 로그인된 회원이 글 작성자인 경우 -->
						<c:if test="${(loginMember != null) }">
							<a href="${updateUrl}" id="updateBtn" class="btn btn-success ml-1 mr-1">수정</a>
							<form method="POST" action="${news.newsNo}/deleteNews" enctype="multipart/form-data" onsubmit="return validate();">
								<button id="deleteBtn" class="btn btn-success">삭제</button>
							</form>
						</c:if>
					</div>
					
				

					<!-- End Blog Post Item -->

				</div>
				


				<div class="col-lg-4">

					<!-- Sidebar-->
					<aside class="rn-widget-area" id="secondary">

						<!-- Widget Item-->
						<div class="rn-widget">
							<div class="rn-widget-content">
								<a href="#"> <img class="img-fluid" src="assets/images/banner.png" alt="banner" srcset="assets/images/banner.png 1x, assets/images/banner@2x.png 2x">
								</a>
							</div>
						</div>
						<!-- End Widget Item-->


						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">CATEGORI</h2>
							<div class="rn-widget-content">
								<ul>
									<li><a href="../news/newsMain"><b>NEWEST</b></a></li>
									<li><a href="../news/oldestNewsMain">OLDEST</a></li>
									<li><a href="../news/bestNewsMain">BEST</a></li>
									<li><a href="../news/worstNewsMain">WOSRT</a></li>
								</ul>
							</div>
						</section>
						<!-- End Widget Item-->


						<!-- Widget Item-->
						<section class="rn-widget">
							<h2 class="rn-widget-title">RECENT NEWS</h2>
							<div class="rn-widget-content">
								<ul class="rn-recent-posts">
								
								
								<c:if test="${!empty recentList }">
					<c:forEach var="news" items="${recentList}" varStatus="vs">
									<li id="recentPostsItem">
										<!-- Extra Small Post-->
										<div class="rn-recent-post-item">
											<div class="rn-recent-post-item-thumb">
												<c:forEach items="${thList}" var="th">
										<c:if test="${th.newsNo  == news.newsNo}">
											<a href="../news/${news.newsNo}"><img src="${contextPath}${th.filePath}/${th.fileName}" id="recentImage"></a>
										</c:if>
									</c:forEach>
												
											</div>
											<div class="rn-recent-post-item-info">
												<div class="rn-recent-post-item-meta">
													<span class="rn-recent-post-item-categories">${news.reporter}</a>
													</span> <span class="rn-recent-post-item-author">At 15 May, 2018
													</span>
												</div>
												<div class="rn-recent-post-item-title">
													<span class=""><a href="../news/${news.newsNo}">${news.newsTitle}</a></span>
												</div>
											</div>
										</div> <!-- End Extra Small Post-->

									</li>
									
									</c:forEach>
									</c:if>
								</ul>
							</div>
						</section>
						<!-- End Widget Item-->




					</aside>
					<!-- End Sidebar-->

				</div>
			</div>
		</div>
	

	</div>
	<!-- End Page Content-->
	
	



	<jsp:include page="../common/footer.jsp"/> 


	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
	
	<script>
		function validate() {
			return confirm("정말로 삭제하시겠습니까?");
		}
	</script>
</body>
</html>