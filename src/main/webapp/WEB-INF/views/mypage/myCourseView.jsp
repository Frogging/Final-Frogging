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
					<c:if test="${logStatus =='Admin'}">
						<i class="fa-solid fa-square-caret-right k_green"></i>
						<a href="/">
							관리자
						</a>
						<a href="/admin/manageCourse">
							<i class="fa-solid fa-angle-right"></i>
								코스 관리하기
						</a>
						<a href="#">
							<i class="fa-solid fa-angle-right"></i>
							코스 보기
						</a>
					</c:if>

					<c:if test="${logStatus !='Admin'}">
						<i class="fa-solid fa-square-caret-right k_green"></i>
						<a href="/">
							코스
						</a>
						<a href="/">
							<i class="fa-solid fa-angle-right"></i>
							코스 상세보기
						</a>
					</c:if>
				</div>
			</div>
			

			<c:if test="${logStatus !='Admin'}">
			<div class="k_section_title">
				<div class="k_green" >
					프로거 ${logNickName }가
				</div>
				<div>작성한 코스</div>
			</div>
			</c:if>

		</div>
	</section>

	<section class="k_mycourse">
		<div class="k_wrapper">
			<form action="">
				<div class="k_make_path">
					<div class="k_make_path_map" id = "map_div"></div>
					<%-- <ul class="k_make_path_detail">
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
					</ul> --%>
					<ul class="k_path_infos">
						<li class="k_green">코스 이름</li>
						<li id="k_coursename"><span>${vo.course_name}</span></li>
						<li class="k_green">시작 위치</li>
						<li id="k_startaddr"><span>${vo.startaddr}</span></li>
						<li class="k_green">도착 위치</li>
						<li id="k_endaddr"><span>${vo.endaddr}</span></li>
						<li class="k_green">소요 시간</li>
						<li id="k_time"><span>${vo.time}</span></li>
						<li class="k_green">이동 거리</li>
						<li id="k_distance"><span>${vo.distance}</span></li>
						<li class="k_green">이번 달 방문 횟수</li>
						<li id="k_plog_total"><span>${vo.plog_total}</span></li>
					</ul>
				</div>
			</form>

			
			<div class="k_mydetail_set">
			<c:if test="${logStatus !='Admin'}">
				<div><a href="/mypage/myCourse">돌아가기</a></div>
				<c:if test="${logId!=null}">
					<div><a href="/mypage/myCourseEdit">수정하기</a></div>
					<div><a href="/mypage/myCourseDelete">삭제하기</a></div>
				</c:if>
			</c:if>
			<c:if test="${logStatus =='Admin'}">
				<div><a href="/admin/manageCourse">돌아가기</a></div>
				<c:if test="${logId!=null}">
					<div><a href="/mypage/myCourseEdit">수정하기</a></div>
					<div><a href="/mypage/myCourseDelete">삭제하기</a></div>
				</c:if>
			</c:if>
		</div>
		</div>
	</section>
</body>