<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Company Info</title>

		<!-- Preloader CSS-->
		<style>
				.card{
				font-family: 'Noto Sans KR', sans-serif;
			}
		
			.rn-header{
				position: inherit !important;
				background-color: #112E3B;
			}
			

			.bg-wrap .user-logo .img {
				width: 100px;
				height: 100px;
				border-radius: 50%;
				margin: 0 auto;
				margin-bottom: 10px; }
				
			.bg-wrap .user-logo h3 {
				color: black;
				font-size: 18px; }

			.img {
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center center; 
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

			.rn-pagination {
				margin-bottom: 40px;
				text-align: center;
			}

			#select1{
				width: 100px;
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

			.left{
				float: left;
			}

			.right{
				float: right;
			}
			
			.form-label{
				font-weight: bold;
			}
			
			.btn{
				height: 40px;
			}
			
			.fa-asterisk{
				color: red;
				font-size: 8px;
				margin-right: 5px;
			}
			
			.icon-wrapper{
				position: absolute;
		    bottom: 90px;
		    left: 52%;
		    display: -webkit-box;
		    display: -ms-flexbox;
		    display: flex;
		    -webkit-box-pack: center;
		    -ms-flex-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    -ms-flex-align: center;
		    align-items: center;
		    height: 40px;
		    width: 40px;
		    border-radius: 50%;
		    background-color: #fff;
		    cursor: pointer;
		    overflow: hidden;
		    margin: 0 auto;
		    font-size: 17px;
		    -webkit-box-shadow: 0 0 6px 3px rgb(68 102 242 / 10%);
				border : 1px solid #d3d3d3b3 !important;
			}
		
		</style>

	</head>
	<body class="rn-preloader">

		<!-- Header-->
		<jsp:include page="../common/header.jsp"/>
			<!-- End Header-->


		<c:set var="address" value="${fn:split(loginMember.memberAddr , ',' ) }"/>

		<!-- Page Content-->
		<section class="rn-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 order-lg-1 pb-15">
						<div class="col-xl-8">
							<form class="card" method="POST" action="updateAction" name="updateAction" enctype="multipart/form-data" onsubmit="return updateValidate();">
							  <div class="card-header">
									<div class="img bg-wrap text-center">
										<div class="user-logo">
										
											<c:choose>
												<c:when test="${!empty company.memImgPath}">
													<img class="img" id="contentImg1" src="${contextPath}${company.memImgPath}/${company.memImgName}">
												</c:when>
												<c:otherwise>
													<img class="img" id="contentImg1" src="${contextPath}/resources/assets/images/user-basic.png">
												</c:otherwise>
											</c:choose>		
											
											
											<input type="file" id="fileArea" name="image" onchange="LoadImg(this)" style="display:none"> 
											<div id="insertImage" class="icon-wrapper"><i class="icofont icofont-pencil-alt-5"></i></div>

											<h4 class="card-title mb-0">${company.categoryNm}&nbsp;${company.cooName}</h4>
											<h6 class="card-title mb-0">${company.memId}</h6>
										</div>
									</div>
								<div class="card-options"><a class="card-options-collapse" href="#" data-bs-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a><a class="card-options-remove" href="#" data-bs-toggle="card-remove"><i class="fe fe-x"></i></a></div>
							  </div>
							  <div class="card-body">
								<div class="row">
								  <div class="col-md-12">
									<div class="mb-3">
									  <i class="fas fa-asterisk"></i><label class="form-label"> 현재 비밀번호</label>
									  <input id="memberPwd" name="memberPwd" class="form-control" type="password" placeholder="정보 수정을 위해 현재 비밀번호를 입력해주세요." required>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">새 비밀번호</label>
									  <input id="newPwd1" name="newPwd" class="form-control" type="password" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <label class="form-label">새 비밀번호 확인</label>
									  <input id="newPwd2" class="form-control" type="password" placeholder="">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <i class="fas fa-asterisk"></i><label class="form-label"> 전화번호 </label>
									  <input id="phone" name="phone" class="form-control" type="text" value="${loginMember.phone}" maxlength="13" required>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <i class="fas fa-asterisk"></i><label class="form-label"> 이메일</label>
									  <input id="memberEmail" name="memberEmail" class="form-control" type="text" value="${loginMember.memberEmail }" required>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-4">
									<div class="mb-3">
									  <i class="fas fa-asterisk"></i><label class="form-label"> 주소</label>
									  <input name="post" id="post" class="form-control postcodify_postcode5" type="text" value="${address[0]}">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-2">
									<div class="mb-3">
									  <label class="form-label">&nbsp;</label>
									  <button id="postcodify_search_button" class="form-control btn btn-outline-success" type="button">검색</button>
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input name="address1" id="address1" class="form-control postcodify_address" type="text" placeholder="도로명주소" value="${address[1]}">
									</div>
								  </div>
								  <div class="col-sm-6 col-md-6">
									<div class="mb-3">
									  <input name="address2" id="address2" class="form-control  postcodify_details" type="text" placeholder="상세주소" value="${address[2]}" required>
									</div>
								  </div>
								</div>
							  </div>
							  <div class="card-footer text-end">
								<button class="left btn btn-light active text-dark" type="button" id="secession">계정 탈퇴</button>
								<button class="right btn btn-success" type="submit">정보 수정</button>
							  </div>
							</form>
						  </div>


		
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
		
		
	<!-- 도로명 주소 API -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	
		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function(){
			
			
			$("#insertImage").on("click", function(){ // 이미지 영역이 클릭 되었을 때
				// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
				$("#fileArea").click();
			});
			
			
		});
		
		
	  // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	  function LoadImg(value) {
		  // value.files : 파일이 업로드되어 있으면 true
		  // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
		  
			if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
				
				var reader = new FileReader();
       	// 자바스크립트 FileReader
      	// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
      	// 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
      	// 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
      	
      	reader.readAsDataURL(value.files[0]);
        // FileReader.readAsDataURL()
      	// 지정된의 내용을 읽기 시작합니다. 
      	// Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	
      	
      	reader.onload = function(e){
        	// FileReader.onload
					// load 이벤트의 핸들러. 
					// 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	
      		
					// 읽어들인 내용(이미지 파일)을 화면에 출력
					// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
					
							$(".user-logo").children("img").attr("src", e.target.result);
					
      	 }
			}
		}
	  
		
	  $(document).on('change', '.img', function(){
			
 				var formData = new FormData();
				formData.append("image", $("input[name='image']")[0].files[0]); 
				
				console.log($("input[name='image']")[0].files)
				
				$.ajax({
					url : "${contextPath}/company/changeProfileImg",
					type : "POST",
					enctype : "multipart/form-data",
					data : formData,
					contentType : false,
					processData : false,
					success : function(result){
						
						if(result > 0){	
							swal({icon : "success" , title : "프로필 사진이 변경되었습니다."});
						}else{
							swal({icon : "error" , title : "프로필 사진 변경에 실패했습니다."});
						}
						
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				});  
			
		});
		

		
	
		// 도로명 주소 API
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button")
					.postcodifyPopUp();
		});
		
		$("#phone").on("input", function() {
			if ($(this).val().length > $(this).prop("maxLength")) {
				$(this).val($(this).val().slice(0, $(this).prop("maxLength")));
			}
		});

		// 각 유효성 검사 결과를 저장할 객체
		var validateCheck = {
			"phone" : false,
			"memberEmail" : false,
			"newPwd" : true
		};

		
		// submit 동작
		function updateValidate() {
			
			var $phone = $("#phone");
			var $email = $("#memberEmail");
			var $newPwd1 = $("#newPwd1");
			var $newPwd2 = $("#newPwd2");

			// 전화번호 유효성 검사
			var regExp1 = /^[0][0-9]{1,2}-[0-9]{3,4}-[0-9]{4}/; 

			if (!regExp1.test($phone.val()) ) {
				validateCheck.phone = false;
			} else {
				validateCheck.phone = true;
			}

			// 이메일 유효성 검사
			var regExp2 = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

			if (!regExp2.test($email.val())) {
				validateCheck.memberEmail = false;
			} else {
				validateCheck.memberEmail = true;
			}
			
			// 비밀번호 유효성 검사
			var regExp3 = /^[A-Za-z0-9]{6,12}$/;
				
			if( $newPwd1.val().length && $newPwd2.val().length > 0){
				
				if(!regExp3.test($newPwd1.val())){ 
					alert("유효하지 않은 비밀번호 입니다.");
					$("#newPwd1").focus();
					
					return false;
	      }
				
				if($newPwd1.val() != $newPwd2.val()){
					alert("새 비밀번호가 일치하지 않습니다.");
					$("#newPwd2").focus();
					
					return false;
				}
				
			}else{
				validateCheck.newPwd = true;
			}
				

			

			for ( var key in validateCheck) {
				if (!validateCheck[key]) {
					var str;
					switch (key) {
					case "phone": str = "전화번호"; break;
					case "memberEmail": str = "이메일";	break;
					case "newPwd": str = "비밀번호";	break;
					}

					swal({icon : "warning",	title : str + " 형식이 유효하지 않습니다."})
					.then(function() {
						var id = "#" + key;
						$(id).focus();
					});

					return false;
				}
			}
			



			$memberAddr = $("<input>", {
								type : "hidden",
								name : "memberAddr",
								value : $("#post").val() + "," + $("#address1").val() + "," + $("#address2").val()
							});
			
			$("form[name='updateAction']").append($memberAddr);
		}
		
		$("#secession").click(function(){
			
			if(confirm("정말 탈퇴하시겠습니까?")){
				$("form[name='updateAction']").attr("action", "secession");
				$("form[name='updateAction']").submit();
			}
			
			
			
		});
		
		</script>

	</body>
</html>