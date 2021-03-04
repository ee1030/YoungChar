//지도-------------------------------------------------------------------------------------------------------
			
function map(company){


console.log(company);
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

console.log(company.length);
var code = [];
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




}
