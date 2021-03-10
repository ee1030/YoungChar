//지도-------------------------------------------------------------------------------------------------------
			
function map(company){


//console.log(company);
//로그인한 사람 주소 가져와서 중심좌표에 넣기..?
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.524279537727175, 127.04819748390128), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//console.log(company.length);
    //반복문으로 가져온 업체 주소 배열 좌표에 넣기
    for(var i = 0; i < company.length ; i++){
        
    var start = company[i].memberAddr.indexOf(",") + 1;
    var end = company[i].memberAddr.lastIndexOf(",");
    company[i].memberAddr = company[i].memberAddr.substring(start,end);
    //console.log(company[i].memberAddr);
    // 주소로 좌표를 검색합니다
            geocoder.addressSearch(company[i].memberAddr, function(result, status) {
                
                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
                    var Y =result[0].y;
                    var X = result[0].x;
                    
                // var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(Y, X)
                    });
                            
                    marker.setMap(map);
                    
                }

                            
                
            }); 
    
    }//반복문 끝

    $("#searchNo").html("검색결과 "+company.length+"건");
    $("#centerTable").html("");
    var com = company;
    //console.log(com);
    for(var c of com){
        var tr = $("<tr>");
        var td = $("<td>");
        td.html("<h4>"+"<span>"+c.brand+"</span>"+"<span>"+c.cooName +"</span>"+"</h4>"+"<h5>"+
         c.memberAddr+"</h5>"+"<span>전화번호 : </span>"+ "<span class='memPhone'>"+c.memPhone+"</span>"+"<span class='spanNone memNo'>"+c.memberNo+"</span>"+
         "<span class='spanNone testDriveNo'>"+c.testDriveNo+"</span>");
        tr.html(td);
        $("#centerTable").append(tr);
    }

      
           
        //ajax 완료시 수행
		if(checkFlag == true){
            //console.log(com[0].memberAddr);
            addTo(com[0].memberAddr, com[0].brand, com[0].memberNo, com[0].cooName, com[0].memPhone, com[0].testDriveNo);
        }

        //목록 클릭시 지도 이동 시키기------------------------------------------------------
			$(document).on("click","tr", function(){

                //선택시 테두리 색 추가
                $(this).addClass("carSelect");
                $(this).siblings().removeClass("carSelect"); 
								
								$("#Bar3-1").hide();
								$(".dt").slideDown();
                

				addr = $(this).children().children("h5").text();
				brand = $(this).children().children("h4").children().first();
                brandName = brand.text();
                cooName = brand.next().text();
                memPhone = $(this).children().children(':nth-child(4)').text();
                memberNo = $(this).children().children(':nth-child(5)').text();
                testDriveNo = $(this).children().children(':nth-child(6)').last().text();
                addTo(addr, brandName,memberNo, cooName, memPhone, testDriveNo);
	            
                $(".centerName").text(brandName+" "+cooName);

            //input에 값추가하기
                $("input[name=testDriveCarNo]").val(testDriveNo);
                //console.log(testDriveNo);
          
        });

        function addTo(addr, brand, memberNo, cooName, memPhone, testDriveNo){
            
				geocoder.addressSearch(addr, function(result, status) {

                    // 정상적으로 검색이 완료됐으면
                     if (status === daum.maps.services.Status.OK) {
            
                        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                        panTo(coords);

                        // 커스텀 오버레이에 표시할 컨텐츠 입니다
                        // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                        // 별도의 이벤트 메소드를 제공하지 않습니다 
                        var content = '<div class="wrap" id='+memberNo+'>' + 
                                    '    <div class="info">' + 
                                    '        <div class="title">' + 
                                    brand +" " +cooName +
                                    '            <div class="close" title="닫기"></div>' + 
                                    '        </div>' + 
                                    '        <div class="body">' + 
                                    '            <div class="desc">' + 
                                    '               <span class="spanNone testDriveNo">'+ testDriveNo +'</span>' +
                                    '                <div class="ellipsis">'+ addr+'</div>' + 
                                    '                 <div class="ellipsis memPhone">'+"전화번호 : "+ memPhone+'</div>' + 
                                    '            </div>' + 
                                    '        </div>' + 
                                    '    </div>' +    
                                    '</div>';

                        // 마커 위에 커스텀오버레이를 표시합니다
                        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                        var overlay = new kakao.maps.CustomOverlay({
                            content: content,
                            map: map,
                            position: coords       
                        });

                         // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                                overlay.setMap(map);
                        
                           
                        $(document).on("click","#"+memberNo, function(){
                            $(this).css("display","none");
                            
                        });     
                     }
                });
          
        }
        
        function panTo(coords) {
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = coords;
            
            // 지도 중심을 부드럽게 이동시킵니다
            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            map.panTo(moveLatLon);            
        }  

        
        
       

}


