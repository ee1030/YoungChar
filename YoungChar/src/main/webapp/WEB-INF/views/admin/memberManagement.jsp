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
	margin-left: 50px !important;
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
								<h5 class="card-title">회원관리</h5>
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
											<th scope="col">회원번호</th>
											<th scope="col">회원아이디</th>
											<th scope="col">이름</th>
											<th scope="col">회원등급</th>
											<th scope="col">가입일</th>
											<th scope="col">회원상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${mList}">
											<tr>
												<th><input type="checkbox" name="chkid" class="chk" /></th>
												<th scope="row">${member.memberNo }</th>
												<td>${member.memberId }</td>
												<td>${member.memberNm }</td>
												<td><c:choose>
														<c:when test="${member.memberGrade ==  'A'}">
															관리자
														</c:when>
														<c:when test="${member.memberGrade ==  'C'}">
															업체회원
														</c:when>
														<c:otherwise>
															일반회원
														</c:otherwise>
													</c:choose></td>
												<td>
													<%-- 날짜 출력 모양 지정 --%> 
													<fmt:formatDate var="signDate" value="${member.signDt }" pattern="yyyy-MM-dd" /> 
													<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> 
													<c:choose>
														<c:when test="${signDate != now}">
															${signDate }
														</c:when>
														<c:otherwise>
															<fmt:formatDate value="${member.signDt }" pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>
												<td><c:choose>
														<c:when test="${member.memberStatus == 'N' }">
															가입
														</c:when>
														<c:otherwise>
															탈퇴
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>

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
						<button class="btn btn-danger" id="secesseion">선택 탈퇴</button>
						<button class="btn btn-success" id="restore">선택 복구</button>
						<ul>
						
							
							<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
							<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
							<c:set var="prevPage" value="?cp=${prev}" />


							<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 4) / 10 }" integerOnly="true" />
							<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
							<c:set var="nextPage" value="?cp=${next}" />
							
							<c:if test="${pInfo.currentPage > pInfo.pageSize}">
								<li>
									<!-- 이전 페이지로 이동 (<) --> 
									<a  href="${prevPage}">	<i class="fas fa-angle-left"></i></a>
								</li>
							</c:if>
							
							<!-- 페이지 목록 -->
							<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}">
								<c:choose>
									<c:when test="${pInfo.currentPage == page }">
										<li><a class="page-link rn-active">${page}</a></li>
									</c:when>

									<c:otherwise>
										<li><a class="page-link" href="?cp=${page}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
									
							<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
							<c:if test="${next <= pInfo.maxPage}">
								<li>
									<!-- 다음 페이지로 이동 (>) --> 
									<a  href="${nextPage}"><i class="fas fa-angle-right"></i></a>
								</li>
							</c:if>
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
		
		
		
		$("#secession").on("click", function({
			var chkList = new Array();
			
			$("checkbox[name=chkid]:checked").each(function(){
				chkList.push($(this).prev());
			});
			
			console.log(chkList);
		});
		
	</script>


</body>
</html>