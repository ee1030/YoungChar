<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style>
/* @media (min-width: 1400px) {
  .container, .container-sm, .container-md, .container-lg, .container-xl, .container-xxl {
    max-width: 1320px; } } */
</style>



<%-- <!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/css/fontawesome.css">
<!-- ico-font-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/icofont.css">
<!-- Themify icon-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/themify.css">
<!-- Flag icon-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/flag-icon.css">
<!-- Feather icon-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/feather-icon.css">
<!-- Plugins css start-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/scrollbar.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/animate
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/bootstrap.css">
<!-- App css-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/style2.css">
<link id="color" rel="stylesheet" href="${contextPath}/resources/assets/css/color-1.css" media="screen">
<!-- Responsive css-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/responsive.css"> --%>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/chartist.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/owlcarousel.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/prism.css">
<!-- Plugins css Ends-->
<!-- Bootstrap css-->
</head>



<body>
	<!-- 헤더  -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- Page Title-->


	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1>잡담 게시판</h1>
						<p>무엇이든 적어 보세요 !</p>
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
				<div class="col-lg-8 order-lg-1 pb-15" style="margin: auto;">
					<div class="col-sm-12">
						<div class = "card">
								<!-- /spring/board/list/1or2 -> search/2 -->
								<form action="../search/${pInfo.boardType}" class="text-center" id="searchForm" >
									<span> 카테고리(다중 선택 가능)<br> 
									
									<label for="exercise">테슬라</label> 
									<input type="checkbox" name="ct" value="테슬라" id="tesla"> &nbsp; 
									
									<label for="movie">현대자동차</label>
									<input type="checkbox" name="ct" value="현대자동차" id="hyundai"> &nbsp; 
									
									<label for="music">기아</label> 
									 <input type="checkbox" name="ct" value="기아" id="kia"> &nbsp; 
									 
									 <label for="cooking">벤츠</label>
									  <input type="checkbox" name="ct" value="벤츠" id="benz"> &nbsp; 
									  
									  <label for="game">BMW</label>
									   <input type="checkbox" name="ct" value="BMW" id="bmw"> &nbsp; 
									   
									  <label for="game">아우디</label>
									   <input type="checkbox" name="ct" value="아우디" id="audi"> &nbsp; 
									   
									  <label for="game">포르쉐</label>
									   <input type="checkbox" name="ct" value="포르쉐" id="porsche"> &nbsp;
									    
									  <label for="game">르노</label>
									   <input type="checkbox" name="ct" value="르노" id="renault"> &nbsp; 
									   
									   
									   
									</span> <br> <select name="sk" class="form-control" style="width: 100px; display: inline-block; margin-bottom: 10px;">
										<option value="tit">글제목</option>
										<option value="con">내용</option>
										<option value="titcont">제목+내용</option>
									</select> <input type="text" name="sv" class="form-control" style="width: 25%; display: inline-block;">
									<button class="form-control btn btn-success" id="searchBtn" type="submit" style="width: 100px; display: inline-block;">검색</button>
								</form>
							</div>
						<div class="card">
							<div class="card-header">
								<div id="head">
								
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-hover" id="list-table">
									<thead>
										<tr>
											<th scope="col">No</th>
											<th colspan="2" scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>

											<th scope="col">조회수</th>

										</tr>
									</thead>
									<tbody>
										<c:if test="${empty bList }">
											<tr>
												<td colspan="6">존재하는 게시글이 없습니다.</td>
											</tr>
										</c:if>

										<c:if test="${!empty bList }">
											<c:forEach var="board" items="${bList}" varStatus="vs">

												<tr>
													<td>${board.boardNo}</td>
													<%-- <td>${board.categoryName}</td> --%>
													<td colspan="2" class="boardTitle">
														<!----------------- 썸네일 부분 -----------------> <c:forEach items="${thList}" var="th">
															<c:if test="${th.parentBoardNo  == board.boardNo}">
																<img style="width: 50px; height: 50px;" src="${contextPath}${th.filePath}/${th.fileName}">
																<%--/spring/resources/uploadImages/123123.jpg --%>
															</c:if>
														</c:forEach> ${board.boardTitle}
													</td>

													<td>${board.memberId}</td>
													<td>
														<%-- 날짜 출력 모양 지정 --%> <fmt:formatDate var="createDate" value="${board.boardCreateDate }" pattern="yyyy-MM-dd" /> <fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" /> <c:choose>
															<c:when test="${createDate != now}">
																${createDate }
															</c:when>
															<c:otherwise>
																<fmt:formatDate value="${board.boardCreateDate }" pattern="HH:mm" />
															</c:otherwise>
														</c:choose>
													</td>
													<td>${board.readCount}</td>

												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>

							<%-- 로그인이 되어있는 경우 --%>
							<c:if test="${!empty loginMember }">
								<a class="btn btn-success " style="width: 100px; margin-top: 10px; " href="../${pInfo.boardType}/insert">글쓰기</a>
							</c:if>

							<!--------------------------------- pagination  --------------------------->
							<div class="my-4">
								<nav class="rn-pagination rn-pagination-center">
									<ul>

										<%-- 주소 조합 작업 --%>
										<c:choose>
											<%-- 검색이 된 경우 --%>
											<c:when test="${!empty search }">
												<%--선택된 카테고리를 하나의 쿼리스트링으로 조합 --%>

												<c:forEach items="${search.ct}" var="c">
													<c:set var="category" value="${category}ct=${c}&" />
												</c:forEach>

												<c:set var="searchStr" value="${category}" />

												<%-- 검색된 내용이 있다면 --%>
												<c:if test="${!empty search.sv}">
													<c:set var="searchStr" value="${category}sk=${search.sk}&sv=${search.sv}" />
												</c:if>

												<c:url var="pageUrl" value="../search/${search.boardType}?${searchStr}&" />
												<c:set var="returnListURL" value="${contextPath}/board/search/${pageUrl}cp=${pInfo.currentPage }" scope="session" />
											</c:when>

											<%-- 안된 경우 --%>
											<c:otherwise>
												<c:url var="pageUrl" value="${pInfo.boardType}?" />
												<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
												<c:set var="returnListURL" value="${contextPath}/board/list/${pageUrl}cp=${pInfo.currentPage }" scope="session" />
											</c:otherwise>

										</c:choose>




										<!-- 화살표에 들어갈 주소를 변수로 생성 -->
										<c:set var="firstPage" value="${pageUrl}cp=1" />
										<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />

										<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다--%>
										<%-- 
										<fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
										integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림)
									--%>

										<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
										<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
										<c:set var="prevPage" value="${pageUrl}cp=${prev}" />


										<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
										<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
										<c:set var="nextPage" value="${pageUrl}cp=${next}" />



										<c:if test="${pInfo.currentPage > pInfo.pageSize}">
											<li>
												<!-- 첫 페이지로 이동(<<) --> <a href="${firstPage}"><i class="fas fa-angle-right">..</i></a>
											</li>

											<li>
												<!-- 이전 페이지로 이동 (<) --> <a href="${prevPage}"> <i class="fas fa-angle-left"></i></a>
											</li>
										</c:if>

										<!-- 페이지 목록 -->
										<c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}">
											<c:choose>
												<c:when test="${pInfo.currentPage == page }">
													<li><a class="page-link">${page}</a></li>
												</c:when>

												<c:otherwise>
													<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
										<c:if test="${next <= pInfo.maxPage}">
											<li>
												<!-- 다음 페이지로 이동 (>) --> <a href="${nextPage}"><i class="fas fa-angle-right"></i></a>
											</li>

											<li>
												<!-- 마지막 페이지로 이동(>>) --> <a href="${lastPage}"><i class="fas fa-angle-right"></i></a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>

							<!--------------------------------- pagination  --------------------------->

						</div>
					</div>
				</div>



				<div class="col-lg-2">

					<!-- Sidebar-->
					<aside class="rn-widget-area rn-left-sidebar" id="secondary">

						<div style="height: 100px;">
							<!-- 게시판 명 얻어오기 -->
							<h1>
								<%-- 	${bList[0].boardName } --%>
								<c:choose>
									<c:when test="${pInfo.boardType == 3 }">FREECHAT	</c:when>
								</c:choose>


							</h1>

						</div>

						<!-- Widget Item-->
						<div class="rn-widget">
							<div class="rn-widget-content">
							</div>
						</div>
						<!-- End Widget Item-->


						<!-- Widget Item-->
				

						<section class="rn-widget">
							<h2 class="rn-widget-title">게시판 이동</h2>
							<div class="rn-widget-content ">
								<ul>
							
						
								
									<li><a href="${contextPath }/board/list/1">리뷰 게시판</a></li>
									<li><a href="${contextPath }/board/list/2">정보 게시판</a></li>
							

								</ul>
							</div>
						</section>
						<!-- End Widget Item-->


						<!-- Widget Item-->

						<!-- End Widget Item-->


						<!-- Widget Item-->

						<!-- End Widget Item-->

					</aside>
					<!-- End Slidebar-->

				</div>
			</div>
		</div>
	</div>
	<!-- End Page Content-->

	

	<jsp:include page="../common/footer.jsp"/> 
	<!-- End Site Footer-->

	<script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		$("#list-table td").on("click", function() {

			var boardNo = $(this).parent().children().eq(0).text();
			// td     tr 				td   		첫번째(게시글 번호)

			// 게시글 상세조회 요청 주소 조합

			// 게시글 목록 : /spring/board/list/1
			// 상세조회 : /spring/board/1/500
			// 절대 경로
			//var boardViewURL = "${contextPath}/board/${pInfo.boardType}/" + boardNo;
			// 		spring /	board	/					1				/500

			// 상대경로 
			var boardViewURL = "../boardView/${pInfo.boardType}/" + boardNo;

			location.href = boardViewURL;
		});
		
		
		
		
		// ------- 검색 파라미터 유지 ----------
		$(function(){
			// 카테고리 
			<c:forEach items="${search.ct}" var="ctName">
				$("input[name=ct]").each(function(index, item){
					if($(item).val() == "${ctName}"){
						$(item).prop("checked",true);
					}
				});	
			
			</c:forEach>
			
			// 검색 조건(sk)
			$("select[name=sk] > option").each(function(index,item){
				if($(item).val() == "${search.sk}"){
					$(item).prop("selected",true);
				}
			}); 
			
			// 검색 값(sv)
			$("input[name=sv]").val("${search.sv}");
			
		});
		
	</script>

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