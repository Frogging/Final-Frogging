<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/k_style.css">
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxc6985a9bef1d438f939779b9bf5e79d8"></script>
<script type = "text/javascript">
$(function(){
	$("#courseSearchForm").submit(function(){
		if($("#searchName").val()==""){
			alert("코스 이름을 입력해주세요.");
			return false;
		}
		return true;
	});
});

function confirmCourse(course_name){
	if(confirm(course_name + "를 선택하시겠습니까?")){
		
	}
}
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
			time : "${courseList.time}",
			type : "${courseList.type}"
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
</script>
<script src="/js/tmap_list.js"></script>
</head>
<body onload="initTmap();">
		<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
		<form method = "get" id = "courseSearchForm">
			<select name = "searchKey">
				<option value = "course_name">코스 이름</option>
				<option value = "course_no">코스 번호</option>
			</select>
			<input type = "text" name = "searchWord" id = "searchWord">
			<input type = "submit" name = "Search">
		</form>
		<div id="map_wrap" class="map_wrap3">
			<c:forEach var = "courseList" items = "${courseList }">
				<div onclick = "window.location.href='/mobile/maps/geolocation01/${courseList.course_no}'">
					<ul class = "k_rec_path_box">
						<li class = "k_rec_path_title k_green">${courseList.course_no }, ${courseList.course_name }</li>
						<li>${courseList.course_info }</li>
						<li>예상 거리 : ${courseList.distance }</li>
						<li>예상 시간 : ${courseList.time }</li>
						<li><div id="map_div_${courseList.course_no }"></div></li>
					</ul>
				</div>
			</c:forEach>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		<p id="result"></p>
		<br />
			<div>
		<ul id = "page">
		<!-- page 번호 -->
			<c:if test = "${cpvo.nowPage > 1 }"><!-- 이전 page가 있을 때 -->
				<li><a href = "/mobile/mobileList?nowPage=${cpvo.nowPage-1 }<c:if test='${cpvo.searchWord!=null }'>&searchKey=${cpvo.searchKey }&searchWord=${cpvo.searchWord }</c:if>">prev</a></li>
			</c:if>
			
			<c:forEach var = "p" begin = "${cpvo.startPage }" end = "${cpvo.startPage + cpvo.onePageCount - 1 }">
				<!-- 출력할 page 번호가 총 page보다 작거나 같을 때 -->
				<c:if test = "${p <= cpvo.totalPage}">
					
					<li 
					
					<c:if test = "${p == cpvo.nowPage }">
						style = "background-color : #f00"; color : #fff;"
					</c:if>
					
					><a href = "/mobile/mobileList?nowPage=${p }<c:if test='${cpvo.searchWord!=null }'>&searchKey=${cpvo.searchKey }&searchWord=${cpvo.searchWord }</c:if>">${p }</a></li>
					
				</c:if>
			</c:forEach>
			
			<!-- 다음 page -->
			<c:if test = "${cpvo.nowPage < cpvo.totalPage }">
				<li><a href = "/mobile/mobileList?nowPage=${cpvo.nowPage + 1 }<c:if test='${cpvo.searchWord!=null }'>&searchKey=${cpvo.searchKey }&searchWord=${cpvo.searchWord }</c:if>">next</a></li>
			</c:if>
		</ul>
	</div>
	
</body>
</html>