<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="icon" href="${contextPath}/resources/assets/images/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon.png" type="image/x-icon">
    <title>login</title>
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/fontawesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/feather-icon.css">
    <!-- Plugins css start-->
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/vendors/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/style2.css">
    <link id="color" rel="stylesheet" href="${contextPath}/resources/assets/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/assets/css/responsive.css">
    <style>
    	#kakao{
    		width: 100%;
    		height: 60px;
    	}
    	
    	#kakao:hover{
    		cursor: pointer;
    	}
    	
    	#nLogin{
    		height: 60px;
    		margin-top: 10px;
    	}
    </style>
</head>
<body>

<c:if test="${!empty swalTitle}">
		<script>
			swal({icon : "${swalIcon}",
				 title : "${swalTitle}",
				 text : "${swalText}"});
		</script>
		<%-- <c:remove var="swalIcon"/>
		<c:remove var="swalTitle"/>
		<c:remove var="swalText"/> --%>
	</c:if>
<div class="container-fluid p-0">
      <div class="row m-0">
        <div class="col-12 p-0">    
          <div class="login-card">
            <div>
              <div><a class="logo" href="#"><img class="img-fluid for-dark" src="${contextPath}/resources/assets/images/logo/logo_dark.png" alt="looginpage"></a></div>
              <div class="login-main"> 
                <form class="theme-form" action="loginAction" method="post">
                  <h4>로그인</h4>
                  <p>Enter your id & password to login</p>
                  <div class="form-group">
                    <label class="col-form-label">ID</label>
                    <input class="form-control" type="text" name="memberId" id="memberId" required="" placeholder="abcd1234" value="${cookie.saveId.value}" autofocus>
                  </div>
                  <div class="form-group">
                    <label class="col-form-label">Password</label>
                    <input class="form-control" type="password" name="memberPwd" id="memberPwd" required="" placeholder="*********">
                    <div class="show-hide"><span class="show">                         </span></div>
                  </div>
                  <div class="form-group mb-0">
                    <div class="checkbox p-0">
                      <input id="checkbox1" type="checkbox" name="saveId"
                      	<c:if test="${!empty cookie.saveId.value}">
													checked
												</c:if>
                      >
                      <label class="text-muted" for="checkbox1">아이디 저장</label>
                    </div><a class="link" href="${contextPath}/member/findId">아이디/비밀번호 찾기</a>
                    <button class="btn btn-primary btn-block" type="submit">로그인</button>
                  </div>
                  <h6 class="text-muted mt-4 or">Or Sign in with</h6>
                  <div class="social mt-4">
                  <img id="kakao" src="${contextPath}/resources/assets/images/logo/large.png" onclick="klogin()">
                  <!-- 네이버 로그인 창으로 이동 -->
									<div id="naver_id_login" style="text-align:center"><a href="${url}">
										<img width="100%" id="nLogin" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
									</div>

                  </div>
                  <p class="mt-4 mb-0">회원이 아니세요?<a class="ms-2" href="${contextPath}/member/signUp">회원가입 하기</a></p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
      <script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
      <script src="${contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
      <script src="${contextPath}/resources/assets/js/icons/feather-icon/feather.min.js"></script>
      <script src="${contextPath}/resources/assets/js/icons/feather-icon/feather-icon.js"></script>
      <script src="${contextPath}/resources/assets/js/config.js"></script>
      <script src="${contextPath}/resources/assets/js/script.js"></script>
      
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  		
  		
  		<script>
	  		
	  	   /* 카카오 로그인 */
	  	    window.Kakao.init('943fedae8b7b18638ffecff5fde84e3e');
	  	    function klogin() {
	  	        window.Kakao.Auth.login({
	  	            scope:'profile, account_email',
	  	            success: function(authObj) {
	  	                //console.log(authObj);
	  	                window.Kakao.API.request({
	  	                    url: '/v2/user/me',
	  	                        success: res => {
	  	                        const kakao_account = res.kakao_account
	  	                        //console.log(kakao_account);
	  	                        //console.log(kakao_account.profile.nickname);
	  	                        //console.log(kakao_account.email);
	  	                          
	  	                        $.ajax({
	  	                           url: "kakaoLogin",
	  	                           data: {
	  	                              "memberId": kakao_account.email,
	  	                              "memberNm": kakao_account.profile.nickname,
	  	                              "memberPwd": Kakao.Auth.getAccessToken()
	  	                           },
	  	                           type: "post",
	  	                           		success: function(loginMember){
	  	                           		if(loginMember != null){
	  	                              swal({icon:"success", title:"로그인 성공!"}).then(function(){
	  	                                   window.location.href = "../";                                 
	  	                              });                       
	  	                              //console.log(Kakao.Auth.getAccessToken());
	  	                              //console.log(loginMember);
	  	                           }},
	  	                           error: function(){
	  	                              console.log("ajax 통신 실패");
	  	                           }
	  	                        });  
	  	                    }
	  	                });
	  	            },
	  	            fail: function() {
	  	                alert('err');
	  	            }
	  	        });   
	  	    }
	  	    
	  	    
	  	    
	  	    
  		</script>
    </div>
</body>
</html>