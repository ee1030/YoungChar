
		
	//지도-------------------------------------------------------------------------------------------------------
	/* var company = ${company}; //업체 리스트 담을 객체
	console.log(company);
	 */



	//지도 함수********************************************************************************************
	function map(company){
		
		console.log(company);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(37.559963253951885, 126.98987154908482), // 지도의 중심좌표(서울중심)
			level: 6 // 지도의 확대 레벨
		};  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소를 좌표로 바꾸기
		var position = addrToLocation(company); 
		console.log("----------");
		console.log(position);
		//console.log(position.length);
	

		/* position.forEach(function(item, index){
			console.log();
		});
 */
		
		
		

	}//지도함수 끝

	


// 결과값으로 받은 위치를 마커로 표시하는 함수*****************************************
function addM(Y, X){
	var marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(Y, X)
	});
			
	marker.setMap(map);
		
};

// 지도 중심을 부드럽게 이동시키는 함수**********************************************
function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
    
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}     




// 주소-좌표 변환 객체를 생성합니다
//var geocoder = new kakao.maps.services.Geocoder();

//var locations = ${company}; 

//주소로 장소 좌표 얻기 ********************************************************************************************
function addrToLocation(locations){
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열 
	//var positions = [];
	let positions = {};

	//반복문으로 장소 배열에 있는 주소들 좌표로 바꿔서 넣기
	/* for(var i = 0; i < locations.length ; i++){
					
		var start = locations[i].memberAddr.indexOf(",") + 1;
		var end = locations[i].memberAddr.lastIndexOf(",");
		locations[i].memberAddr = locations[i].memberAddr.substring(start,end); //주소만 잘라서 넣기(우편번호 제거)

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(locations[i].memberAddr, function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
	
			var Y =result[0].y;
			var X = result[0].x;
		
			//positions.push({Y,X});
			positions.push(X);
			positions.push(Y);
		} 
	});    

	} */


	locations.forEach(function(item, index){
					
		var start = item.memberAddr.indexOf(",") + 1;
		var end = item.memberAddr.lastIndexOf(",");
		item.memberAddr = item.memberAddr.substring(start,end); //주소만 잘라서 넣기(우편번호 제거)

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(item.memberAddr, function(result, status) {
		
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
		
				var Y =result[0].y;
				var X = result[0].x;
			
				//positions.push({Y,X});
				positions.X = X;
				positions.Y = Y;
			} 
		});    

	});
	return positions;
}



/* 설명 띄우는 코드
company = ${company}; //업체 리스트 담을 객체
var iwContent = '<div style="padding:5px;">'
								+ company[index].brand + '<br>'+
								company[index++].cooName+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

var infowindow = new kakao.maps.InfoWindow({
	content : iwContent,
	removable : iwRemoveable
}); 

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener( marker, 'click', function() {
	
		// 마커 위에 인포윈도우를 표시합니다
	infowindow.open(map,  marker );  
}); */