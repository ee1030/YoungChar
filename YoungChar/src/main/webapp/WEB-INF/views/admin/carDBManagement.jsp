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
.modal-content {
	position: fixed;
	left: 50%;
	top: 50%;
	margin-left: -550px;
}

.modal-input {
	margin: 0;
	padding 0;
	width: 100%;
}
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

select {
  background:url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='50px' height='50px'><polyline points='46.139,15.518 25.166,36.49 4.193,15.519'/></svg>");
  background-color:#3498DB;
  background-repeat:no-repeat;
  background-position: right 10px top 15px;
  background-size: 16px 16px;
  color:white;
  padding:12px;
  width: 250px !important;
  font-family:arial,tahoma;
  font-size:16px;
  font-weight:bold;
  color:#fff;
  text-align:center;
  text-shadow:0 -1px 0 rgba(0, 0, 0, 0.25);
  border-radius:3px;
  -webkit-border-radius:3px;
  -webkit-appearance: none;
  border:0;
  outline:0;
  -webkit-transition:0.3s ease all;
	   -moz-transition:0.3s ease all;
	    -ms-transition:0.3s ease all;
	     -o-transition:0.3s ease all;
	        transition:0.3s ease all;
}


#categoryCode {
  background-color:#2ECC71;
}

#categoryCode:hover {
  background-color:#27AE60;
}

select:focus, select:active {
  border:0;
  outline:0;
}

.btn-area {
	display: inline-block;
	position: absolute;
  right: 750px;
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
								<h5 class="card-title">차량 DB 관리</h5>
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
											<th scope="col">차량 번호</th>
											<th scope="col">차량 이름</th>
											<th scope="col">차량 모델</th>
											<th scope="col">제조사</th>
											<th scope="col">수정 / 삭제</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${empty carList}">
											<tr>
												<td colspan="7">존재하는 차량이 없습니다.</td>
											</tr>
										</c:when>
											
										<c:otherwise>
											<c:forEach var="car" items="${carList}">
											<tbody>
												<tr> 
													<th><input type="checkbox" name="chkid" class="chk" value="${car.carNo }"/></th>
													<th scope="row">${car.carNo}</th>
													<td>${car.carName }</td>
													<td>${car.carModel }</td>
													<td>${car.categoryName }</td>
													<td>
														<button class="btn btn-success btn-sm" id="modify">수정</button>
														<button class="btn btn-danger btn-sm" id="delete">삭제</button>
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
							<button class="btn btn-success" data-toggle="modal" data-target="#exampleModal">차량 등록</button>
							<button class="btn btn-danger" id="selectedDel">선택 삭제</button>
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 1100px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">차량 등록</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="insert" class="form-signin" method="POST" action="${contextPath}/admin/carDBManagement/insertCar" enctype="multipart/form-data">
						<div class="modal-input">
							<div style="display:inline-block; width:250px;">
								<label for="carName">차량이름</label>
								<input type="text" class="form-control" id="carName" name="carName" placeholder="차량이름">
							</div>
								
							<div style="display:inline-block; width:250px;">
								<label for="carModel">모델명</label>
								<input type="text" class="form-control" id="carModel" name="carModel" placeholder="모델명">
							</div>
								
							<div style="display:inline-block; width:250px;">
								<label for="drivingSystem">구동방식</label>
								<input type="text" class="form-control" id="drivingSystem" name="drivingSystem" placeholder="구동방식">
							</div>
						
							<div style="display:inline-block; width:250px;">
								<label for="personnel">탑승인원</label>
								<input type="text" class="form-control" id="personnel" name="personnel" placeholder="탑승인원">
							</div>
					
						</div>
						<br>
						<div class="modal-input">
							<div style="display:inline-block; width:250px;">
								<label for="carName">연비</label>
								<input type="text" class="form-control" id="consumpt" name="consumpt" placeholder="연비">
							</div>
							<div style="display:inline-block; width:250px;">
								<label for="carName">최소가격</label>
								<input type="text" class="form-control" id="minPrice" name="minPrice" placeholder="최소가격">
							</div>
							<div style="display:inline-block; width:250px;">
								<label for="carName">최대가격</label>
								<input type="text" class="form-control" id="maxPrice" name="maxPrice" placeholder="최대가격">
							</div>	
							<div style="display:inline-block; width:250px;">
								<label for="carName">연료</label>
								<input type="text" class="form-control" id="fuel" name="fuel" placeholder="연료">
							</div>
						</div>
						<br>
						<div class="modal-input">
							<div style="display:inline-block; width:250px;">
								<label for="carName">1회 충전 주행거리</label>
								<input type="text" class="form-control" id="mileAge" name="mileAge" placeholder="1회 충전 주행거리">
							</div>
							<div style="display:inline-block; width:250px;">
								<label for="carName">에너지용량</label>
								<input type="text" class="form-control" id="capacity" name="capacity" placeholder="에너지용량">
							</div>
							<div style="display:inline-block; width:250px;">
								<label for="carName">모터 최대출력</label>
								<input type="text" class="form-control" id="maxPower" name="maxPower" placeholder="모터 최대출력">
							</div>
							<div style="display:inline-block; width:250px;">
								<label for="carName">모터 최대토크</label>
								<input type="text" class="form-control" id="maxTorque" name="maxTorque" placeholder="모터 최대토크">
							</div>
						</div>
						<br>
						<div class="modal-input">
							<div style="display:inline-block; width:250px;">
								<label for="carName">최고속도</label>
								<input type="text" class="form-control" id="maxSpeed" name="maxSpeed" placeholder="최고속도">
							</div>
							<div style="display:inline-block; width:250px;">	
								<label for="carName">가속성능</label>
								<input type="text" class="form-control" id="performance" name="performance" placeholder="가속성능">
							</div>
							<div style="display:inline-block; width:250px;">
								<label for="categoryCode">브랜드</label> 
								<select id="categoryCode" name="categoryCode">
									<c:forEach var="brand" items="${brandList}" >
										<option value="${brand.CATEGORY_CD}">${brand.CATEGORY_NM}</option>
									</c:forEach>
								</select> 
							</div>
							<div style="display:inline-block; width:250px;">					
								<label for="carName">이미지</label>
								<input type="file" class="form-control" id="carImg" name="carImg[]" multiple="multiple">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					<button type="submit" form="insert" class="btn btn-success">차량 등록</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#checkAll').click(function() {
				$('.chk').prop('checked', this.checked);
			});
		});
		
		$("#selectedDel").on("click", function(){
			var chkList = new Array();
			
			$("input[name='chkid']:checked").each(function(){
				chkList.push($(this).val());
			});
			
			console.log(chkList);
			
			if(confirm("선택한 차량을 삭제 하시겠습니까?")) {
				$.ajax({
					url : "${contextPath}/admin/carDBManagement/selectDelete",
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
	</script>


</body>
</html>