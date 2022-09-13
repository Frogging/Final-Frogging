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
	<title>나의 클럽리스트</title>
</head>
<body onload="modal_more()">
	<header></header>
		<!-- --------- party_list --------- -->
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
						나의 클럽 관리
					</div>
				</div>

				<div class="k_section_title">
					<div>플로깅 약속 잊지말기!</div>
					<div class="k_green">나의 클럽 관리하기&nbsp<i class="fa-solid fa-list-check"></i></div>
				</div>
			</div>

			<!-- ----------- party_list(참여한 파티) ------------->
			<div class="k_my_party_join">
				<div class="k_wrapper">
					<div class="k_my_party_list_title">참여 중인 클럽</div>
					<div class="k_bg_white_wrapper">
						<ul class="k_my_party_grid">
							<li class="k_my_list_head">번호</li>
							<li class="k_my_list_head">파티명</li>
							<li class="k_my_list_head">코스</li>
							<li class="k_my_list_head">일시</li>
							<li class="k_my_list_head">상태</li>

							<li>12</li>
							<li><a href="">서울숲 한바퀴</a></li>
							<li><a href="">응봉산~서울숲 코스</a></li>
							<li>10/11 18:00</li>
							<li>수락 대기</li>
						</ul>

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

		<!-- ----------- party_list(운영하는 파티) ------------->
		<section class="k_my_party_manage">
			<div class="k_wrapper">
				<div class="k_my_party_list_title">내가 운영하는 클럽</div>
				<div class="k_bg_white_wrapper">
					<ul class="k_my_party_grid">
							<li class="k_my_list_head">번호</li>
							<li class="k_my_list_head">파티명</li>
							<li class="k_my_list_head">코스</li>
							<li class="k_my_list_head">일시</li>
							<li class="k_my_list_head">관리</li>

							<li>12</li>
							<li><a href="">서울숲 한바퀴</a></li>
							<li><a href="">응봉산~서울숲 코스</a></li>
							<li>10/11 18:00</li>
							<li class="open_modal">3/6 &nbsp&nbsp<i class="fa-solid fa-n k_green"></i></li>

							<li>13</li>
							<li><a href="">왕십리역 한바퀴</a></li>
							<li><a href="">왕십리역~한강공원 코스</a></li>
							<li>10/12 18:00</li>
							<li class="open_modal">2/6 &nbsp&nbsp</li>
					</ul>

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
		</section>

		<%-- my party-manage-detail --%>
		<section class="k_selected_m_party_detail modal">
			<div class="k_wrapper modal_body">
				<div class="k_m_party_detail_box">
					<div class="k_my_party_list_title">클럽 참여 인원보기</div>
					<ul class="k_party_manage_infos">
						<li class="k_my_list_head">파티번호</li>
						<li class="k_my_list_head">파티명</li>
						<li class="k_my_list_head">신청 닉네임</li>
						<li class="k_my_list_head">상태</li>
						<li class="k_my_list_head">확인</li>

						<li>11</li>
						<li>중랑천 빠르게 걷기</li>
						<li>샘플닉네임11</li>
						<li>수락 대기</li>
						<li><button>수락</button><button>거절</button></li>

						<li>11</li>
						<li>중랑천 빠르게 걷기</li>
						<li>샘플닉네임12</li>
						<li>수락 완료</li>
						<li><button>삭제</button></li>

						<li>11</li>
						<li>중랑천 빠르게 걷기</li>
						<li>샘플닉네임13</li>
						<li>수락 대기</li>
						<li><button>수락</button><button>거절</button></li>

						<li>11</li>
						<li>중랑천 빠르게 걷기</li>
						<li>샘플닉네임13</li>
						<li>수락 완료</li>
						<li><button>삭제</button></li>
					</ul>

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

				<div class="k_party_detail_join">
					<div class="k_close_popup click-btn">돌아가기</div>
				</div>
			</div>
		</section>


		<footer></footer>
</body>
</html>