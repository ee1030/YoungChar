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
	width: 1100px;
	margin-left: 0;
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
	margin-right: 200px !important;
	display: inline-block;
}

.btn-danger {
	display: inline-block;
}

.btn-success {
	display: inline-block;
}

.btn-area {
	float: left;
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
								<h5 class="card-title">전체 업체</h5>
								<div class="search-page">
									<form action="${contextPath}/admin/allCompanyManagement/searchName" method="post" class="theme-form">
										<div class="input-group m-0">
											<input class="form-control-plaintext" type="search" name="sv" placeholder="검색할 업체명을 입력하세요">
											<button class="btn btn-success input-group-text">검색</button>
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
											<th scope="col">업체명</th>
											<th scope="col">전화번호</th>
											<th scope="col">사업자번호</th>
											<th scope="col">신청일자</th>
											<th scope="col">브랜드</th>
											<th scope="col">승인여부</th>											
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty cList}">
												<tr>
													<td colspan="7">존재하는 업체가 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="allCompany" items="${cList}">
													<tr>
														<th><input type="checkbox" name="chkid" class="chk" value="${allCompany.memberNo}" /></th>
														<td scope="row">${allCompany.memberNo}</td>
														<td>${allCompany.cooName }</td>
														<td>${allCompany.phone }</td>
														<td>${allCompany.cooNumber }</td>
														<td>
															<%-- 날짜 출력 모양 지정 --%> 
															<fmt:formatDate var="signDate" value="${allCompany.signDt }" pattern="yyyy-MM-dd" /> 
															<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> 
															<c:choose>
																<c:when test="${signDate != now}">
																	${signDate }
																</c:when>
																<c:otherwise>
																	<fmt:formatDate value="${allCompany.signDt }" pattern="HH:mm" />
																</c:otherwise>
															</c:choose>
														</td>
														<td>${allCompany.brandCategory}</td>
														<c:choose>
															<c:when test="${allCompany.memberStatus == 'Y'}">
																<td style="color:red;">	
																	미승인
																</td>
															</c:when>
															<c:otherwise>
																<td style="color:blue;">	
																	승인
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>


									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>

			<div class="row">
				<div class="col-lg-2">
				</div>
				<div class="col-lg-10">
					<!-- Cars Pagination-->
					<nav class="rn-pagination rn-pagination-center">
						<div class="btn-area">
							<button class="btn btn-success" id="delete">선택 삭제</button>
							<button class="btn btn-danger" id="restore">선택 복구</button>
						</div>
						<ul>
						
							
							<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 5 }" integerOnly="true" />
							<fmt:parseNumber var="prev" value="${ c1 * 5 }" integerOnly="true" />
							<c:set var="prevPage" value="?cp=${prev}" />


							<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 4) / 5 }" integerOnly="true" />
							<fmt:parseNumber var="next" value="${ c2 * 5 + 1 }" integerOnly="true" />
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
										<li><a class="page-link" href="?cp=${page}<c:if test="${sv != null}">&sv=${sv}</c:if>">${page}</a></li>
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
	
	$("#approval").on("click", function(){
		var chkList = new Array();
		
		$("input[name='chkid']:checked").each(function(){
			chkList.push($(this).val());
		});
		
		if(confirm("선택한 업체의 활동을 승인하시겠습니까?")) {
			$.ajax({
				url : "${contextPath}/admin/allCompanyManagement/approval",
				type : "POST",
				dataType : "json",
				data : { "chkList" : chkList },	
				success : function(result) {
					if(result > 0) {
						swal({icon : "success", title : "승인 처리 완료"}).then(function() {
							location.reload();
						});
					}
					
				},
				error : function() {
					console.log("회원 승인 실패");
				}
				
			});
		}
	});
		
	$("#cancellation").on("click", function(){
		var chkList = new Array();
		
		$("input[name='chkid']:checked").each(function(){
			chkList.push($(this).val());
		});
		
		if(confirm("선택한 업체의 승인을 취소하시겠습니까?")) {
			$.ajax({
				url : "${contextPath}/admin/allCompanyManagement/cancellation",
				type : "POST",
				dataType : "json",
				data : { "chkList" : chkList },	
				success : function(result) {
					if(result > 0) {
						swal({icon : "success", title : "취소 처리 완료"}).then(function() {
							location.reload();
						});
					}
					
				},
				error : function() {
					console.log("승인 취소 실패");
				}
				
			});
		}
	});
	</script>


</body>
</html>