var x = document.getElementById("demo");
var map;
var total_count = 0;
var watchId = -1;
var locationList = [];
var polyline;
var total_distance = 0;
var start_time, end_time, total_time = 0;

function initTmap() {
		alert("initTmap");
		// 1. 지도 띄우기
		// 현재 위치 HTML Geolocaiton 을 통해 확인 GPS 아님
		map = new Tmapv2.Map("map_div", {
		center : new Tmapv2.LatLng(37.56520450, 126.98702028),
			width : "100%",
			height : "400px",
			zoom : 17,
			zoomControl : true,
			scrollwheel : true,
			httpsMode : true
		});
		//alert("test1");
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(
				function(position) {
					//alert("getCurrentPosition");
					var lat = position.coords.latitude;
					var lon = position.coords.longitude;

					marker = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(lat,lon),
						map : map
					});

					$('#latitude').html(lat);     // 위도 
                    $('#longitude').html(lon);
                    $('#accuracy').html(position.coords.accuracy);
                    //alert("test3");
					map.setCenter(new Tmapv2.LatLng(lat,lon));
					map.setZoom(15);
					console.log(new Tmapv2.LatLng(lat,lon));
					console.log(map.getCenter());
					
				}, showError);
			}
			
			polyline = new Tmapv2.Polyline({
				path: [],
				strockColor:"blue",
				strokeOpacity:1,
				strokeWeight: 4,
				directionColor:"blue",
				map: map
			});
			
			var vertical = verticalLength(
				new Tmapv2.LatLng(37.50651442225382,127.09805488586466),
				new Tmapv2.LatLng(37.506434986069,127.097582817078),
				new Tmapv2.LatLng(37.506417964018404,127.09859848022501)
			);
			$('#vertical_length').html(vertical);
		}

function startChecking(){
	alert("startChecking!!");
	//alert("test2");
	 if (navigator.geolocation) {
			let count = 0;
			let update_count = 0;
			$('#count').html(count);
            //위치 정보를 정기적으로 얻기
            let before_location = null;
            let new_location = null;
            
            start_time = new Date();
            
            let id = navigator.geolocation.watchPosition(
                    function(position) {
						count++;
						$('#count').html(count);
						
						let updateFlag = true;
						new_location = new Tmapv2.LatLng(position.coords.latitude,position.coords.longitude);

						if(before_location != null){
							const section_distance = before_location.distanceTo(new_location) / 1000;
							if(section_distance < 0.02){
								updateFlag = false;
							}
							
						}
						
						if(updateFlag){
							update_count++;
							$('#update_count').html(update_count);
							
							locationList.push(new_location);
							if(update_count != 1){
								total_distance += before_location.distanceTo(new_location) / 1000;
							}
							
							before_location = new_location;
							$('#distance').html(total_distance);
							
							polyline.setPath(locationList);
							
							$('#latitude').html(new_location.lat());     // 위도 
	                        $('#longitude').html(new_location.lng()); // 경도 
	                        $('#accuracy').html(position.coords.accuracy);
						}
                    }, showError);
                    watchId = id;
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
	}

function endChecking(){
	
	alert("endChecking!!");
	
	end_time = new Date();
	total_time = (end_time.getTime() - start_time.getTime()) / (1000 * 60);
	$('#time').html(total_time);
	
	if(watchId != -1){
		
		navigator.geolocation.getCurrentPosition(function(position){
			locationList.push(new Tmapv2.LatLng(position.coords.latitude,position.coords.longitude));
			total_distance += locationList[locationList.length - 2].distanceTo(locationList[locationList.length - 1]);
			$('#distance').html(total_distance);
		}, showError);
		
		let string = "";
		for(let i = 0; i < locationList.length; i++){
			if(i != locationList.length - 1){
				string += locationList[i].toString() + ", ";
			}else{
				string += locationList[i].toString()
			}
		}
		$('#locationList_count').html(locationList.length);
		alert(string);
		
		navigator.geolocation.clearWatch(watchId);
		watchId = -1;
		let distance_check = locationList[0].distanceTo(locationList[locationList.length - 1]);
		if(distance_check < 0.2 || locationList.length < 3){
			alert(distance_check);
			alert("200m이내를 이동하셨습니다.");
		}
		locationList = [];
	} else {
		alert('위치 확인을 시작해주십시오.');
	}
}
function showError(error) {
	  switch(error.code) {
	    case error.PERMISSION_DENIED:
	    alert("User denied the request for Geolocation.");
	      x.innerHTML = "User denied the request for Geolocation.";
	      break;
	    case error.POSITION_UNAVAILABLE:
	    alert("Location information is unavailable.");
	      x.innerHTML = "Location information is unavailable.";
	      break;
	    case error.TIMEOUT:
	    alert("The request to get user location timed out.");
	      x.innerHTML = "The request to get user location timed out.";
	      break;
	    case error.UNKNOWN_ERROR:
	    alert("An unknown error occurred.");
	      x.innerHTML = "An unknown error occurred.";
	      break;
	  	}
	}

function verticalLength(point1, point2, point3){
	var length12 = point1.distanceTo(point2);
	var length23 = point2.distanceTo(point3);
	var length31 = point3.distanceTo(point1);
	
	var cosValue = (Math.pow(length12,2) + Math.pow(length23,2) - Math.pow(length31,2)) / (2 * (length12 * length23));

	return length12 * Math.sqrt(1 - Math.pow(cosValue, 2));
}

function checkCourse(user_course, saved_course){
	let courseIn = false;
	let flag = 0;
	let vertical_length1 = 0;
	let vertical_length2 = 0;
	let checker = 0;
	let index = 0;
	
	for(let i = 0; i < user_course.length; i++){
		if(index < saved_course.length - 1){
			vertical_length1 = verticalLength(user_course[i], saved_course[index], saved_course[index+1]);
			if(index < saved_course.length - 2){
				vertical_length2 = verticalLength(user_course[i], saved_course[index+1], saved_course[index+2]);
				if(vertical_length1 >= vertical_length2){
					checker = vertical_length1;
				} else {
					checker = vertical_length2;
					index++; 
				}
			} else {
				checker = vertical_length1;
			}
		} else {
			vertical_length1 = verticalLength(user_course[i], saved_course[saved_course.length-2], saved_course[saved_course.length-1]);
		}
		
		if(checker < 5){
			flag++;
		}
	}
	
	if(flag >= 3){
		courseIn = true;
	}
	
	return courseIn;
}