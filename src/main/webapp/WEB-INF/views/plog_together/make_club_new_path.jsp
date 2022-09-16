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
							클럽 찾기
						</a>
						<i class="fa-solid fa-angle-right"></i>
						클럽 만들기
						<i class="fa-solid fa-angle-right"></i>
						나의 경로 만들기
					</div>
				</div>

				<div class="k_section_title">
					<div>원하는 파티가 없다면,</div>
					<div class="k_green">나의 파티 만들기 <i class="fa-solid fa-circle-plus"></i></div>
					<button class="k_my_party click-btn-l">
						<a href="/club/my_club_list">나의 클럽 관리</a>
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
		</section>

</body>
</html>