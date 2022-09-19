<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="/js/k_script.js" type="text/javascript"></script>

</head>
<body onload="modal_more()" class="k_body">

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


							<c:forEach var="vo" items="${join_list}">
								<li>${vo.no}</li>
								<li><a href="">${vo.partyname}</a></li>
								<li><a href="">${vo.course_no}</a></li>
								<li>${vo.meeting_time}</li>
								<li>${vo.join_status}</li>
							</c:forEach>
							
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


							<c:forEach var="vo" items="${manage_list}">
								<li>${vo.no}</li>
								<li><a href="">${vo.partyname}</a></li>
								<li><a href="">${vo.course_no}</a></li>
								<li>${vo.meeting_time}</li>
								<li class="open_modal">
									<span>${vo.current_number}/${vo.number}</span>
									<i class="fa-solid fa-gear k_green click-btn-c"></i>
								</li>
							</c:forEach>

							<li>12</li>
							<li><a href="">서울숲 한바퀴</a></li>
							<li><a href="">응봉산~서울숲 코스</a></li>
							<li>10/11 18:00</li>
							<li class="open_modal">
								<span>2/6</span>
								<i class="fa-solid fa-n k_green click-btn-c"></i>
								<i class="fa-solid fa-gear k_green click-btn-c"></i>
							</li>

							<li>13</li>
							<li><a href="">왕십리역 한바퀴</a></li>
							<li><a href="">왕십리역~한강공원 코스</a></li>
							<li>10/12 18:00</li>
							<li class="open_modal">
								<span>2/6</span>
								<i class="fa-solid fa-gear k_green click-btn-c"></i>
							</li>
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
						<li><button>퇴장</button></li>

						<li>11</li>
						<li>중랑천 빠르게 걷기</li>
						<li>샘플닉네임13</li>
						<li>수락 대기</li>
						<li><button>수락</button><button>거절</button></li>

						<li>11</li>
						<li>중랑천 빠르게 걷기</li>
						<li>샘플닉네임13</li>
						<li>수락 완료</li>
						<li><button>퇴장</button></li>
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

</body>
</html>