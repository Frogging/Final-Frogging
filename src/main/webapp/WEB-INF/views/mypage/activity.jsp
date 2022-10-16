<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
	<script src="/js/k_chart.js" ></script>

</head>
<body class="k_body" onload="draw_myplog()">
	<section>
		<div class="k_wrapper">

			<div class="k_section_title_links">
				<div>
					<i class="fa-solid fa-square-caret-right k_green"></i>
					<a href="/mypage/my">
						마이페이지
					</a>
					<a href="/mypage/activity">
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
					<li class="k_a_select_w">주</li>
					<li class="k_a_select_m active">월</li>
					<li class="k_a_select_y ">년</li>
					<li class="k_a_select_t">전체</li>
				</ul>

				<%-- <select name="" id="k_a_select_detail">
					<option value="">2019년</option>
					<option value="">2020년</option>
					<option value="">2021년</option>
					<option value="" selected >2022년</option>
				</select> --%>
			</form>

			<div class="k_a_chart">
				<ul>
					<li>TOTAL</li>

					<li class="k_weekly"><span>${a_vo_w.total_distance}</span> km</li>
					<li class="k_weekly"><span>${a_vo_w.total_step}</span> steps</li>
					<li class="k_weekly"><span>${a_vo_w.plog_count}</span> th plogging</li>
					<li class="k_weekly"><span>${a_vo_w.trash_sum}</span> L of trash</li>

					<li class="k_monthly active"><span>${a_vo_m.total_distance}</span> km</li>
					<li class="k_monthly active"><span>${a_vo_m.total_step}</span> steps</li>
					<li class="k_monthly active"><span>${a_vo_m.plog_count}</span> th plogging</li>
					<li class="k_monthly active"><span>${a_vo_m.trash_sum}</span> L of trash</li>

					<li class="k_yearly"><span>${a_vo_y.total_distance}</span> km</li>
					<li class="k_yearly"><span>${a_vo_y.total_step}</span> steps</li>
					<li class="k_yearly"><span>${a_vo_y.plog_count}</span> th plogging</li>
					<li class="k_yearly"><span>${a_vo_y.trash_sum}</span> L of trash</li>

					<li class="k_totally"><span>${a_vo_t.total_distance}</span> km</li>
					<li class="k_totally"><span>${a_vo_t.total_step}</span> steps</li>
					<li class="k_totally"><span>${a_vo_t.plog_count}</span> th plogging</li>
					<li class="k_totally"><span>${a_vo_t.trash_sum}</span> L of trash</li>
				</ul>

				<div class="k_a_chart_wrap">
					<div class="k_a_chart_graph" id="k_weekly_chart"><canvas id="myChart_w"></canvas></div>
					<div class="k_a_chart_graph" id="k_monthly_chart"><canvas id="myChart_m"></canvas></div>
					<div class="k_a_chart_graph" id="k_yearly_chart"><canvas id="myChart_y"></canvas></div>
					<div class="k_a_chart_graph" id="k_totally_chart"><canvas id="myChart_t"></canvas></div>
				</div>
			</div>

		</div>
	</section>

	<section class="k_activity_list">
		<div class="k_wrapper">

			<div class="k_a_title">최근 활동</div>

			<ul>
				<c:forEach var="vo" items="${a_list}">
					<li>
						<ul class="k_a_each_box">
							<li><div>지도</div></li>
							<li class="k_a_main_info">${vo.date}</li>
							<li class="k_a_main_info">${vo.course_name}</li>
							<li class="k_a_div"></li>
							<li>거리: ${vo.distance}km, 걸음 수 : ${vo.step}보</li>
							<li>주운 쓰레기: ${vo.amount_trash}l</li>
							<li>
								<c:if test="${vo.sort == 0 }">
									혼자한 플로깅
								</c:if>
								<c:if test="${vo.sort > 0}">
									같이한 플로깅
								</c:if>
							</li>
						</ul>
					</li>
				</c:forEach>

			</ul>

			<div class="k_list_more"><i class="fa-solid fa-caret-down"></i></div>
		</div>
	</section>

</body>
