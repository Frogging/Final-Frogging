<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/k_script.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<%-- <script src="/js/k_script.js" type="text/javascript"></script>
	<script src="/js/k_club.js" type="text/javascript"></script> --%>
	<script src="/js/k_club_manage.js" type="text/javascript"></script>
</head>
<body class="k_body">
<section class="k_new_party_rec_path">
			<div class="k_wrapper">
				<div class="k_section_title_links">
					<div>

						<%-- 링크 --%>
						<c:if test="${logStatus =='Admin'}">
							<i class="fa-solid fa-square-caret-right k_green"></i>
							<a href="/">
								관리자
							</a>
							<a href="/admin/manageClub">
								<i class="fa-solid fa-angle-right"></i>
								클럽 관리
							</a>
							<a href="#">
								<i class="fa-solid fa-angle-right"></i>
								클럽 보기
							</a>
						</c:if>

						<c:if test="${logStatus !='Admin'}">
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
							<a href="/club/my_club_list">
								<i class="fa-solid fa-angle-right"></i>
								나의 클럽 관리
								<i class="fa-solid fa-angle-right"></i>
								참여 중인 클럽
						</a>
						
						</c:if>
						
					</div>
				</div>
				
				<c:if test="${logStatus !='Admin'}">
				<div class="k_section_title">
					<div>플로깅 약속 잊지말기!</div>
					<div class="k_green">나의 클럽 관리하기&nbsp<i class="fa-solid fa-list-check"></i></div>
				</div>
				</c:if>
			</div>
	<!-- --------- PARTY Details--------- -->
	<section class="k_selected_party_detail">
		<div class="k_wrapper">
			<div class="k_party_detail_box">
				<div class="k_party_detail_box_left">
					<span id="k_course_name">${pvo.course_name}</span>
					<div class="k_party_detail_img"></div>
					<div class="k_party_detail_who">
						<div>파티장 정보</div>
						<ul>
							<li id="k_nickname">닉네임: ${avo.nickname}<span></span></li>
							<li id="k_total_km">이번 달 걸은 거리:${avo.total_distance} <span></span></li>
							<li id="k_plog_count">이번 달 플로깅 횟수: ${avo.plog_count}<span></span></li>
						</ul>
						<div>참여 파티원</div>
						<ul id="k_current_number">
							<c:forEach var="i" begin="1" end="${pvo.number}">
								<%-- 참여자 있음 --%>
								<c:if test="${i <= pvo.current_number}">
									<li><i class="fa-solid fa-circle active"></i></li>
								</c:if>
								<%-- 참여자 없음 --%>
								<c:if test="${i > pvo.current_number}">
									<li><i class="fa-solid fa-circle"></i></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				
				</div>
				<ul class="k_party_detail_box_right">
					<li><span>파티명</span></li>
					<li id="k_partyname"><span>${pvo.partyname}</span></li>
					<li><span>코스 위치</span></li>
					<li id="k_addr"><span>${pvo.addr}</span></li>
					<li><span>소요시간/거리</span></li>
					<li id="k_d_and_t"><span>${pvo.distance}km / ${pvo.time}분</span></li>
					<li><span>모집 인원</span></li>
					<li id="k_number"><span>${pvo.number}명</span></li>
					<li><span>모집 일시</span></li>
					<li id="k_meeting_time"><span>${pvo.meeting_time}</span></li>
					<li><span>만남 장소</span></li>
					<li id="k_meeting_place"><span>${pvo.meeting_place}</span></li>
					<li><span>기타 안내</span></li>
					<li id="k_content"><span>${pvo.content}</span></li>
				</ul>

			</div> 
			<div class="k_party_detail_join">
				<%-- <div class="k_close_popup click-btn">수정하기</div> --%>
				<c:if test="${logStatus !='Admin'}">
					<c:if test="${pvo.id!=logId}">
						<div class="click-btn"><a href="javascript:leaveClub(${pvo.no})">참여 취소</a></div>
					</c:if>
					<c:if test="${logStatus=='Y'&& pvo.id==logId}">
						<div class="click-btn"><a href="/club/club_edit?no=${pvo.no}&l_id=${pvo.id}">모임 수정</a></div>
						<div class="click-btn"><a href="javascript:deleteClub(${pvo.no})">모임 삭제</a></div>
					</c:if>
					<div class="click-btn"><a href="/club/my_club_list">돌아가기</a></div>
				</c:if>

				<c:if test="${logStatus =='Admin'}">
					<div class="click-btn"><a href="/club/club_edit?no=${pvo.no}&l_id=${pvo.id}">모임 수정</a></div>
					<div class="click-btn"><a href="javascript:deleteClub(${pvo.no})">모임 삭제</a></div>
					<div class="click-btn"><a href="/admin/manageClub">돌아가기</a></div>
				</c:if>
			</div>
		</div>
	</section>

	</body>
</html>
