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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="/js/k_script.js" type="text/javascript"></script>
	<title>새파티-추천경로</title>
</head>
<body onload="modal_path()">
	<header></header>
		<!-- --------- NEW PARTY with rec paths --------- -->
		<section class="k_new_party_rec_path">
			<div class="k_wrapper">
				<div class="k_section_title">
					<div><a href="/club/join_club"><i class="fa-solid fa-rotate-left k_green"></i>&nbsp내 주변의 클럽찾기</a></div>
				</div>
				<div class="k_section_title">
					<div>원하는 파티가 없다면,</div>
					<div class="k_green">나의 파티 만들기 <i class="fa-solid fa-circle-plus"></i></div>
				</div>
			</div>
			<!-- ----------- recommendation path ------------->
			<div class="k_path_list">
				<div class="k_wrapper">
					<ul class="k_rec_path_button">
						<li class="active click-btn"><a href="/club/make_club_rec_path">추천 코스 선택하기</a></li>
						<li class="click-btn-w"><a href="/club/make_club_new_path">나만의 코스 만들기</a></li>
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
								<button class="k_rec_path_search_btn click-btn">검색</button>
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
									<li class="k_more open_modal"><img src="/img/course_sample.png" alt="">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal"><img src="" alt="">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal"><img src="" alt="">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal"><img src="" alt="">더보기</li>
								</ul>
							</li>
							<li>
								<ul class="k_rec_path_box">
									<li class="k_rec_path_title k_green">응봉산 산책로</li>
									<li>서울특별시 성동구 응봉동 산8-14</li>
									<li class="k_box_space"></li>
									<li>예상 소요시간: 70분</li>
									<li>당월 방문 수: 12회</li>
									<li class="k_more open_modal"><img src="" alt="">더보기</li>
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
				</div>
			</div>
		</section>


		<!-- --------- PARTY Details--------- -->
		<section class="k_selected_path_detail modal">
			<div class="k_wrapper modal_body">
				<div class="k_path_detail_box">
					<div class="k_path_map"></div>
					<ul class="k_path_infos">
						<li class="k_green">코스 이름</li>
						<li>가볍게 응봉산 코스</li>
						<li class="k_green">시작 위치</li>
						<li>응봉산 팔각정 응봉산 팔각정 응봉산 팔각정 응봉산 팔각정 응봉산 팔각정</li>
						<li class="k_green">도착 위치</li>
						<li>응복역 4번 출구</li>
						<li class="k_green">소요 시간</li>
						<li>50 min</li>
						<li class="k_green">이동 거리</li>
						<li>4 km</li>
						<li class="k_green">이번 달 방문 횟수</li>
						<li>12회</li>
					
						<div>
							<ul class="k_path_images">
								<li><i class="fa-solid fa-chevron-left"></i></li>
								<li><img src="/img/course_detail_sample.jpeg" alt=""></li>
								<li><img src="" alt=""></li>
								<li><img src="" alt=""></li>
								<li><i class="fa-solid fa-chevron-right"></i></li>
							</ul>
						</div>
					</ul>
					
				</div>

				<div class="k_party_detail_join">
					<div class="k_close_popup click-btn">돌아가기</div>
					<div class="click-btn">파티 참여 신청하기</div>
				</div>
			</div>
		</section>



		<!-- k_new_party_setting -->
		<section class="k_new_party_setting">
			<div class="k_wrapper">
				<form action="">
				<div class="k_section_title">
					<div>플로깅 할 사람 여기여기 모여라</div>
					<div class="k_green">파티 세팅 <i class="fa-solid fa-gear"></i></div>
				</div>

				<div class="k_party_set">
						<ul class="k_party_set_left">
							<li>파티 가이드</li>
							<li class="k_party_set_guide"></li>
							<li><input type="checkbox" name="" id="">위 파티 가이드를 확인하였습니다.</li>
						</ul>
						<div class="k_party_set_line"></div>
						<ul class="k_party_set_right">
							<li><label class="k_green" for="">파티명</label></li>
							<li class="k_party_set_in"><input type="text" placeholder="파티명을 입력하세요"></li>
							<li><label class="k_green" for="">모집인원</label></li>
							<li class="k_party_set_in"><input type="number" name="" id="" min="2" max="12" placeholder="인원 수"></li>
							<li><label class="k_green" for="">모집일시</label></li>
							<li class="k_party_set_in"><input type="date" name="" id=""></li>
							<li><label class="k_green" for="">만남장소</label></li>
							<li class="k_party_set_in"><input type="text" name="" id="" placeholder="만남장소를 입력하세요"></li>
						</ul>
					
				</div>
				<div class="k_party_set_button">
					<div class="click-btn">파티 등록</div>
				</div>
			</form>
			</div>
		<footer></footer>
</body>
</html>