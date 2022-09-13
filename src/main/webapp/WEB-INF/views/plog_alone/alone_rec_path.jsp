<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="/js/k_script.js" type="text/javascript"></script>
	<title>혼자하기-추천경로</title>
</head>
<body onload="modal_path()">
	<header></header>
		<!-- --------- NEW PARTY with rec paths --------- -->
		<section class="k_new_party_rec_path">
			<div class="k_wrapper">
				<div class="k_section_title_links">
					<div>
						<i class="fa-solid fa-square-caret-right k_green"></i>
						<a href="/">
							플로깅하기 
						</a>
						<a href="/alone/alone_rec_path">
							<i class="fa-solid fa-angle-right"></i>
							혼자하기
						</a>
						<i class="fa-solid fa-angle-right"></i>
						추천 경로 찾기
					</div>
				</div>
				
				<div class="k_section_title">
					<div>오늘은 혼자 걷고 싶어!</div>
					<div class="k_green">프로깅 혼자하기 <i class="fa-solid fa-circle-plus"></i></div>
				</div>
			</div>
			<!-- ----------- recommendation path ------------->
			<div class="k_path_list">
				<div class="k_wrapper">
					<ul class="k_rec_path_button">
						<li class="active"><a href="/alone/alone_rec_path">추천 코스 선택하기</a></li>
						<li><a href="/alone/alone_new_path">나만의 코스 만들기</a></li>
					</ul>

					<div class="k_path_list_bg">
						<!-- recommendation path select -->
						<form action="">
							<div class="k_rec_path_select">
								<span>내 근처의 플로깅 코스: </span>
								<div>
									<div>
										<select name="" id="">
											<option value="">서울특별시</option>
										</select>
									</div>
									<div>
										<select name="" id="">
											<option value="">성동구</option>
										</select>
									</div>
								</div>
								<button class="k_rec_path_search_btn">검색</button>
							</div>
						</form>

						<!-- path lists -->
						<ul class="k_rec_path_list_view">
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal">더보기</li>
								</ul>
							</li>
						</ul>

						<!-- recommand path paging -->
						<ul class="k_rec_path_page">
							<li><i class="fa-solid fa-chevron-left active"></i></li>
							<li class="active">1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li><i class="fa-solid fa-chevron-right active"></i></li>
						</ul>
					</div>
					<div class="k_alone_start_button">
						<div>혼자 프로깅 시작</div>
					</div>
				</div>
			</div>
		</section>
	<footer
</body>
</html>