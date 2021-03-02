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

select {
  background:url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='50px' height='50px'><polyline points='46.139,15.518 25.166,36.49 4.193,15.519'/></svg>");
  background-color:#3498DB;
  background-repeat:no-repeat;
  background-position: right 10px top 15px;
  background-size: 16px 16px;
  color:white;
  padding:12px;
  width:auto;
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
											<th scope="col">제조사</th>
											<th scope="col">수정 / 삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>
										<tr>
											<th><input type="checkbox" name="chkid" class="chk" /></th>
											<th scope="row">123</th>
											<td>오나타</td>
											<td>횬다이</td>
											<td>
												<button class="btn btn-success btn-sm">수정</button>
												<button class="btn btn-danger btn-sm">삭제</button>
											</td>
										</tr>


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
						<button class="btn btn-success" data-toggle="modal" data-target="#exampleModal">차량 등록</button>
						<button class="btn btn-danger">차량 삭제</button>
						<ul>
							<li><a href="#"> <i class="fas fa-angle-left"></i>
							</a></li>
							<li><a class="rn-active" href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"> <i class="fas fa-angle-right"></i>
							</a></li>
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
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">차량 등록</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="form-signin" method="POST" action="#">
						<label for="carName">차량이름</label>
						<input type="text" class="form-control" id="carName" name="carName" placeholder="차량이름">
						<br>
						<label for="carModel">모델명</label>
						<input type="text" class="form-control" id="carModel" name="carModel" placeholder="모델명">
						<br>
						<label for="drivingSystem">구동방식</label>
						<input type="text" class="form-control" id="drivingSystem" name="drivingSystem" placeholder="구동방식">
						<br>
						<label for="personnel">탑승인원</label>
						<input type="text" class="form-control" id="personnel" name="personnel" placeholder="탑승인원">
						<br>
						<label for="carName">연비</label>
						<input type="text" class="form-control" id="consumpt" name="consumpt" placeholder="연비">
						<br>
						<label for="carName">최소가격</label>
						<input type="text" class="form-control" id="minPrice" name="minPrice" placeholder="최소가격">
						<br>
						<label for="carName">최대가격</label>
						<input type="text" class="form-control" id="maxPrice" name="maxPrice" placeholder="최대가격">
						<br>
						<label for="carName">연료</label>
						<input type="text" class="form-control" id="fuel" name="fuel" placeholder="연료">
						<br>
						<label for="carName">1회 충전 주행거리</label>
						<input type="text" class="form-control" id="mileAge" name="mileAge" placeholder="1회 충전 주행거리">
						<br>
						<label for="carName">에너지용량</label>
						<input type="text" class="form-control" id="capacity" name="capacity" placeholder="에너지용량">
						<br>
						<label for="carName">모터 최대출력</label>
						<input type="text" class="form-control" id="maxPower" name="maxPower" placeholder="모터 최대출력">
						<br>
						<label for="carName">모터 최대토크</label>
						<input type="text" class="form-control" id="maxTorque" name="maxTorque" placeholder="모터 최대토크">
						<br>
						<label for="carName">최고속도</label>
						<input type="text" class="form-control" id="maxSpeed" name="maxSpeed" placeholder="최고속도">
						<br>
						<label for="carName">가속성능</label>
						<input type="text" class="form-control" id="performance" name="performance" placeholder="가속성능">
						<br>
						<label for="categoryCode">브랜드</label> 
						<select id="categoryCode">
							<option selected="selected">테슬라</option>
							<option>현대</option>
							<option>기아</option>
							<option>혼다</option>
						</select> 
						<br>
						<label for="carName">이미지</label>
						<input type="file" class="form-control" id="carImg" name="carImg">
						<br>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-success">차량 등록</button>
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
	</script>


</body>
</html>