<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
						마이페이지
					</a>
					<a href="/">
						<i class="fa-solid fa-angle-right"></i>
						나의 플로깅 활동
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<div class="k_green" >
					오늘도 열심히 걸은 ${logNickName }님! 
				</div>
				<div>나의 활동 보기 <i class="fa-solid fa-magnifying-glass k_green"></i></div>
			</div>

		</div>
	</section>

	<section class="k_activity_sum">
		<div class="k_wrapper">

			<div class="k_a_title">나의 활동 요약</div>

			<form action="">
				<ul class="k_a_select">
					<li>주</li>
					<li class="active">월</li>
					<li>년</li>
					<li>전체</li>
				</ul>

				<select name="" id="k_a_select_detail">
					<option value="">8월</option>
				</select>
			</form>

			<div class="k_a_chart">
				<ul>
					<li>TOTAL</li>
					<li><span>6</span> km</li>
					<li><span>12000</span> steps</li>
					<li><span>3</span> bin bags</li>
				</ul>
				<div class="k_a_chart_graph"><img src="/img/chart_sample.jpeg" alt=""></div>
			</div>

		</div>
	</section>

	<section class="k_activity_list">
		<div class="k_wrapper">

			<div class="k_a_title">최근 활동</div>

			<ul>
				<li>
					<ul class="k_a_each_box">
						<li><img src="/img/course_sample.png" alt=""></li>
						<li class="k_a_main_info">2022.09.29</li>
						<li class="k_a_main_info">정릉천~청계천 코스</li>
						<li class="k_a_div"></li>
						<li>거리: 4km, 걸음 수 : 8000보</li>
						<li>주운 쓰레기: 1l</li>
						<li>함께한 파티: 환경러버들</li>
					</ul>
				</li>

				<li>
					<ul class="k_a_each_box">
						<li><img src="/img/course_sample.png" alt=""></li>
						<li class="k_a_main_info">2022.09.29</li>
						<li class="k_a_main_info">정릉천~청계천 코스</li>
						<li class="k_a_div"></li>
						<li>거리: 4km, 걸음 수 : 8000보</li>
						<li>주운 쓰레기: 1l</li>
						<li>함께한 파티: 환경러버들</li>
					</ul>
				</li>

				<li>
					<ul class="k_a_each_box">
						<li><img src="/img/course_sample.png" alt=""></li>
						<li class="k_a_main_info">2022.09.29</li>
						<li class="k_a_main_info">정릉천~청계천 코스</li>
						<li class="k_a_div"></li>
						<li>거리: 4km, 걸음 수 : 8000보</li>
						<li>주운 쓰레기: 1l</li>
						<li>함께한 파티: 환경러버들</li>
					</ul>
				</li>
			</ul>

			<div class="k_list_more"><i class="fa-solid fa-caret-down"></i></div>
		</div>
	</section>


	<section class="k_activity_sum">
		<div class="k_wrapper">

			<div class="k_a_title">달성 기록</div>

		</div>
	</section>
</body>
