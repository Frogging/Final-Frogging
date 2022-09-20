<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/k_script.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="/js/k_script.js" type="text/javascript"></script>
	<script src="/js/k_club.js" type="text/javascript"></script>

</head>
<body onload='modal_club()' class="k_body">
	<!-- --------- FIND PARTY --------- -->
	<section class="find_party">
		<div class="k_wrapper">
			<div class="k_section_title_links">
				<div>
					<i class="fa-solid fa-square-caret-right k_green"></i>
					<a href="/">
						플로깅하기 
					</a>
					<a href="/club/join_club">
						<i class="fa-solid fa-angle-right"></i>
						함께하기
						<i class="fa-solid fa-angle-right"></i>
						모임 찾기
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<%-- 위치 조건 검색 --%>
					<!-- script 처리 -->
				<div class="k_green" >
					지금 당신 위치 : 
				</div>
				<div>주변 모임을 찾아드릴께요 <i class="fa-solid fa-magnifying-glass k_green"></i></div>
				<button class="k_my_party click-btn-l">
					<a href="/club/my_club_list">나의 모임 관리</a>
				</button>
			</div>
		</div>
		
		<div class="k_party_list">
			<div class="k_wrapper">
				<!-- 날짜 조건 검색 -->
				<div class="k_party_list_date">
					<form method="get" id="clubDateForm">
						<%-- <i class="fa-solid fa-chevron-left"></i> --%>
						<div class="k_select_wrap">
							<span><i class="fa-solid fa-caret-right"></i>모임 장소: </span>
							<select name="" id="" >
								<option value="">서울특별시</option>
							</select>
							<select name="" id="" >
								<option value="">전체</option>
							</select>
						</div>
						<div>
							<span><i class="fa-solid fa-caret-right"></i>모임 날짜: </span>
							<input type='date' name="searchDate" id="searchDate"/>
							<input type='submit' value='검색' onclick='searchWithDate();'>
						</div>
					</form>
				</div>

				<!-- 데이터 뿌릴 영역 -->
				<ul class="k_party_list_boxes">
					<%-- 파티 리스트 반복 --%>
					<c:forEach var="vo" items="${list}">
						<li class="k_one_box open_modal" onclick="modal_data(${vo.no});">
							<ul>
								<li class="k_box_title">${vo.course_name}</li>
								<li>${vo.meeting_time} /총 ${vo.number}명</li> 

								<%-- 개구리 아이콘 출력 반복 --%>
								<li class="k_box_frogs">
									<c:forEach var="i" begin="1" end="${vo.number}">
										<%-- 참여자 있음 --%>
										<c:if test="${i <= vo.current_number}">
											<i class="fa-solid fa-frog active"></i>
										</c:if>
										<%-- 참여자 없음 --%>
										<c:if test="${i > vo.current_number}">
											<i class="fa-solid fa-frog"></i>
										</c:if>

									</c:forEach>
								</li> 
								<li>클럽명 : ${vo.partyname}</li>
							</ul>
						</li>
					</c:forEach>

					<li class="k_one_box open_modal">
						<ul>
							<li class="k_box_title">중량천 하류 산책로</li>
							<li>9/1(목) 19:00 / 총 5명</li>
							<li class="k_box_frogs">
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
							</li>
							<li>파티명 : 성동구 토박이들</li>
						</ul>
					</li>

			

					<li class="k_one_box open_modal">
						<ul>
							<li class="k_box_title">중량천 하류 산책로</li>
							<li>9/1(목) 19:00 / 총 5명</li>
							<li class="k_box_frogs">
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
							</li>
							<li>파티명 : 성동구 토박이들</li>
						</ul>
					</li>

					<li class="k_one_box open_modal">
						<ul>
							<li class="k_box_title">중량천 하류 산책로</li>
							<li>9/1(목) 19:00 / 총 5명</li>
							<li class="k_box_frogs">
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
							</li>
							<li>파티명 : 성동구 토박이들</li>
						</ul>
					</li>

					<li class="k_one_box open_modal">
						<ul>
							<li class="k_box_title">중량천 하류 산책로</li>
							<li>9/1(목) 19:00 / 총 5명</li>
							<li class="k_box_frogs">
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog active"></i>
								<i class="fa-solid fa-frog"></i>
								<i class="fa-solid fa-frog"></i>
							</li>
							<li>파티명 : 성동구 토박이들</li>
						</ul>
					</li>
				</ul>
				<div class="k_party_list_more"><i class="fa-solid fa-caret-down"></i></div>
			</div>
		</div>
	</section>

	<!-- --------- PARTY Details--------- -->
	<section class="k_selected_party_detail modal">
		<div class="k_wrapper modal_body">
			<div class="k_party_detail_box">
				<div class="k_party_detail_box_left">
					<span id="k_course_name">서울숲 외곽 코스</span>
					<div class="k_party_detail_img"></div>
					<div class="k_party_detail_who">
						<div>파티장 정보</div>
						<ul>
							<li id="k_nickname">닉네임: <span></span></li>
							<li id="k_total_km">이번 달 걸은 거리: <span></span></li>
							<li id="k_plog_count">이번 달 플로깅 횟수: <span></span></li>
						</ul>
						<div>참여 파티원</div>
						<ul id="k_current_number">
						</ul>
					</div>
				
				</div>
				<ul class="k_party_detail_box_right">
					<li><span>파티명</span></li>
					<li id="k_partyname"><span></span></li>
					<li><span>소요시간/거리</span></li>
					<li id="k_d_and_t"><span></span></li>
					<li><span>모집 인원</span></li>
					<li id="k_number"><span></span></li>
					<li><span>모집 일시</span></li>
					<li id="k_meeting_time"><span></span></li>
					<li><span>만남 장소</span></li>
					<li id="k_meeting_place"><span></span></li>
					<li><span>기타 안내</span></li>
					<li id="k_content"><span></span></li>
				</ul>

			</div> 
			<div class="k_party_detail_join">
				<div class="k_close_popup click-btn">돌아가기</div>
				<div class="click-btn"><a href="javascript:ask_join_in();">모임 참여 신청하기</a></div>
			</div>
		</div>
	</section>


	<!-- --------- START NEW PARTY --------- -->
	<section class="k_start_new_party">
		<div class="k_wrapper">
			<div class="k_section_title">
				<div>원하는 모임이 없다면,</div>
				<div class="k_green">나의 파티 만들기 <i class="fa-solid fa-circle-plus"></i></div>
			</div>
			<ul>
				<li class="click-btn"><a href="/club/make_club_rec_path">추천 코스 선택하기</a></li>
				<li class="click-btn"><a href="/club/make_club_new_path">나만의 코스 만들기</a></li>
			</ul>
		</div>
	</section>
	</body>
</html>
