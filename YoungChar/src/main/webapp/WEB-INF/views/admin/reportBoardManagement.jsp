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
	position: absolute;
	display: inline-block;
}

.btn-danger {
	display: inline-block;
}

.btn-success {
	display: inline-block;
}

.btn-area {
	display: inline-block;
	position: absolute;
  right: 750px;
}

tbody td:hover{
	cursor: pointer;
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
								<h5 class="card-title">신고 게시글 관리</h5>
								<div class="search-page">
									<form action="${contextPath}/admin/reportBoardManagement/searchTitle" method="post" class="theme-form">
										<div class="input-group m-0">
											<input class="form-control-plaintext" type="search" name="sv" placeholder="검색할 작성자를 입력하세요">
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
											<th scope="col">글 번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성시간</th>
											<th scope="col">신고수</th>
											<th scope="col">삭제여부</th>											
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty bList}">
											<tr>
												<td colspan="7">존재하는 게시글이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="board" items="${bList}">
												<input type="hidden" id="categoryCd" value="${board.boardCode}">
												<tr>
													<th><input type="checkbox" name="chkid" class="chk" value="${board.boardNo}" /></th>
													<td scope="row">${board.boardNo}</td>
													<td>
														<%-- 제목의 길이가 15글자를 넘어가는 경우 --%>
														<c:set var="title" value="${board.boardTitle}"/>
														<c:if test="${fn:length(title) > 15 }">
															<c:set var="title" value="${fn:substring(title,0,15) }..."/>
														</c:if>
														${title}
													</td>
													<td>${board.memberId }</td>
													<td>
														<%-- 날짜 출력 모양 지정 --%> 
														<fmt:formatDate var="createDate" value="${board.boardCreateDate }" pattern="yyyy-MM-dd" /> 
														<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> 
														<c:choose>
															<c:when test="${createDate != now}">
																${createDate }
															</c:when>
															<c:otherwise>
																<fmt:formatDate value="${board.boardCreateDate }" pattern="HH:mm" />
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														${board.reportCount}
													</td>
													<td>
														<c:choose>
															<c:when test="${board.boardStatus == 'N'}">
																삭제됨
															</c:when>
															<c:when test="${board.boardStatus == 'B'}">
																블라인드
															</c:when>
															<c:otherwise>
																게시중
															</c:otherwise>
														</c:choose>
													</td>
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
							<button class="btn btn-danger" id="delete">선택 삭제</button>
							<button class="btn btn-success" id="restore">선택 복구</button>
						</div>
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
		$(".table td").on("click", function() {
			var boardNo = $(this).parent().children().eq(1).text();
			var categoryCode = $("#categoryCd").val();

			var boardViewURL = null;
			
			switch(categoryCode) {
			case '1' : boardViewURL = "${contextPath}/board/1/" + boardNo + "?adm=1"; break;
			case '2' : boardViewURL = "${contextPath}/board/2/" + boardNo + "?adm=1"; break;
			case '3' : boardViewURL = "${contextPath}/board/3/" + boardNo + "?adm=1"; break;
			case '4' : boardViewURL = "${contextPath}/driveReview/review/" + boardNo + "?adm=1"; break;
			}
			
			location.href = boardViewURL;
		});
	
		$(document).ready(function() {
			$('#checkAll').click(function() {
				$('.chk').prop('checked', this.checked);
			});
		});
		
		$("#delete").on("click", function(){
			var chkList = new Array();
			
			$("input[name='chkid']:checked").each(function(){
				chkList.push($(this).val());
			});
			
			if(confirm("선택한 게시글을 삭제 하시겠습니까?")) {
				$.ajax({
					url : "${contextPath}/admin/boardManagement/delete",
					type : "POST",
					dataType : "json",
					data : { "chkList" : chkList },	
					success : function(result) {
						if(result > 0) {
							swal({icon : "success", title : "삭제 완료"}).then(function() {
								location.reload();
							});
						}
						
					},
					error : function() {
						console.log("삭제 실패");
					}
					
				});
			}
		});
		
		$("#restore").on("click", function(){
			var chkList = new Array();
			
			$("input[name='chkid']:checked").each(function(){
				chkList.push($(this).val());
			});
			
			if(confirm("선택한 게시글을 복구하시겠습니까?")) {
				$.ajax({
					url : "${contextPath}/admin/boardManagement/restore",
					type : "POST",
					dataType : "json",
					data : { "chkList" : chkList },	
					success : function(result) {
						if(result > 0) {
							swal({icon : "success", title : "복구 완료"}).then(function() {
								location.reload();
							});
						}
						
					},
					error : function() {
						console.log("복구 실패");
					}
					
				});
			}
		});
	</script>


</body>
</html>