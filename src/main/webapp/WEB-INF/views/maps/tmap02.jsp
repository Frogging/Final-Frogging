<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx0e16f9f2f8cc49c8af5c5ad4cc51a5c2"></script>
<script type="text/javascript">
	var map = new Array();
	var marker_s, marker_e, marker_p1, marker_p2;
	var marker;
	var markerArr = [];
	var markers = [];
	var lonlat;
	var totalMarkerArr = [];
	var drawInfoArr = [];
	var resultdrawArr = [];
	var infoWindow;
	var count = 0;
	var address = new Array();
	var tDistance;
	var tTime;
	
	function initTmap() {
		// 1. 지도 띄우기
		var map_arr = new Array();
		var detail_arr = new Array();
		
		<c:forEach items = "${courseList}" var = "courseList">
			map_arr.push({
				course_no : "${courseList.course_no}",
				course_name : "${courseList.course_name}",
				course_info : "${courseList.course_info}",
				distance : "${courseList.distance}",
				time : "${courseList.time}"
			});
		</c:forEach>
		
		<c:forEach items = "${courseDetail}" var = "courseDetail">
			detail_arr.push({
				course_no : "${courseDetail.course_no}",
				waypoint : "${courseDetail.waypoint}",
				lat : "${courseDetail.lat}",
				log : "${courseDetail.log}",
				addr : "${courseDetail.addr}"
			});
		</c:forEach>
		
		console.log(map_arr);
		console.log(detail_arr);
		mapLoad(map_arr, detail_arr);
	}
	
	function mapLoad(map_arr, detail_arr){
		for(let i = 0; i < map_arr.length; i++){
			setTimeout(() => {
				var lat = new Array();
				var log = new Array();
				console.log(i);
				map[i] = new Tmapv2.Map("map_div_"+map_arr[i].course_no, {
					center : new Tmapv2.LatLng(37.56520450, 126.98702028),
						width : "500px",
						height : "400px",
						zoom : 15,
						zoomControl : false,
						scrollwheel : false
					});
				for(var j = 0; j < detail_arr.length; j++){
					if(map_arr[i].course_no == detail_arr[j].course_no){
						if(detail_arr[j].waypoint == 0){
							map[i].setCenter(new Tmapv2.LatLng(detail_arr[j].lat, detail_arr[j].log));
						}
						lat.push(detail_arr[j].lat);
						log.push(detail_arr[j].log);
					}
				}
				searchRoute(lat, log, map[i]);
				setBoundary(lat, log, map[i]);
				//setTimeout(searchRoute, 1500, lat, log, map[i]);
			
			}, i * 500)
		}
	}
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	function drawLine(arrPoint, maplist) {
		var polyline_;

		polyline_ = new Tmapv2.Polyline({
			path : arrPoint,
			strokeColor : "#DD0000",
			strokeWeight : 6,
			map : maplist
		});
		resultdrawArr.push(polyline_);
	}
	
	function clearLine(){
		if (resultdrawArr.length > 0) {
			for ( var i in resultdrawArr) {
				resultdrawArr[i]
						.setMap(null);
			}
			resultdrawArr = [];
		}
		
		drawInfoArr = [];
	}

	
	function removeMarkers() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}
	
	function selectMarker(location){
		infoWindow = new Tmapv2.InfoWindow();
		console.log(location);
		infoWindow.setMap(map);
		infoWindow.setPosition(location);
		infoWindow.setContent(
				'<div style = "width : 200px;">'+
					'<div>start</div>'+
					'<div>end<div>'+
					'<div>waypoint</div>'+
				'</div>'
				);
		infoWindow.draw();
	}
	
	// 경로 찾기
	function searchRoute(lat, log, maplist){
		// 3. 경로탐색 API 사용요청
		console.log("route start");
		var waypoint = "";
		for (var i = 2; i < lat.length; i++){
			waypoint += log[i] + ",";
			waypoint += lat[i];
			if(i == lat.length - 1){
				break;
			}
			waypoint += "_";
		}
		$.ajax({
					method : "POST",
					url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
					async : false,
					data : {
						"appKey" : "l7xx0e16f9f2f8cc49c8af5c5ad4cc51a5c2",
						"startX" : log[0],
						"startY" : lat[0],
						"endX" : log[1],
						"endY" : lat[1],
						"passList" : waypoint,
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"startName" : "출발지",
						"endName" : "도착지"
					},
					success : function(response) {
						console.log(response);
						var resultData = response.features;
						console.log("route start");
						//기존 그려진 라인 & 마커가 있다면 초기화
						/*
						if (resultdrawArr.length > 0) {
							for ( var i in resultdrawArr) {
								resultdrawArr[i]
										.setMap(null);
							}
							resultdrawArr = [];
						}
						*/
						drawInfoArr = [];
						
						for ( var i in resultData) { //for문 [S]
							var geometry = resultData[i].geometry;
							var properties = resultData[i].properties;
							var polyline_;


							if (geometry.type == "LineString") {
								for ( var j in geometry.coordinates) {
									// 경로들의 결과값(구간)들을 포인트 객체로 변환 
									var latlng = new Tmapv2.Point(
											geometry.coordinates[j][0],
											geometry.coordinates[j][1]);
									// 포인트 객체를 받아 좌표값으로 변환
									var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
											latlng);
									// 포인트객체의 정보로 좌표값 변환 객체로 저장
									var convertChange = new Tmapv2.LatLng(
											convertPoint._lat,
											convertPoint._lng);
									// 배열에 담기
									drawInfoArr.push(convertChange);
								}
							} else {
								var markerImg = "";
								var pType = "";
								var size;

								if (properties.pointType == "S") { //출발지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
									pType = "S";
									size = new Tmapv2.Size(24, 38);
								} else if (properties.pointType == "E") { //도착지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
									pType = "E";
									size = new Tmapv2.Size(24, 38);
								} else { //각 포인트 마커
									markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
									pType = "P";
									size = new Tmapv2.Size(8, 8);
								}

								// 경로들의 결과값들을 포인트 객체로 변환 
								var latlon = new Tmapv2.Point(
										geometry.coordinates[0],
										geometry.coordinates[1]);

								// 포인트 객체를 받아 좌표값으로 다시 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
										latlon);

								var routeInfoObj = {
									markerImage : markerImg,
									lng : convertPoint._lng,
									lat : convertPoint._lat,
									pointType : pType
								};

								// Marker 추가
								marker_p = new Tmapv2.Marker(
										{
											position : new Tmapv2.LatLng(
													routeInfoObj.lat,
													routeInfoObj.lng),
											icon : routeInfoObj.markerImage,
											iconSize : size,
											map : maplist
										});
							}
						}//for문 [E]
						drawLine(drawInfoArr, maplist);
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});
	}
	
	function setBoundary(lat, log, map){
		
		var boundary = new Tmapv2.LatLngBounds();
		
		for(let i = 0; i < lat.length; i++){
			var point = new Tmapv2.LatLng(lat[i], log[i]);
			boundary.extend(point);
		}
		map.fitBounds(boundary);
	}
	


</script>
</head>
<body onload="initTmap();">
		<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
		<div id="map_wrap" class="map_wrap3">
			<c:forEach var = "courseList" items = "${courseList }">
				<div id="map_div_${courseList.course_no }"></div>
				${courseList.course_name }, ${courseList.course_info }, ${courseList.distance },${courseList.time }
			</c:forEach>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		<p id="result"></p>
		<br />
		<div class="rst mCustomScrollbar">
			<ul id="searchResult" name="searchResult">
				<li>검색결과</li>
			</ul>
		</div>
</body>
</html>