<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>car management</title>

<!-- Preloader CSS-->
      <style>
         .card{
         font-family: 'Noto Sans KR', sans-serif;
         }
      
         .rn-header{
            position: inherit !important;
            background-color: rgb(85, 85, 85);
         }

         
         .rn-service-item {
            width: 230px;
            display: inline-block;
            margin: 25px;
         }
         
         .card {
            background-color: #79cb4d1f !important;
            width: 850px;
         }
         
         .rn-widget {
            margin-bottom: 40px;
            font-size: 20px;
            line-height: 60px;
         }
         
         #carSearch{
         	 margin-bottom : 50px;
         }
         
         .titleName{
            margin-top: 30px;
            margin-bottom: 30px;
         }
         
         #searchBtn{
            background-color: #00D231;
         }

         #carList{
            margin-bottom : 15px;
         }
         #carListBtn{
            background-color: #00D231
         }
         
         .rn-car-item-review.delete{
            display:none;
         }
         .rn-car-item-review{
         		cursor: pointer;
         }
         
         #text{
            text-align: center;
            line-height : 45px;
         }
         
</style>




</head>
<body class="rn-preloader">

   <!-- Header-->
   <jsp:include page="../common/header.jsp"/>
   <!-- End Header-->


   <!-- Page Content-->
   <section class="rn-section">
      <div class="container">
         <div class="row">
         		<div id="side-bar">
                  <!-- Sidebar-->
                  <jsp:include page="sideMenu.jsp"/>
                  <!-- End Slidebar-->

            </div>
            <div class="col-lg-8 order-lg-1 pb-15">

               <div class="col-lg-12">

                  <!-- Section Title-->
                  <div class="rn-section-title   ">
                     <h2 class="rn-title">car management</h2>
                     <p>시승 가능 자동차 등록 / 수정 /삭제</p>
                     <span class="rn-title-bg">car management</span>
                  </div>

               </div>
               
					            
					      <!-- End Page Content-->
					   <br>
					   <div class="container" id="carSearchArea">
					         <div class="row">
					            <div  class="col-lg-12">
					              <h3 class="titleName">시승 가능 차량 추가</h2>
					            </div>
					         </div>
					         <!-- 자동완성 기능 넣기 -->
					         <div class="row">
					            <div class="col-lg-4">
					               <input type="text" placeholder="모델명을 입력하세요." id="carSearch">
					            </div>
					            <div class="col">
					               <button id="searchBtn" class="btn-main btn btn-shadow">검색</button>
					            </div>
					         </div>
							 <div class="row" id="addedCar">

							 </div>
					        
					      
					      <br>
					      <hr>
					
					      <!-- Cars-->
					         <div class="container">
					            <div class="row" id="addedCarList">
						            <div  class="col-lg-12">
						              <h3 class="titleName">시승 가능 차량</h2>
						            </div>
					               <%-- <c:choose>
					                  <c:when test="${empty carItem.carNo}">
					                     <div class="col-lg-12">
					                        <h3 id="text">등록된 차량이 없습니다.</h3>
					                     </div>
					                  </c:when>
					                  
					                  <c:otherwise> --%>
					                     <!-- Car Item-->
					                     <div class="col-lg-3 col-md-2">
					                     <div class="rn-car-item added">
					                        <span class="rn-car-item-review delete">
					                           x
					                        </span>
					                        <div class="rn-car-item-thumb">
					                          
					                              <img class="img-fluid" src="${contextPath}/resources/assets/images/tesla_model3.jpg" alt="Black Sedan" srcset="${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x"/>
					                           
					                        </div>
					                        <div class="rn-car-item-info">
					                           <h3>
					                              Toyota Etios
					                           </h3>
					                        </div>
					                     </div>
					                  </div>
					                  <!-- End Car Item-->
					                     
					                 <%--  </c:otherwise>
					                  
					               
					               </c:choose> --%>
					                  
					                  
					                     
					            </div>
					            <!-- end row -->
					         </div>
					         
					         
					         <!-- 등록된 자동차 검색창 영역 -->
					         <c:choose>
					            <c:when test="${!empty carItem.carNo}">
					               <div class="row justify-content-md-center" id="carList">
					                <div class="col-lg-4">
					                     <input type="text" placeholder="모델명을 입력하세요." id="carListSearch">
					                  </div>
					                <div class="col-lg-1">
					                     <button id="carListBtn" class="btn-main btn btn-shadow">검색</button>
					                  </div>
					              </div>
					           </c:when>
					           </c:choose>
					        <!-- 등록된 자동차 검색창 영역 끝 -->
					         
					           <c:choose>
					            <c:when test="${!empty carItem.carNo}">
					                  <div class="row">
					                  
					                     <div class="col-lg-12">
					
					                        <!-- Cars Pagination-->
					                        <nav class="rn-pagination rn-pagination-center">
					                           <ul>
					                              <li>
					                                 <a href="#">
					                                    <i class="fas fa-angle-left"></i>
					                                 </a>
					                              </li>
					                              <li>
					                                 <a class="rn-active" href="#">1</a>
					                              </li>
					                              <li>
					                                 <a href="#">2</a>
					                              </li>
					                              <li>
					                                 <a href="#">3</a>
					                              </li>
					                              <li>
					                                 <a href="#">4</a>
					                              </li>
					                              <li>
					                                 <a href="#">
					                                    <i class="fas fa-angle-right"></i>
					                                 </a>
					                              </li>
					                           </ul>
					                        </nav>
					                        <!-- End Cars Pagination-->
					
					               
					                     </div>
					                  </div>
					               </c:when>
					               </c:choose>
					         </div>
								</div>
							</div>
						</section>
				
				
   <!-- Site Footer-->

   <!-- End Site Footer-->

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
   <script src="${contextPath}/resources/assets/js/carManagement.js"></script>
   <script>
   	/*<div class="col-lg-12">
					                        <h3 id="text">등록된 차량이 없습니다.</h3>
					                     </div>*/
					                     
	   $(document).ready(function(){
		   carList();
	   });
   	//차량 목록 조회
   function carList(){
   		
			var addedCarList = $("#addedCarList");
			addedCarList.remove();
			
   		$.ajax({
   		type : "post",
   		url : "carList",
   		success(cList){
   			if(cList != null){
   				$.each(cList, function(index, value){
					console.log(cList);
				 	var col =$("<div>").addClass("col-lg-3 col-md-2 carNo" + value.carNo);
					var rn = $("<div>").addClass("rn-car-item");
					var span = $("<span>").addClass("rn-car-item-review plus").text("X");
					var thumb = $("<div>").addClass("rn-car-item-thumb");
					var img = $("<img>").addClass("img-fluid").attr("alt", "자동차 이미지").attr("src", value.filePath).attr("srcset", "${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x");
					thumb.append(img);
					rn.append(span);
					rn.append(thumb);

					var info = $("<div>").addClass("rn-car-item-info");
					var h3 = $("<h3>").text(value.carName);
					var carNo = $("<span>").css("display","none").text(value.carNo);
					info.append(carNo);
					info.append(h3);
					rn.append(info);
					col.append(rn);
					addedCarList.append(col); 
					});
   			}else{
   				var div = $("<div>").addClass("col-lg-12");
   				var h3 = $("<h3>").attr("id","text").text("등록된 차량이 없습니다.");
   				div.append(h3);
   				$("#addedCarList").append(div);
   			}
   		}
   	});
	}
      // 차량추가 검색
      $("#searchBtn").on("click", function(){
					var addedCar = $("#addedCar").html("");
    	  	
          var carName = $("#carSearch").val();
         	console.log(carName);
          $.ajax({
        	   type: "post",
             url : "carSearch",
             data : {"carName1" : carName},
             success(result){
            	 if(result != null){
					
					console.log(result);
					$.each(result, function(index, value){
							console.log(result);
						 	var col =$("<div>").addClass("col-lg-3 col-md-2 carNo" + value.carNo);
							var rn = $("<div>").addClass("rn-car-item");
							var span = $("<span>").addClass("rn-car-item-review plus").text("+");
							var thumb = $("<div>").addClass("rn-car-item-thumb");
							var img = $("<img>").addClass("img-fluid").attr("alt", "자동차 이미지").attr("src", value.filePath).attr("srcset", "${contextPath}/resources/assets/images/tesla_model3.jpg 1x, ${contextPath}/resources/assets/images/tesla_model3.jpg 2x");
							thumb.append(img);
							rn.append(span);
							rn.append(thumb);
		
							var info = $("<div>").addClass("rn-car-item-info");
							var h3 = $("<h3>").text(value.carName);
							var carNo = $("<span>").css("display","none").text(value.carNo);
							info.append(carNo);
							info.append(h3);
							rn.append(info);
							col.append(rn);
							addedCar.append(col); 
					});
					
				}
             },
             error(){
            	 console.log("차량 검색 실패");
             }
          
          });
          
      });
      
      
     //차량추가 
     $(document).on("click", ".rn-car-item-review.plus", function(){
    	 var carNo = $(this).next().next().children("span").text();
			 var addedCarList = $("#addedCarList");
    	 console.log(carNo);
    	 $.ajax({
    		 type : "post",
    		 url : "addCar",
    		 data : {"carNo": carNo},
    		 success(result){
    			 console.log(result);
    			 if(result > 0){ //추가 성공 시
    				 
    				$(".carNo"+carNo).remove();
    				carList();
    			 }else{
    				 alert("이미 추가한 자동차입니다.");
    			 }
    		 },
    		 error(){
    			 console.log("차량 추가 실패");
    			 
    		 }
    		 
    	 });
     });
     
   </script>

</body>
</html>