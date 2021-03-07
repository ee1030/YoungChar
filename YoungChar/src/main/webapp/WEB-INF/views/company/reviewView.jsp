<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Review View</title>
	<style>
		.card{
			font-family: 'Noto Sans KR', sans-serif;
		}
	
		#board-area{ margin-bottom:100px;}
		#board-content{ padding-bottom:150px;}
		#date-area{font-size: 12px; line-height: 12px}
		#date-area>p{margin: 0}
	
		.icofont-ui-rating{
	    color: #ffa800;
			}
		
		.white-star{
    	color: #d2d2d2;
		}
		
		.img-60{
			height: 60px;
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
			<h2>R E V I E W</h2>
			<br>
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<div class="invoice">
							  <div>
								<!-- End InvoiceTop-->
								<div class="row">
									<div class="col-md-8">
											<br><br>
										  <h3 class="media-heading">${board.boardTitle}</h3>
										  <br>
									  <div class="media">
										<div class="media-left">
										
										<c:choose>
											<c:when test="${!empty board.memImgPath}">
												<img class="media-object rounded-circle img-60" src="${contextPath}${board.memImgPath}/${board.memImgName}">
											</c:when>
											<c:otherwise>
												<img class="media-object rounded-circle img-60" src="${contextPath}/resources/memberFile/user-basic.png">
											</c:otherwise>
										</c:choose>
										
										</div>
										<div class="media-body m-l-20">
										  <h5 class="media-heading">${board.memNickname} </h5>
										  <p><i class="icon-eye"></i> ${board.readCount} &nbsp;&nbsp;&nbsp; <i class="icon-comment"></i> ${board.replyCount} &nbsp;&nbsp;&nbsp;  
													<fmt:formatDate var="createDate" value="${board.boardCreateDt }" pattern="yy-MM-dd HH:mm"/>
													<fmt:formatDate var="now" value="<%=new java.util.Date()%>" pattern="yy-MM-dd HH:mm"/> 
													<c:choose>
														<c:when test="${createDate != now}">
															${createDate }
														</c:when>
														<c:otherwise>
															<fmt:formatDate value="${board.boardCreateDt }" pattern="HH:mm"/>
														</c:otherwise>
													</c:choose>
											</p>
										</div>
									  </div>
									</div>
									<div class="col-md-4">
									
									
									<div class="card o-hidden">
                  <div class="chart-widget-top">
                    <div class="row card-body">
                      <div class="col-8">
                        <h6 class="f-w-600 font-success">BRAND</h6>
                      </div>
                      <div class="col-4 text-end">
                        <h6 class="num total-value"><span class="counter">${board.categoryNm}</span></h6>
                      </div>
                      <div class="col-8">
                        <h6 class="f-w-600 font-success">CENTER</h6>
                      </div>
                      <div class="col-4 text-end">
                        <h6 class="num total-value"><span class="counter">${board.cooName}</span></h6>
                      </div>
                      <div class="col-8">
                        <h6 class="f-w-600 font-success">PRODUCT</h6>
                      </div>
                      <div class="col-4 text-end">
                        <h6 class="num total-value"><span class="counter">${board.carName}</span></h6>
                      </div>
                      <div class="col-8">
                        <h6 class="f-w-600 font-success">RATING</h6>
                      </div>
                      <div class="col-4 text-end">
                        <h6 class="num total-value"><span class="counter">
                        	<c:forEach begin="1" end="${board.csat}">
														<i class="icofont icofont-ui-rating"></i>
													</c:forEach>
													<c:forEach begin="1" end="${5 - board.csat}">
														<i class="icofont icofont-ui-rating white-star"></i>
													</c:forEach></span></h6>
                      </div>
                    </div>
                    <div id="chart-widget3">
                      <div class="flot-chart-placeholder" id="chart-widget-top-third"></div>
                    </div>
                  </div>
                </div>

									</div>
								  </div>
								  <hr>
								<!-- End Invoice Mid-->
								<div>
								  <div class="table-responsive invoice-table" id="table">
								  </div>
								  <!-- End Table-->
									<div id="board-content">
									   ${board.boardContent}
									</div>
								</div>
								<!-- End InvoiceBot-->
									<hr>
									<div>
										<div class="float-right">
											  <c:if test="${(loginMember != null) && (board.memId != loginMember.memberId)}">
													<button data-toggle="modal" data-target="#exampleModal" type="button" class="btn btn-outline-danger">신고</button>
												</c:if>
											<c:if test="${empty sessionScope.returnListURL}">
												<c:set var="returnListURL" value="../reviewlist" scope="session"/>
											</c:if>
											<a class="btn btn-light" href="${sessionScope.returnListURL}">목록으로</a>
											
											<c:url var="updateUrl" value="../update/${board.boardNo}" />
											<c:if test="${(loginMember != null) && (board.memId == loginMember.memberId)}">
												<a href="${updateUrl}" class="btn btn-light">수정</a>
												<button id="deleteButton" type="button" class="btn btn-light">삭제</button>
											</c:if>
										</div>
									</div>
								</div>
					
								
							  </div>
							  <div>
								<jsp:include page="reply.jsp"/>
							  </div>
							  <!-- End Invoice-->
							  <!-- End Invoice Holder-->
							  <!-- Container-fluid Ends-->
							</div>
						  </div>
					</div>
				</div>
			</div>
		<!-- End Page Content-->
	</section>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
					<form class="form-signin" method="POST" action="${contextPath}/driveReview/reportBoard" onsubmit="return validate();">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">게시글 신고</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
						<input type="hidden" name="reportBoardNo" value="${board.boardNo}">
						<input type="hidden" name="memNo" value="${loginMember.memberNo}">
						
						<input id="report1" name="reportType" type="radio" value="1" class="radio_animated">
						<label for="report1">허위 사실 유포</label>
						<br><br>
						<input id="report2" name="reportType" type="radio" value="2" class="radio_animated">
						<label for="report2">비속어 / 폭언 / 불쾌감 조성</label>
						<br><br>
						<input id="report3" name="reportType" type="radio" value="3" class="radio_animated">
						<label for="report3">게시판 목적에 맞지 않는 글</label>
						<br><br>
						<input id="report4" name="reportType" type="radio" value="4" class="radio_animated">
						<label for="report4">기타</label>
						<br><br>
						<label for="reason">요청 사유</label>
						<input type="text" class="form-control" id="reportContent" name="reportContent" placeholder="기타 항목 선택 시 필수로 작성하셔야합니다.">
						<br><br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-secondary">신고</button>
				</div>
					</form>
			</div>
		</div>
	</div>
	

	

	<script>
	function validate() {
		if ($('input[name="reportType"]:checked').val() == "4" && $("#reportContent").val().trim().length == 0) {
			alert("신고 내용을 입력해 주세요.");
			$("#reportContent").focus();
			return false;
		}
	}
	
	$("#deleteButton").click(function(){
		
		if(confirm("정말 삭제하시겠습니까?")){
			
			location.href = "../delete/"+ ${board.boardNo};
			
		}
		
	});
	
	</script>


</body>

</html>