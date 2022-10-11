<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
</head>
<body class="k_body">
	<section>
		<div class="k_wrapper">

			<div class="k_section_title_links">
				<div>
					<i class="fa-solid fa-square-caret-right k_green"></i>
					<a href="/">
						코스
					</a>
					<a href="/">
						<i class="fa-solid fa-angle-right"></i>
						코스 상세보기
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<div class="k_green" >
					프로거 ${logNickName }가
				</div>
				<div>작성한 코스</div>
			</div>

		</div>
	</section>

	<section class="k_mycourse">
		<div class="k_wrapper">
			<form action="">
				<div class="k_make_path">
					<div class="k_make_path_map" id = "map_div"></div>
					<ul class="k_make_path_detail">
						<li class="k_green"><label for="">코스명</label></li>
						<li class="k_path_detail_in"><input type="text" id="course_name" name="course_name"><input type="button" id = "courseNameCheck" value = "중복 검사" onclick = "nameCheck()"></li>
						<li class="k_green"><label for="">시작 위치</label></li>
						<li class="k_path_detail_in"><input type="text" id = "searchStart" onKeypress="javascript:if(event.keyCode==13){searchPlace(this.value, 0)}"></li>
						<li class="k_green"><label for="">경유 위치</label></li>
						<li class="k_path_detail_in"><div id = "waypoint"></div></li>
						<li class="k_green"><label for="">도착 위치</label></li>
						<li class="k_path_detail_in"><input type="text" id = "searchEnd" onKeypress="javascript:if(event.keyCode==13){searchPlace(this.value, 1)}"></li>
						<li class="k_make_path_total" ><span id = "result">예상 소요 시간: / 예상 거리: </span></li>
						<li class="k_make_path_total"><input type="submit" value="코스 저장"></li>
					</ul>
				</div>
			</form>

			
			<div class="k_mydetail_set">
			<div><a href="/mypage/myCourse">돌아가기</a></div>
			<c:if test="${logId!=null}">
				<div><a href="/mypage/myCourseEdit">수정하기</a></div>
			</c:if>
		</div>
		</div>
	</section>
</body>