	// ----------------------------------------------------------------------------------
    function map(company){

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.5437096971089, 126.90423126379329), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var listData =  new Array();

	for(var p in company){
        listData.push({
        brand : p.brand,
        groupAddress : p.memberAddr,
        title : p.cooName,
        memPhone : p. memPhone,
    });

    }

	console.log(listData)
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };
/*
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 */
	console.log(listData);


	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 키워드로 장소를 검색합니다
	// listData[0].groupAddress
	// $("input[name=keyword]").val()
    //keyword2 는 검색한 키워드
	ps.keywordSearch(keyword2, placesSearchCB);

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);

	        var markerPosition  = new kakao.maps.LatLng(map.getCenter().getLat(), map.getCenter().getLng());


	    }
	}




	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();






	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "${contextPath}/resources/images/homepage/mark.png";

	var overlayList = [];


	for (let i=0; i < listData.length ; i++) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(listData[i].groupAddress, function(result, status) {

	    // 정상적으로 검색이 완료됐으면
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);


	     // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(24, 35);

	        // 마커 이미지를 생성합니다
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);


	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	            image : markerImage, // 마커 이미지
	        });




	        var content = '<div class="wrap rooonlist" id="lst'+i+'">' +
            '    <div class="info">' +
            '        <div class="title" id="'+  marker.getPosition() +'">' +  listData[i].title +
            '        </div>' +
            '        <div class="body">' +
            '            <div class="img">' +
            '                <img src="${contextPath}/resources/images/rooms/'+listData[i].img+'" width="73" height="70" id="' + listData[i].roomNo + '">' +
            '           </div>' +
            '            <div class="desc">' +
            '                <div class="ellipsis">'+listData[i].groupAddress+'</div>' +
            '                <div><a class="link infoLink" href="${contextPath}/room/view.do?no='
									+ listData[i].roomNo+'">매물 상세보기</a></div>' +
            '            </div>' +
            '        </div>' +
            '    </div>' +
            '</div>';

         // 마커 위에 커스텀오버레이를 표시합니다
         // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
         var overlay = new kakao.maps.CustomOverlay({
             content: content,
             map: map,
             position: marker.getPosition()
         });

         overlayList.push(overlay);

         // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
         kakao.maps.event.addListener(marker, 'click', function() {
             	// overlay.setMap(map);
             	$("#lst"+i).toggle(300);
         });


	        map.setCenter(coords);
	    }

	    console.log(map)
	})



	};

}