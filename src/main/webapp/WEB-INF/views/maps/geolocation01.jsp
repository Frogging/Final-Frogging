<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx0e16f9f2f8cc49c8af5c5ad4cc51a5c2"></script>
<script>
	var check = "${course.course_no}";
	if(check == -1){
		alert("해당 코스는 없습니다.");
		history.go(-1);
	} else {
		var courseType = "${course.type}";
		var detail_arr = new Array();
			<c:forEach items = "${courseDetail}" var = "courseDetail">
				detail_arr.push({
					course_no : "${courseDetail.course_no}",
					waypoint : "${courseDetail.waypoint}",
					lat : "${courseDetail.lat}",
					log : "${courseDetail.log}",
					addr : "${courseDetail.addr}"
				});
			</c:forEach>
	}
</script>
<script src="/js/watch_position.js" ></script>
<link rel = "stylesheet" href = "/js_css/style.css" type = "text/css">
<style>
</style>
</head>
<body onload="initTmap();">
	<div id="map_wrap" class="map_wrap3">
			<div id="map_div"></div>
	</div>
	<div class = "container">
		 <ul>
	        <li>위도:<span id="latitude"></span></li>
	        <li>경도:<span id="longitude"></span></li>
	        <li>accuracy:<span id = "accuracy"></span></li>
	        <li>watchPosition count:<span id="count"></span></li>
	        <li>update count:<span id="update_count"></span></li>
	        <li>distance:<span id = "distance"></span></li>
	        <li>time:<span id = "time"></span></li>
	        <li>location list count:<span id = "locationList_count"></span></li>
	        <li>example vertical length:<span id = "vertical_length"></span></li>
	    </ul>
	    <form method = "post" id = "checkCourseForm">
	    	쓰레기 처리량 : <input type = "text" id = "amount_trash" name = "amount_trash">
	    	파티번호 : <input type = "text" id = "sort" name = "sort">
	    	<input type = "submit" value = "이동한 코스 저장">
	    </form>
	    <p id="demo">show error please</p>
    <input type = "button" value = "위치 확인 시작" onclick = "startChecking();">
    <input type = "button" value="확인를 끝낸다" onclick = "endChecking();" />
	</div>
</body>
</html>