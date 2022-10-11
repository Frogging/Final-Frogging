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
					<a href="/mypage/my">
						마이페이지
					</a>
					<a href="/mypage/myCourse">
						<i class="fa-solid fa-angle-right"></i>
						나의 코스
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
			<ul class="k_mycourse_list">
				<c:forEach var="vo" items="${c_list}">
					<a href="/mypage/myCourseView?no=${vo.course_no}">
					<li class="k_mycourse_list_one">
						
						<ul class="k_a_each_box">
							<li><img src="/img/course_sample.png" alt=""></li>
							<li class="k_a_main_info">${vo.course_name}</li>
							<%-- <li class="k_a_main_info">위</li> --%>
							<li class="k_a_div"></li>
							<li>예상 거리: ${vo.distance}km</li>
							<li>예상 시간: ${vo.time}분</li>
							<li>위치 : ${vo.addr}</li>
						</ul>
					</li>
					</a>
				</c:forEach>

			</ul>
			
		</div>
	</section>
</body>