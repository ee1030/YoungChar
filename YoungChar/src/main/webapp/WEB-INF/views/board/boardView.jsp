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
	
	
	<div class="container" id="content-main">

		<div>
			<h1 class="rn-widget-title">${board.boardName }</h1>
			<br>
			<br>
			<div id="board-area">

				<!-- Category -->
				<h5 class="mt-4">카테고리 : ${board.categoryName }</h5>
				
				<!-- Title -->
				<h1 class="mt-4 ">제목 : ${board.boardTitle }</h1>
	
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
						<c:choose>
							<c:when test="${!empty param.adm}">
								<a class="btn btn-success" href="javascript:history.back();">목록으로</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-success returnUrl">목록으로</a>
							</c:otherwise>
						</c:choose>
						
	                	
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
			 <jsp:include page="reply.jsp"/> -
			
		</div>
	</div>
	 <jsp:include page="../common/footer.jsp"/> 
	
	<script>	
		// 목록으로
		$(".returnUrl").on('click',function(){
			
			var boardCode = ${board.boardCode};
			var returnURL = "../list/" + boardCode;
			
			location.href = returnURL;
			
			
		});
		
		
	
	
		// 게시글 삭제
		
		
	</script>
</body>
</html>
