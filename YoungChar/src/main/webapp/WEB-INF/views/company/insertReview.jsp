<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Insert Review</title>
	<style>
			.card{
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			#select1{
				height: 40px;
			}
	</style>
	
	<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
	
</head>

<body class="rn-preloader">

		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
	<!-- End Header-->
		<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
		<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>

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
	<form action="insertAction" method="post" role="form" onsubmit="return validate();">
	<section class="rn-section">
		<div class="container">
			<a href="${sessionScope.returnListURL}"><i class="fas fa-arrow-left" ></i></a>
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<div class="invoice">
							  <div>
								<div>
								  <div class="row">
									<div class="col-sm-3">
										<h5>브랜드: ${board.categoryNm}</h5>
									</div>
									<div class="col-sm-3">
										<h5>센터: ${board.cooName} </h5>
									</div>
									<div class="col-sm-3">
										<h5>차명: ${board.carName} </h5>
									</div>
									<div class="col-sm-3">
										<select id="select1" name="csat">
											<option value="5">★★★★★</option>
											<option value="4">★★★★☆</option>
											<option value="3">★★★☆☆</option>
											<option value="2">★★☆☆☆</option>
											<option value="1">★☆☆☆☆</option>
										</select>
									</div>
								  </div>
								</div>
								<hr>
								<!-- End InvoiceTop-->
								<div class="row">
								  <div class="col-md-12">
									<input type="text" class="form-control" id="title" name="boardTitle" size="70" placeholder="제목을 입력해주세요.">
								  </div>
								</div>
								<!-- End Invoice Mid-->
								<div>
								  <div class="table-responsive invoice-table" id="table">
								  </div>
								  <!-- End Table-->
								  <textarea class="form-control" id="summernote" name="boardContent"
								  rows="10" style="resize: none;"></textarea>

								</div>
								<!-- End InvoiceBot-->
							  </div>
							  <div class="col-sm-12 text-center mt-3">
								<button class="btn btn-success btn-lg" type="submit">시승 후기 남기기</button>
							  </div>
							  <!-- End Invoice-->
							  <!-- End Invoice Holder-->
							  <!-- Container-fluid Ends-->
							</div>
						  </div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Content-->
	</section>
	<input type="hidden" name="memNo" value="${board.memNo}"readonly>
	<input type="hidden" name="rsrvtNo" value="${board.rsrvtNo}"readonly>
	<input type="hidden" name="categoryCd" value="${board.categoryCd}"readonly>
	</form>


	<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->

		<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
		<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/assets/js/scripts.js"></script>
		<script>
		
		// 유효성 검사
		function validate() {
			if ($("#title").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}
		
		$(document).ready(function() {
		    $('#summernote').summernote({
		        width : 1200, // 에디터 넓이
		        height: 400, // 에디터 높이
		        lang: 'ko-KR', // 언어 : 한국어
		        
		        // 이미지 업로드 이벤트가 발생했을 때 콜백함수 수행
		        callbacks : {
		            onImageUpload: function(files){
		                // files: 업로드된 이미지가 배열로 저장되어 있음
		                // editor == this : 이미지가 업로드된 상태의 썸머노트 에디터 

		                for (var i = files.length - 1; i >= 0; i--) {
	    	     				   sendFile(files[i], this);
	    	   					}
		            }
		        }

		    });
		});
		
		// 썸머노트에 업르도된 이미를 비동기로 서버로 전송하여 저장하는 함수
		function sendFile(file, editor){

		    var formData = new FormData();
		    // FormData: 자바스크립트 내장객체로 form 태그 내부 값 전송을 위한 객체
		    //           추가된 값을 k=v 형태로 쉽게 생성해주는 객체(쿼리스트링으로 만들어줌)

		    formData.append("uploadFile", file);

		    $.ajax({
		        url : "${contextPath}/driveReview/insertImage",
		        type : "post", // 파일 전송 시 post로만 전송 가능
		        enctype : "multipart/form-data", // 파일 전송 형식으로 인코딩 지정
		        data : formData, // {"uploadFile", file} 로 폼데이터를 쓰지않고 작성도 가능
		        contentType : false, // 서버로 전송되는 데이터 형식 
		        // 기본값: application/x-www-form-urlencoded; charset=utf-8 == 텍스트
		        // false: 바이트 코드 있는 그대로
		        cache : false,
		        processData : false,
		        // 서버로 전달되는 값을 쿼리스트링으로 전달할 경우 true, 아니면 false
		        // 파일 전송 시 false로 지정
		        dataType : "json",
		        success : function(at){
		            // console.log(at);

		            // 자바스크립트를 이용한 contextPath 얻어오는 방법
		            var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		            // localhost:8080/spring/ 까지 저장

		            // 저장된 이미지를 summernote 에디터에 반영(삽입)
		            $(editor).summernote('editor.insertImage', contextPath + at.filePath + "/" + at.fileName);
		            // localhost:8080/spring  /resources/infoImages  / 2021~~~.jpg
		        }
		    });
		}
		
		</script>

</body>

</html>