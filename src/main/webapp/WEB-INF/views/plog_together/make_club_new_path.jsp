<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="/js/k_script.js" type="text/javascript"></script>

</head>

<body class="k_body">
		<!-- --------- NEW PARTY with rec paths --------- -->
		<section class="k_new_party_rec_path">
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
						<i class="fa-solid fa-angle-right"></i>
						모임 만들기
						<i class="fa-solid fa-angle-right"></i>
						나의 경로 만들기
					</div>
				</div>

				<div class="k_section_title">
					<div>원하는 모임이 없다면,</div>
					<div class="k_green">나의 모임 만들기 <i class="fa-solid fa-circle-plus"></i></div>
					<button class="k_my_party click-btn-l">
						<a href="/club/my_club_list">나의 모임 관리</a>
					</button>
				</div>
			</div>

			<!-- ----------- make path ------------->
			<div class="k_path_list">
				<div class="k_wrapper">
					<ul class="k_rec_path_button">
						<li class="click-btn-w"><a href="/club/make_club_rec_path">추천 코스 선택하기</a></li>
						<li class="active click-btn"><a href="/club/make_club_new_path">나만의 코스 만들기</a></li>
					</ul>

					<div class="k_path_list_bg">
						<!-- recommendation path select -->
						<form action="">
							<div class="k_make_path">
								<div class="k_make_path_map"></div>
								<ul class="k_make_path_detail">
									<li class="k_green"><label for="">코스명</label></li>
									<li class="k_path_detail_in"><input type="text" id="" name=""><input type="button" value="중복검사"></li>
									<li class="k_green"><label for="">시작 위치</label></li>
									<li class="k_path_detail_in"><input type="text" id="" name=""></li>
									<li class="k_green"><label for="">경유 위치</label></li>
									<li class="k_path_detail_in"><input type="text" id="" name=""></li>
									<li class="k_green"><label for="">도착 위치</label></li>
									<li class="k_path_detail_in"><input type="text" id="" name=""></li>
									<li class="k_make_path_total" ><span>예상 소요 시간: / 예상 거리: </span></li>
									<li class="k_make_path_total"><input type="submit" value="코스 저장"></li>
								</ul>
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>

	<!-- k_new_party_setting -->
		<section class="k_new_party_setting">
			<div class="k_wrapper">
				<form action="/club/makeNewClub" method="post" id="k_party_set_frm">
				<input type="hidden" name="course_no"  id="k_party_set_course_no"/>
				<div class="k_section_title">
					<div>플로깅 할 사람 여기여기 모여라</div>
					<div class="k_green">모임 세팅 <i class="fa-solid fa-gear"></i></div>
				</div>

				<div class="k_party_set">
						<ul class="k_party_set_left">
							<li>모임 가이드</li>
							<li class="k_party_set_guide"></li>
							<li><input type="checkbox" id="k_party_set_agree">위 모임 가이드를 확인하였습니다.</li>
						</ul>
						<div class="k_party_set_line"></div>
						<ul class="k_party_set_right">
							<li><label class="k_green" for="">모임명</label></li>
							<li class="k_party_set_in"><input type="text" name="partyname" id="k_party_set_party_name" placeholder="파티명을 입력하세요"><input type="button" value="중복검사" onclick="checkPartyname()"></li>
							<li><label class="k_green" for="">코스명</label></li>
							<li class="k_party_set_in"><input type="text" name="course_name" id="k_party_set_course_name" value="" readonly></li>
							<li><label class="k_green" for="">모집인원</label></li>
							<li class="k_party_set_in"><input type="number" name="number" id="k_party_set_party_number" min="2" max="12" placeholder="인원 수"></li>
							<li><label class="k_green" for="">모집일시</label></li>
							<li class="k_party_set_in"><input type="datetime-local" name="meeting_time" id="k_party_set_meeting_time" value=""></li>
							<li><label class="k_green" for="">만남장소</label></li>
							<li class="k_party_set_in"><input type="text" name="meeting_place" id="k_party_set_meeting_place" placeholder="만남장소를 입력하세요"></li>
						</ul>
						<div class="k_party_set_buttom">
							<label class="k_green" for="">세부 알림 사항</label>
							<textarea name="content" id="k_content" ></textarea>
						</div>
				</div>
				<div class="k_party_set_button">
					<div class="click-btn k_party_frm_submit">모임 등록</div>
				</div>
			</form>
			</div>
	</section>

</body>
</html>