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
			
		#list-table{
			table-layout:fixed;
		}
			
		.boardTitle>img {
			width: 35px;
			height: 35px;
		}
		
		.boardTitle {
			text-overflow:ellipsis; 
			overflow:hidden;
			white-space:nowrap;
		}

		#head {
			display: inline-block;
			font-size: 21px;
			font-weight: bold;
		}

		#search-form{
			width: 470px;
			margin:0 auto;
		}

		#search-bar{
			width: 300px !important;
			padding: 5px;
		}
		
		.search-key{
			width: 100px;
		}
		
		.badge{
			padding: 0.3em 0.5em !important;
		}
		
		.d-block{
			text-align: center;
		}
		
		.td{
			width: 9%
		}
		
	
		.icofont-ui-rating{
	    color: #ffa800;
			}
		
		.white-star{
    	color: #d2d2d2;
		}
		
		.pagination {
 			  display: inherit !important;
 			  text-align: center;
		}
		

		#list-table td:hover {
			cursor: pointer;
		}
		
		.checkbox_animated:after, .search-key, .form-control-plaintext{
			border: 1px solid #c1c1c182 !important;
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
							<h2><a style="color:black" href="${contextPath}/driveReview/reviewlist">R E V I E W</a></h2>
								<div id="search-form" class="theme-form">
									<form action="search" id="searchForm">
									<div class="d-block">
										<label for="chk-ani1">
											<input class="checkbox_animated" value="테슬라" name="ct" type="checkbox">테슬라
										</label>
										<label for="chk-ani2">
											<input class="checkbox_animated" value="현대자동차" name="ct" type="checkbox">현대자동차
										</label>
										<label for="chk-ani3">
											<input class="checkbox_animated" value="기아" name="ct" type="checkbox">기아
										</label>
										<label for="chk-ani4">
											<input class="checkbox_animated" value="벤츠" name="ct" type="checkbox">벤츠
										</label><br>
										<label for="chk-ani5">
											<input class="checkbox_animated" value="BMW" name="ct" type="checkbox">BMW
										</label>
										<label for="chk-ani6">
											<input class="checkbox_animated" value="아우디" name="ct" type="checkbox">아우디
										</label>
										<label for="chk-ani7">
											<input class="checkbox_animated" value="포르쉐" name="ct" type="checkbox">포르쉐
										</label>
										<label for="chk-ani8">
											<input class="checkbox_animated" value="르노" name="ct" type="checkbox">르노
										</label>
									</div>
									<br>
									<div class="input-group m-0">
									
										<select name="sk" class="search-key" style="width: 100px; display: inline-block;">
											<option value="tit">글제목</option>
											<option value="con">내용</option>
											<option value="titcont">제목+내용</option>
											<option value="sc">센터</option>
										</select> 
										<input id="search-bar" name="sv" class="form-control-plaintext" type="search" placeholder="검색어를 입력해주세요.">
										<button type="submit" class="btn btn-success input-group-text"><i class="icon-search"></i></button>
									</form>
									
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
													<fmt:formatDate var="createDate" value="${board.boardCreateDt }" pattern="yy-MM-dd"/>
													<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yy-MM-dd"/> 
												<td class="boardTitle" colspan="3">
													<c:forEach items="${thList}" var="th">
														<c:if test="${th.parentBoardNo == board.boardNo}">
															<img src="${contextPath}${th.filePath}/${th.fileName}">
														</c:if>
													</c:forEach>
												${board.boardTitle}
													<c:choose>
														<c:when test="${createDate == now}">
															<label class="badge badge-warning text-dark">N</label>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${board.readCount > 50}">
															<label class="badge badge-danger">HOT</label>
														</c:when>
													</c:choose>
												</td>
												<td class="td">${board.memNickname}</td>
												<td class="td">
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
										</c:forEach>
									</c:if>
								</tbody>
							</table>
					</div>
				</div>



				<!-- Post Pagination-->
							<nav class="rn-pagination">
										<ul class="pagination pagination-light">
										
										<c:choose>
											<c:when test="${!empty search}">
											
												<%-- 선택된 카테고리를 하나의 쿼리스트링으로 조합 --%>
												<c:forEach items="${search.ct}" var="c">
													<c:set var="category" value="${category}ct=${c}&" />
												</c:forEach>
												
												<c:set var="searchStr" value="${category}" />
												
												<%-- 검색된 내용이 있다면 --%>
												<c:if test="${!empty search.sv}">
													<c:set var="searchStr" value="${category}sk=${search.sk}&sv=${search.sv}"/>
												</c:if>
												
												<c:url var="pageUrl" value="search?${searchStr}" />
												
													<c:set var="returnListURL" 
															 value="${contextPath}/driveReview/${pageUrl}&cp=${pInfo.currentPage}"
															 scope="session"/>
															 
											</c:when>
											<c:otherwise>
													<c:url var="pageUrl" value="?" />
													<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
													<c:set var="returnListURL" 
															 value="${contextPath}/driveReview/reviewlist${pageUrl}&cp=${pInfo.currentPage}"
															 scope="session"/>
											</c:otherwise>
										</c:choose>
										
										<c:set var="firstPage" value="${pageUrl}&cp=1"/>
										<c:set var="lastPage" value="${pageUrl}&cp=${pInfo.maxPage}"/>
										
										<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 5 }"  integerOnly="true" />
										<fmt:parseNumber var="prev" value="${ c1 * 5 }"  integerOnly="true" />
										<c:set var="prevPage" value="${pageUrl}&cp=${prev}" />
					
										<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 4) / 5 }" integerOnly="true" />
										<fmt:parseNumber var="next" value="${ c2 * 5 + 1 }" integerOnly="true" />
										<c:set var="nextPage" value="${pageUrl}&cp=${next}" />
											
											
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
														<a class="page-link" href="${pageUrl}&cp=${page}">${page}</a>
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