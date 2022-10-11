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
						관리자
					</a>
					<a href="/admin/manageCourse">
						<i class="fa-solid fa-angle-right"></i>
						코스 관리하기
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<div>코스 관리</div>
			</div>

		</div>
	</section>

	<section class="k_mycourse">
		<div class="k_wrapper">
			<form action="">
			<ul class="k_my_course_grid">
				<li class="k_my_list_head"><span>번호</span></li>
				<li class="k_my_list_head"><span>코스명</span></li>
				<li class="k_my_list_head"><span>코스위치</span></li>
				<li class="k_my_list_head"><span>소요시간</span></li>
				<li class="k_my_list_head"><span>소요거리</span></li>
				<li class="k_my_list_head"><span>관리</span></li>

				<c:forEach var="vo" items="${c_list}">
					<li><span>${vo.course_no}</span></li>
					<li><a href="/mypage/myCourseView?no=${vo.course_no}"><span>${vo.course_name}</span></a></li>
					<li><span>${vo.addr}</span></li>
					<li><span>${vo.time}</span></li>
					<li><span>${vo.distance}</span></li>
					<li><span><input type="checkbox"></span></li>
				</c:forEach>
			</ul>
			<div class="k_manage_btn_section">
				<input type="checkbox">
				<input type="button" value="삭제하기">
			</div>

			</form>

			
		
		</div>
	</section>
</body>