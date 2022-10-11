<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx0e16f9f2f8cc49c8af5c5ad4cc51a5c2"></script>
<script src="/js/tmap_insert.js"></script>
</head>
<body onload="initTmap();">
		<!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
		<div id="map_wrap" class="map_wrap3">
			<div id="map_div"></div>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		<p id="result"></p>
		<form method = "post" id = "courseForm">
			코스명 : <input type = "text" id = "course_name" name = "course_name">
			코스에 대한 메모 : <textarea id = "course_info" name = "course_info"></textarea>
			<input type = "submit" id = "course" name = "course" value = "코스 생성">
		</form>
		<br />
		<input type = "text" id = "searchStart" onKeypress="javascript:if(event.keyCode==13){searchPlace(this.value, 0)}">
		<input type = "text" id = "searchEnd" onKeypress="javascript:if(event.keyCode==13){searchPlace(this.value, 1)}">
		<div id = "waypoint">
			<input type = "button" value = "추가" onclick = "add_textbox()">
		</div>
		<div class="rst mCustomScrollbar">
			<ul id="searchResult" name="searchResult">
				<li>검색결과</li>
			</ul>
		</div>
</body>
</html>