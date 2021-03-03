<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		.white-star{
    color: #b5b5b5;
		}
		
		.pagination {
 			  display: inherit !important;
 			  text-align: center;
		}
		

		#list-table td:hover {
			cursor: pointer;
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
							<table id="list-table" class="table table-hover">
								<thead>
									<tr>
										<th class="td" scope="col">No</th>
										<th class="td" scope="col">별점</th>
										<th class="td" scope="col">브랜드</th>
										<th class="td" scope="col">센터</th>
										<th colspan="3" scope="col">제목</th>
										<th class="td" scope="col">글쓴이</th>
										<th class="td" scope="col">작성일시</th>
										<th class="td" scope="col">댓글</th>
										<th class="td" scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty bList }">
										<tr>
											<td colspan="9">존재하는 게시글이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty bList }">
										<c:forEach var="board" items="${bList}" varStatus="vs">
											<tr>
												<td class="td">${board.boardNo}</td>
												<td class="td">
													<c:forEach begin="1" end="${board.csat}">
														<i class="icofont icofont-ui-rating"></i>
													</c:forEach>
													<c:forEach begin="1" end="${5 - board.csat}">
														<i class="icofont icofont-ui-rating white-star"></i>
													</c:forEach>
												</td>
												<td class="td">${board.categoryNm}</td>
												<td class="td">${board.cooName}</td>
												<td colspan="3">${board.boardTitle}</td>
												<td class="td">${board.memNickname}</td>
												<td class="td">
													<fmt:formatDate var="createDate" value="${board.boardCreateDt }" pattern="yyyy-MM-dd"/>
													<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/> 
													<c:choose>
														<c:when test="${createDate != now}">
															${createDate }
														</c:when>
														<c:otherwise>
															<fmt:formatDate value="${board.boardCreateDt }" pattern="HH:mm"/>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="td">${board.replyCount}</td>
												<td class="td">${board.readCount}</td>								
												<td style="visibility:hidden;position:absolute;" class="td">${board.carName}</td>								
												<td style="visibility:hidden;position:absolute;" class="td">${board.csat}</td>								
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
		</div>
		<!-- End Page Content-->
	</section>
	
	<!-- Site Footer-->
	
	<!-- End Site Footer-->

	<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->
		
		<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
		<c:set var="returnListURL" 
				 value="${contextPath}/driveReview/reviewlist?cp=${pInfo.currentPage}"
				 scope="session"/>
		
		<script>
		$("#list-table td").on("click", function(){
			var boardNo = $(this).parent().children().eq(0).text();

			var boardViewURL = "review/" + boardNo; 
			
			location.href = boardViewURL;
										
		});
	</script>
		
		<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>

</body>

</html>