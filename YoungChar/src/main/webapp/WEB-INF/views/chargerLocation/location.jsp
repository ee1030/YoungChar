<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>충전소 위치</title>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.4);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

#keyWord {
float: left;
}

#searchButton{
	margin-top: 15px;
}
</style>

<!--
		All CSS Codes Loaded
		Ex: bootstrap, fontawesome, style, etc.
		-->
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

	<!-- Page Title-->
	<div class="rn-page-title">
		<div class="rn-pt-overlayer"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="rn-page-title-inner">
						<h1>MAP</h1>
						<p>당신에게 가까운 충전소를 찾아보세요!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Title-->


	<!-- Page Content-->
	<div class="rn-section">
		<div class="container pb-15">
			<div class="row">
				<div class="map_wrap">
				
				<hr>
					<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					<div id="menu_wrap" >
						<div class="option">
							<div>
								<form onsubmit="test(); return false;">
									<p  id="keyWord">키워드 : </p><input type="text" value="" id="keyword" size="15" placeholder="키워드를 입력하면 화면이 나타납니다">
									<button id="searchButton" type="submit">검색하기</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Content-->

	<jsp:include page="../common/footer.jsp"/> 

	<!--
		All JavaScripts Codes Loaded
		Ex: jquery, bootstrap, etc.
		-->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd19bab7101200951c3127b359fc8c3f"></script>
	<script>
		$(function(){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new kakao.maps.LatLng(37.55516625903957, 126.9707168380652), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		})
	
		var keyword = "";

		function test() {
			keyword = $("#keyword").val();

			findCharger(keyword);
		}

		function findCharger(keyword) {
			var xhr = new XMLHttpRequest();
			var url = 'http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList'; /*URL*/
			var queryParams = '?'
					+ encodeURIComponent('ServiceKey')
					+ '='
					+ 'BaNcWD4e9CFC4lkfKsgboUrtN04RAcf5YFiZNgDSutaT2%2FCEgIBC9MKuvt5JL8CbbjzhOi3ghQp%2F2rsm%2FDSZGw%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '='
					+ encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '='
					+ encodeURIComponent('100'); /**/
			queryParams += '&' + encodeURIComponent('addr') + '='
					+ encodeURIComponent(keyword); /**/
			xhr.open('GET', url + queryParams);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var responseData = xhr.responseXML;
					var addrs = responseData.getElementsByTagName("addr");
					var lats = responseData.getElementsByTagName("lat");
					var longis = responseData.getElementsByTagName("longi");
					var csNms = responseData.getElementsByTagName("csNm");
					var cpTps = responseData.getElementsByTagName("cpTp");
					var chargeTps = responseData
							.getElementsByTagName("chargeTp");
					var cpStats = responseData.getElementsByTagName("cpStat");
					var statUpdateDatetimes = responseData
							.getElementsByTagName("statUpdateDatetime");

					makeMarkers(addrs, lats, longis, csNms, cpTps, chargeTps,
							cpStats, statUpdateDatetimes);

					/* 		         console.log(addrs[0].childNodes[0].nodeValue);
					 console.log(lats[0].childNodes[0].nodeValue);
					 console.log(longis[0].childNodes[0].nodeValue); */
				}

			};

			xhr.send('');
		}

		function makeMarkers(addrs, lats, longis, csNms, cpTps, chargeTps,
				cpStats, statUpdateDatetimes) {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new kakao.maps.LatLng(lats[0].childNodes[0].nodeValue,
						longis[0].childNodes[0].nodeValue), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [];

			var chargerType = "";
			var chargerMode = "";
			var chargerStat = "";

			for (var i = 0; i < addrs.length; i++) {

				switch (cpTps[i].childNodes[0].nodeValue) {
				case "1":
					chargerType = "B타입(5핀)";
					break;
				case "2":
					chargerType = "C타입(5)핀";
					break;
				case "3":
					chargerType = "BC타입(5핀)";
					break;
				case "4":
					chargerType = "BC타입(7핀)";
					break;
				case "5":
					chargerType = "DC차데모";
					break;
				case "6":
					chargerType = "AC3상";
					break;
				case "7":
					chargerType = "DC콤보";
					break;
				case "8":
					chargerType = "DC차데모 + DC콤보";
					break;
				case "9":
					chargerType = "DC차데모 + AC3상";
					break;
				case "10":
					chargerType = "DC차데모 + AC3상 + DC콤보";
					break;
				}

				switch (chargeTps[i].childNodes[0].nodeValue) {
				case "1":
					chargerMode = "완속 충전";
					break;
				case "2":
					chargerMode = "급속 충전";
					break;

				}
				
				
				switch (cpStats[i].childNodes[0].nodeValue) {
				case "1":
					chargerStat = "충전 가능";
					break;
				case "2":
					chargerStat = "충전 중";
					break;
				case "3":
					chargerStat = "고장/점검";
					break;
				case "4":
					chargerStat = "통신장애";
					break;
				case "5":
					chargerStat = "통신 미연결";
					break;

				}
				
				
				positions.push({
							addr : addrs[i].childNodes[0].nodeValue,
							latlng : new kakao.maps.LatLng(
									lats[i].childNodes[0].nodeValue,
									longis[i].childNodes[0].nodeValue),
							csNm : csNms[i].childNodes[0].nodeValue,
							cpTp : chargerType,
							chargeTp : chargerMode,
							cpStat : chargerStat,
							statUpdateDatetime : statUpdateDatetimes[i].childNodes[0].nodeValue
						});

			}

			console.log(positions);

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

			for (var i = 0; i < positions.length; i++) {

				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(24, 35);

				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng, // 마커를 표시할 위치
					addr : positions[i].addr, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage
				// 마커 이미지 
				});

				var infowindow = new kakao.maps.InfoWindow({

					// 인포윈도우에 표시할 내용
					content : '<div style="width:300px; text-align:center; padding-top:4px;">' + '<b>' + positions[i].csNm + '</b>' + '<br>' + '주소 : '
							+ positions[i].addr + '<br>' + '충전기 단자 : '
							+ positions[i].cpTp + '<br>' + '충전 타입(완속/급속) : '
							+ positions[i].chargeTp + '<br>' + '충전기 상태 : '
							+ positions[i].cpStat + '</div>'
				});

				kakao.maps.event.addListener(marker, 'mouseover',
						makeOverListener(map, marker, infowindow));
				kakao.maps.event.addListener(marker, 'mouseout',
						makeOutListener(infowindow));

			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
				return function() {
					infowindow.open(map, marker);
				};
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
				return function() {
					infowindow.close();
				};
			}
		}
	</script>
	
	


	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/starrr.min.js"></script>
	<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/assets/js/scripts.js"></script>
</body>
</html>