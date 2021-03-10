<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>뉴스 수정</title>

<style>

#subImage {
	margin-left: 25px;
}
.insert-label {
	display: inline-block;
	width: 80px;
	line-height: 40px
}

.deleteImg{
	    position: absolute;
	    display : inline-block;
	    margin-left: -15px;
	    border: none;
	    background-color: rgba(1,1,1,0);
	    width: 20px;
	    height: 20px;
	    cursor: pointer;
    }

#submitButton {
	float: right;
	margin-left: 25px;
}

.boardImg {
	cursor: pointer;
}

#cont {
	margin-left: 10px;
}

.contents {
	display:inline-block;
}

#contentsImage {
	margin-left: 100px;
}
</style>

<!--
		All CSS Codes Loaded
		Ex: bootstrap, fontawesome, style, etc.-->

<link rel="stylesheet" href="${contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/fontawesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/linearicons/linearicons.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/rentnow-icons.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="${contextPath}/resources/assets/css/style.css">


</head>
<body>

	<!-- Header-->
	<jsp:include page="../common/header.jsp"></jsp:include>





	<!-- Single Car Header-->
	<div class="rn-single-car-header">
		<div class="rn-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-car-single-info"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Single Car Header-->

	<!-- Single Car Content-->
	<section class="rn-section">
		<div class="container">

			<div class="container pb-5 mb-5">


				<form action="updateAction" method="post" enctype="multipart/form-data" name="updateForm" role="form" onsubmit="return validate();">
					<!-- enctype="multipart/form-data" -->

					<div class="contents">
						<div class="form-inline mb-2">
							<label class="input-group-addon mr-3 insert-label">제목</label> <input type="text" class="form-control" id="newsTitle" name="newsTitle" size="70" value="${news.newsTitle}">
						</div>

						<div class="form-inline mb-2">
							<label class="input-group-addon mr-3 insert-label">언론사</label> <input type="text" class="form-control" id="press" name="press" size="70" value="${news.press}">
						</div>


						<div class="form-inline mb-2">
							<label class="input-group-addon mr-3 insert-label">기자</label> <input type="text" class="form-control" id="reporter" name="reporter" size="70" value="${news.reporter}">
						</div>
					</div>
					
					<div class="contents" id="contentsImage">
						<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label" id="cont">INSERT MAIN IMAGE</label>
					<div class="boardImg" id="titleImgArea">
						<img id="titleImg" width="200" height="200">
						<span class="deleteImg">x</span>
					</div>
					<div class="form-inline mb-2" id="subImage">
					<div class="mr-2 boardImg" id="contentImgArea1">
						<img id="contentImg1" width="150" height="150">
						<span class="deleteImg">x</span>
					</div>

					<div class="mr-2 boardImg" id="contentImgArea2">
						<img id="contentImg2" width="150" height="150">
						<span class="deleteImg">x</span>
					</div>
				</div>
				</div>
				
					<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="img0" name="image" onchange="LoadImg(this,0)"> 
					<input type="file" id="img1" name="images" onchange="LoadImg(this,1)">
					<input type="file" id="img2" name="images" onchange="LoadImg(this,2)"> 
				</div>
					</div>
					
						<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">작성일</label>
						<h5 class="my-0" id="today">
							<!-- 현재 날짜를 jsp를 이용해 가져오는 방법 -->
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
						</h5>
					</div>
					
					


					<hr>

					<div class="row">
						<div class="form-group">
							<div>
								<label for="content">내용</label>
							<div class="col-lg-8">
							<textarea class="form-control" id="newsContent" name="newsContent" rows="10" style="resize: none;">"${news.newsContent}"</textarea>
						</div>
						</div>
						</div>



						<div class="col-lg-4">
							<!-- End Check Availability-->

							<!-- Car Sharing Buttons-->
							<div class="rn-car-share">
								<span>Share this News : </span>
								<ul>
									<li><a href="#"> <i class="fab fa-facebook-f"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-twitter"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-google-plus-g"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-linkedin-in"></i>
									</a></li>
								</ul>
							</div>
							<!-- End Car Sharing Buttons-->

						</div>
					</div>


					<div class="text-center">
						<button id="submitButton" type="submit" class="btn btn-success">수정</button>
						<a class="btn btn-success float-right"  href="${header.referer}">이전</a>
					</div>

				</form>
			</div>

		</div>
	</section>
	<!-- End Single Car Content-->




	<jsp:include page="../common/footer.jsp"/> 

		<script>
		// 이미지 배치
		<c:forEach var="at" items="${newsList}">
			$(".boardImg").eq(${at.fileLevel}).children("img").attr("src", "${contextPath}${at.filePath}/${at.fileName}");
		</c:forEach>
	
	
		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function(){
			$("#fileArea").hide(); // #fileArea 요소를 숨김.		
			
			$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
				var index = $(".boardImg").index(this);// 클릭한 이미지 영역 인덱스 얻어오기
				$("#img" + index).click(); // 클릭된 영역 인덱스에 맞는 input file 태그 클릭
			});
			
		});
		 
		
		 // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		 function LoadImg(value, num) {
		  
			if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
				
				var reader = new FileReader();
		    	reader.readAsDataURL(value.files[0]);
		    	
		    	reader.onload = function(e){
		    		
		    		// 미리보기
					$(".boardImg").eq(num).children("img").attr("src", e.target.result);
					
		    		
		    		// 특정 fileLevel에 이미지가 업로드 된 경우
		    		// == deleteImages 배열에서 해당 fileLevel과 일치하는 인덱스의 값을
		    		// false로 바꿔 삭제되지 않음을 알려줌.
		    		
					
					
		    	}
			}
		}
		
	  
		// 유효성 검사
			function validate() {
				if ($("#newsTitle").val().trim().length == 0) {
					alert("뉴스 제목을 입력해 주세요.");
					$("#newsTitle").focus();
					return false;
				}

				if ($("#press").val().trim().length == 0) {
					alert("언론사를 입력해 주세요.");
					$("#press").focus();
					return false;
				}

				if ($("#reporter").val().trim().length == 0) {
					alert("기자를 입력해 주세요.");
					$("#reporter").focus();
					return false;
				}

				if ($("#newsContent").val().trim().length == 0) {
					alert("뉴스 내용을 입력해 주세요.");
					$("#newsContent").focus();
					return false;
				}
			
			
			// 유효성 검사에서 문제가 없을 경우
			// 유효성 검사에서 문제가 없을 경우 서버에 제출 전
	         // deleteImages배열의 내용을 hidden 타입으로 하여 form태그 마지막에 추가하여 파라미터로 전달
	         for(var i=0 ; i<deleteImages.length ; i++){
	            $deleteImages = $("<input>", {type : "hidden", name : "deleteImages", value : deleteImages[i]});
	            $("form[name=updateForm]").append($deleteImages);
	         }
			
			
		}
		
		
		
		
		
		// 게시글에 업로드 된 이미지 삭제
		var deleteImages = [];
		// 배열을 생성하여 이미지 삭제 버튼 수 만큼 배열에 false 요소를 추가
		// -> 배열에 4개 false가 추가 됨 == 인덱스는 0~3 == fileLevel과 같음
		// --> 이미지 삭제 버튼이 클릭 될 경우
		// 		해당 fileLevel과 같은 인덱스 값을 true로 변경
		//  	--> 해당 이미지가 삭제 되었음을 전달하기 위한 용도로 사용할 예정

		for(var i=0; i<$(".deleteImg").length; i++) {
			deleteImages.push(false);
		}
		
		// 이미지 삭제 버튼 동작
		$(".deleteImg").on("click", function(event){
			// event : 현재 발생한 이벤트에 대한 정보가 담긴 객체
			event.stopPropagation(); 		// 이벤트가 연달아 실행되는 것을 방지
			
			// 기존 이미지 태그를 삭제하고 새로운 이미지 태그를 만들어서 제자리에 추가
			
			// 기존 이미지 태그
			var $beforeImg = $(this).prev();
			
			// 기존 정보를 토대로 새로운 이미지 태그 생성
			var $newImg = $("<img>", {id : $beforeImg.attr("id"),
																width : $beforeImg.css("width"),
																height : $beforeImg.css("height")	});
			
			$(this).prev().remove();		// 기존 이미지 태그 삭제
			$(this).before($newImg); 		// 새로운 이미지 태그 추가
			
			
			// 특정 fileLevel의 요소가 삭제 되었음을 알리기 위해 deleteImages에 기록
			// == deleteImages에 클릭된 삭제버튼 인덱스와
			// 일치하는 deleteImages 인덱스 값을 true로 변경
			
			deleteImages[$(".deleteImg").index(this)] = true;
			
			console.log(deleteImages);
			
			// 삭제 버튼이 클릭된 경우
			// 해당 이미지와 연결된 input type="file" 태그의 값을 없앰
			$("#img" + ($(".deleteImg").index(this) )).val("");
			
		});
		
	</script>


</body>
</html>