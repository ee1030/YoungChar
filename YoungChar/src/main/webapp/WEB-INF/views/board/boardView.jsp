<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<style>
	#board-area{ margin-bottom:100px;}
	#board-content{ padding-bottom:150px;}
	#date-area{font-size: 12px; line-height: 12px}
	#date-area>p{margin: 0}
 

	.boardImgArea{
		height: 300px;
	}

	.boardImg{
		width : 100%;
		height: 100%;
		
		max-width : 300px;
		max-height: 300px;
		
		margin : auto;
	}
	
	#content-main{ margin: 100px auto;}
	
	/* 이미지 화살표 색 조정
	-> fill='%23000' 부분의 000을
	   RGB 16진수 값을 작성하여 변경 가능 
	 */
	.carousel-control-prev-icon {
 		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
	}
	
	.carousel-control-next-icon {
  		background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1></h1>
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container card" id="content-main">

		<div>
			
			<br>
			<br>
			<div id="board-area">
				<!-- Title -->
				<h1 class="mt-4 ">Title : ${board.boardTitle }</h1>

				<!-- Category -->
				<h5 class="mt-4">category : ${board.categoryName }</h5>
				
	
				<br>
				<br>

				<!-- Writer -->
				<div class="lead">
					작성자 : ${board.memberId}<br>
				 	<span class="float-right">조회수 : ${board.readCount }</span>
					<div id="date-area">
						<p>작성일 : ${board.boardCreateDate}</p>
					</div>
					
				</div>

				<br>
				<br>

				
				<!-- 이미지 부분 -->
				 <c:if test="${!empty attachmentList }">

					<div class="carousel slide m-3" id="carousel-325626">

						<div class="carousel-inner boardImgArea">
							<c:forEach var="at" items="${attachmentList}" varStatus="vs">
								<c:set var="src" value="${contextPath}${at.filePath}/${at.fileName}" />
								<div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
									<img class="d-block w-100 boardImg" src="${src}" /> <input type="hidden" value="${at.fileNo}">
								</div>
							</c:forEach>
						</div>

						 <a class="carousel-control-prev" href="#carousel-325626" data-slide="prev">
						<span class="carousel-control-prev-icon"></span> 
						<span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-325626" data-slide="next"> 
						<span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a> 
					</div>
				</c:if> 


				<!-- Content -->
				<div id="board-content">
				<%-- ${board.boardContent} --%>
				<%-- JSTL을 이용한 개행문자 처리 --%>
				<%-- <%%>는 원래 자바코드 --%>
				<%
					pageContext.setAttribute("newLine", "\n");
				%>
				${fn:replace(board.boardContent , newLine, "<br>") }
				<%-- el jstl은 컴파일시 자바코드로 변환  --%>
				</div>

				<br>
				<br>
				
				<div>
					<div class="float-right">
					
						<%-- 북마크나 주소로 인한 직접 접근 시 목록으로 버튼 경로 지정 --%>
					<%-- 	<c:if test="${empty sessionScope.returnListURL}">
							<c:set var="returnListURL" value="../list/${board.boardCode}" scope="session"/>
						</c:if> --%>
						<c:if test="${(loginMember != null) && (board.memberId != loginMember.memberId)}">
							<button data-toggle="modal" data-target="#exampleModal" type="button" class="btn btn-outline-danger">신고</button>
						</c:if>

						<%--  <c:choose>
							<	<c:when test="${!empty param.adm}">
								<a class="btn btn-success" href="javascript:history.back();">목록으로</a>
							</c:when> -
							<c:otherwise>
							</c:otherwise>
						</c:choose>  --%>
						
							<c:if test="${!empty param.adm}">
									<a class="btn btn-success" href="javascript:history.back();">목록으로</a>
							</c:if>
						
							<c:if test="${empty param.adm}">
						 		<a class="btn btn-success returnUrl" style="color: ghostwhite;">목록으로</a>
							</c:if>
	                	
	           <c:url var="updateUrl" value="${board.boardNo}/update"/>
	                	
	                	<!-- 로그인된 회원이 글 작성자인 경우 -->
						<c:if test="${(loginMember != null) && (board.memberId == loginMember.memberId)}">
							<a href="${updateUrl}" class="btn btn-success ml-1 mr-1">수정</a>
							<button id="deleteBtn" class="btn btn-success">삭제</button> 
						</c:if>
					</div>
				</div>
			</div>

			

			<!-- 댓글 부분 -->
			 <jsp:include page="reply.jsp"/> 
			
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-signin" method="POST" action="${contextPath}/board/${board.boardCode}/reportBoard" onsubmit="return validate();">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">게시글 신고</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="reportBoardNo" value="${board.boardNo}"> <input type="hidden" name="memNo" value="${loginMember.memberNo}"> <input id="report1" name="reportType" type="radio" value="1" class="radio_animated"> <label for="report1">허위 사실 유포</label> <br>
						<br> <input id="report2" name="reportType" type="radio" value="2" class="radio_animated"> <label for="report2">비속어 / 폭언 / 불쾌감 조성</label> <br>
						<br> <input id="report3" name="reportType" type="radio" value="3" class="radio_animated"> <label for="report3">게시판 목적에 맞지 않는 글</label> <br>
						<br> <input id="report4" name="reportType" type="radio" value="4" class="radio_animated"> <label for="report4">기타</label> <br>
						<br> <label for="reason">요청 사유</label> <input type="text" class="form-control" id="reportContent" name="reportContent" placeholder="기타 항목 선택 시 필수로 작성하셔야합니다."> <br>
						<br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-secondary">신고</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/> 
	
	<script>
	
		function validate() {
			if ($('input[name="reportType"]:checked').val() == "4"
					&& $("#reportContent").val().trim().length == 0) {
				alert("신고 내용을 입력해 주세요.");
				$("#reportContent").focus();
				return false;
			}
		}

		// 목록으로
		$(".returnUrl").on('click', function() {

			var boardCode = ${board.boardCode};
			var returnURL = "../../list/" + boardCode;

			location.href = returnURL;
		});

		$("#deleteBtn").click(function() {

			if (confirm("정말 삭제하시겠습니까?")) {

				location.href = "../delete/${board.boardCode}/" + ${board.boardNo};

			}

		});

		// 게시글 삭제
	</script>
</body>
</html>
