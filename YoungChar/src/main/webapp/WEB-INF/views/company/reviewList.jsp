<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Drive Review</title>

	<!-- Preloader CSS-->
	<style>
		.card{
			font-family: 'Noto Sans KR', sans-serif;
			}
	

		#head {
			display: inline-block;
			font-size: 21px;
			font-weight: bold;
		}

		#search-form{
			width: 500px;
			margin:0 auto;
		}

		#search-bar{
			width: 300px !important;
		}
		
		.td{
			width: 10%;
		}
		
		.icofont-ui-rating{
    color: #f8d62b;
		}
		
		.pagination {
		    width: 400px !important;
 			  margin-left: auto !important;
        margin-right: auto !important;
		}
		



		
	</style>

</head>

<body class="rn-preloader">


	<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
	<!-- End Header-->

		<!-- Page Title-->
		<div class="rn-page-title">
			<div class="rn-pt-overlayer"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="rn-page-title-inner">
							<h1>D R I V E &nbsp; R E V I E W</h1>
							<p>지금 생생한 후기들을 확인해보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title-->

		<br>

	<!-- Page Content-->
	<section class="rn-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">

					<div class="card">
						<div class="card-header">
							<h2>R E V I E W</h2>
								<div id="search-form" class="theme-form">
									<div class="d-block">
										<label for="chk-ani1">
											<input class="checkbox_animated" id="chk-ani1" type="checkbox">Option 1
										</label>
										<label for="chk-ani2">
											<input class="checkbox_animated" id="chk-ani2" type="checkbox">Option 2
										</label>
										<label for="chk-ani3">
											<input class="checkbox_animated" id="chk-ani3" type="checkbox">Option 3
										</label>
										<label for="chk-ani4">
											<input class="checkbox_animated" id="chk-ani4" type="checkbox">Option 4
										</label>
									</div>
									<br>
									<div class="input-group m-0">
													<select name="sk" class="form-control" style="width: 100px; display: inline-block;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="titcont">제목+내용</option>
				</select> 
										<input id="search-bar" class="form-control-plaintext" type="search" placeholder="검색어를 입력해주세요.">
										<span class="btn btn-success input-group-text">Search</span>
									</div>
									</div>


						</div>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="td" scope="col">No</th>
										<th class="td" scope="col">별점</th>
										<th class="td" scope="col">브랜드</th>
										<th class="td" scope="col">대리점</th>
										<th colspan="3" scope="col">제목</th>
										<th class="td" scope="col">글쓴이</th>
										<th class="td" scope="col">작성일시</th>
										<th class="td" scope="col">댓글</th>
										<th class="td" scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="td">1</td>
										<td class="td"><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i></td>
										<td class="td">테슬라</td>
										<td class="td">대리점</td>
										<td colspan="3">글제목입니다.</td>
										<td class="td">김영차</td>
										<td class="td">21-02-02</td>
										<td class="td">10</td>
										<td class="td">20</td>
									</tr>
									<tr>
										<td class="td">1</td>
										<td class="td"><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i></td>
										<td class="td">테슬라</td>
										<td class="td">대리점</td>
										<td colspan="3">글제목입니다.</td>
										<td class="td">김영차</td>
										<td class="td">21-02-02</td>
										<td class="td">10</td>
										<td class="td">20</td>
									</tr>
									<tr>
										<td class="td">1</td>
										<td class="td"><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i></td>
										<td class="td">테슬라</td>
										<td class="td">대리점</td>
										<td colspan="3">글제목입니다.</td>
										<td class="td">김영차</td>
										<td class="td">21-02-02</td>
										<td class="td">10</td>
										<td class="td">20</td>
									</tr>
									<tr>
										<td class="td">1</td>
										<td class="td"><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i><i class="icofont icofont-ui-rating"></i></td>
										<td class="td">테슬라</td>
										<td class="td">대리점</td>
										<td colspan="3">글제목입니다.</td>
										<td class="td">김영차</td>
										<td class="td">21-02-02</td>
										<td class="td">10</td>
										<td class="td">20</td>
									</tr>
									<tr>
										<td class="td">1</td>
										<td class="td"><i class="icofont icofont-ui-rating"></i></td>
										<td class="td">테슬라</td>
										<td class="td">대리점</td>
										<td colspan="3">글제목입니다.</td>
										<td class="td">김영차</td>
										<td class="td">21-02-02</td>
										<td class="td">10</td>
										<td class="td">20</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>



				<!-- Post Pagination-->
							<nav class="rn-pagination">
										<ul class="pagination pagination-light">
	                    <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
	                    <li class="page-item"><a class="page-link" href="#">1</a></li>
	                    <li class="page-item"><a class="page-link" href="#">2 <span class="sr-only">(current)</span></a></li>
	                    <li class="page-item"><a class="page-link" href="#">3</a></li>
	                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
	                  </ul>
							</nav>

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

</body>

</html>