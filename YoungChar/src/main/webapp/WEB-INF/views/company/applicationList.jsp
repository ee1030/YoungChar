<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Application list</title>

		<!-- Preloader CSS-->
		<style>
			.card{
				font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: #112E3B;
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

			.pagination {
	 			  display: inherit !important;
	 			  text-align: center;
			}
			


			#select1{
				width: 160px;
			}
			
			.dropdown-basic {
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
			
			.dropdown-content{
				top: 30px !important;
				cursor: pointer;
			}
			
		</style>


	</head>
	<body class="rn-preloader">

		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
		<!-- End Header-->

		<!-- Page Content-->
		
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">

						
						<div class="col-sm-12">
							<div class="card">
							  <div class="card-header">
								<div id="head">시승 신청 내역</div>
                  <div class="dropdown-basic">
                    <div class="dropdown">
                      <button id="select1" class="btn btn-light" type="button">선택<span><i class="icofont icofont-arrow-down"></i></span></button>
	                      <div class="dropdown-content">
		                      <a id="all" class="select-status">전체</a>
		                      <a id="n" class="select-status">승인대기</a>
		                      <a id="a" class="select-status">승인완료</a>
		                      <a id="c" class="select-status">시승취소</a>
		                      <a id="y" class="select-status">시승완료</a>
	                      </div>
                    </div>
                  </div>
							 </div>
							  <div class="table-responsive">
								<table class="table table-hover">
								  <thead>
									<tr>
									  <th scope="col">No</th>
									  <th scope="col">이름</th>
									  <th scope="col">전화번호</th>
									  <th scope="col">차량</th>
									  <th scope="col">예약일시</th>
									  <th scope="col">예약상태</th>
									  <th scope="col">예약처리</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
										<c:if test="${empty list}">
											<tr>
												<td colspan="7">시승 신청건이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty list}">
											<c:forEach var="apl" items="${list}" varStatus="vs">
											<tr>
												<td>${apl.rsrvtNo}</td>
												<td>${apl.memNm}</td>
									  		<td>${apl.memPhone}</td>
									  		<td>${apl.carName}</td>
												<fmt:formatDate var="testDriveDt" value="${apl.testDriveDt}" pattern="HH:mm"/>
									  		<td>${testDriveDt}</td>
									  		<td id="statusBox">
									  			<c:choose>
									  				<c:when test="${apl.approvalStatus == 'N'}">
									  					<span class="badge badge-primary">승인대기</span>
									  				</c:when>
									  				<c:when test="${apl.approvalStatus == 'A'}">
															<span class="badge badge-warning text-dark">승인완료</span>
									  				</c:when>
									  				<c:when test="${apl.approvalStatus == 'C'}">
									  					<span class="badge badge-danger">시승취소</span>
									  				</c:when>
									  				<c:when test="${apl.approvalStatus == 'Y'}">
									  					<span class="badge badge-success">시승완료</span>
									  				</c:when>
									  			</c:choose>
									  		</td>
												<td>
										  		<select class="select" id="select2">
														<option value="none">--선택--</option>
													  <option value="N">승인대기</option>
													  <option value="A">승인완료</option>
													  <option value="Y">시승완료</option>
													  <option value="C">시승취소</option>
										  		</select>
										  	</td>
											</tr>
										</c:forEach>
										</c:if>
								  </tbody>
								</table>
							  </div>
							</div>
						  </div>

						<!-- Post Pagination-->
									<nav class="rn-pagination">
												<ul class="pagination pagination-light">
												
												<c:set var="firstPage" value="?cp=1"/>
												<c:set var="lastPage" value="?cp=${pInfo.maxPage}"/>
												
												
												<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 5 }"  integerOnly="true" />
												<fmt:parseNumber var="prev" value="${ c1 * 5 }"  integerOnly="true" />
												<c:set var="prevPage" value="?cp=${prev}" />
							
												<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 4) / 5 }" integerOnly="true" />
												<fmt:parseNumber var="next" value="${ c2 * 5 + 1 }" integerOnly="true" />
												<c:set var="nextPage" value="?cp=${next}" />
													
													
												<c:if test="${pInfo.currentPage > pInfo.pageSize}">
												<li class="page-item"> <!-- 첫 페이지로 이동(<<) -->
													<a class="page-link" href="${firstPage}">&lt;&lt;</a>
												</li>
												
												<li class="page-item"> <!-- 이전 페이지로 이동 (<) -->
													<a class="page-link" href="${prevPage}">&lt;</a>
												</li>
												</c:if>	
													
												
												<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
													<c:choose>
														<c:when test="${pInfo.currentPage == page }">
															<li class="page-item disabled">
																<a class="page-link">${page}</a>
															</li>
														</c:when>
													
														<c:otherwise>
															<li  class="page-item">	
																<a class="page-link" href="?cp=${page}">${page}</a>
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												
												<c:if test="${next <= pInfo.maxPage}">
													<li class="page-item"> <!-- 다음 페이지로 이동 (>) -->
														<a class="page-link" href="${nextPage}">&gt;</a>
													</li>
													
													<li class="page-item"> <!-- 마지막 페이지로 이동(>>) -->
														<a class="page-link" href="${lastPage}">&gt;&gt;</a>
													</li>
												</c:if>
											</ul>
									</nav>
						  

		
					</div>
					<div id="side-bar">

						<!-- Sidebar-->
						<jsp:include page="sideMenu.jsp"/>
						<!-- End Slidebar-->

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

		<script>
		
		
		$(document).ready(function(){
			
			$(".select").on("change", function(e){
		
				var rsrvtNo = $(this).parent().parent().children().eq(0).text();
				var approvalStatus =  this.value;
				var statusBox = $(this).parent().parent().children().eq(5);
				
				var N = $("<span>").addClass("badge badge-primary").text("승인대기");
				var A = $("<span>").addClass("badge badge-warning text-dark").text("승인완료");
				var C = $("<span>").addClass("badge badge-danger").text("시승취소");
				var Y = $("<span>").addClass("badge badge-success").text("시승완료");
				
				$.ajax({
					url : "${contextPath}/company/updateAplStatus",
					data: {"rsrvtNo" : rsrvtNo,
						     "approvalStatus" : approvalStatus},
					type: "post",
					success : function(result){
						if(result > 0){
							
						statusBox.html("");
							
					    switch (approvalStatus){
					      case "N" :
					          statusBox.append(N);
					          break;
					      case "A" :
					          statusBox.append(A);
					          break;
					      case "Y" :
					          statusBox.append(Y);
					          break;
					      case "C" :
					          statusBox.append(C);
				            break;
					    }
					    $(e.target).children("option").eq(0).prop("selected", true);
							
						}
					}, error : function(){
						console.log("에이젝스 연결실패")
					}
					
				});
				
			})
			
			
				$(".select-status").on("click", function(e){
					
					var URL = $(this).attr('id');
					
					location.href = URL;
				})
			
		});
		
		</script>

	</body>
</html>