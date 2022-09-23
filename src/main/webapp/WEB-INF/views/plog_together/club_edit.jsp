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
						
					</div>
				</div>

				<div class="k_section_title">
					<div>플로깅 약속 잊지말기!</div>
					<div class="k_green">나의 클럽 관리하기&nbsp<i class="fa-solid fa-list-check"></i></div>
				</div>
			</div>
	<!-- --------- PARTY Details--------- -->
	<section class="k_selected_party_detail">
		<div class="k_wrapper">
			<div class="k_party_detail_box">
				<form action="/club/rewriteParty" method="post" id="k_editPartyFrm" style="display: flex;">
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
						<li id="k_partyname">
							<span><input name="partyname" type="text" value="${pvo.partyname}" id="k_party_set_party_name"></span>
							<input type="button" value="중복검사" onclick="checkPartyname()">
						</li>
						<li><span>코스 위치</span></li>
						<li id="k_addr"><span>${pvo.addr}</span></li>
						<li><span>소요시간/거리</span></li>
						<li id="k_d_and_t"><span>${pvo.distance} / ${pvo.time}</span></li>
						<li><span>모집 인원</span></li>
						<li id="k_number"><span><input name="number" type="number" min=3 max=12 value="${pvo.number}" id="k_party_set_party_number"></span></li>
						<li><span>모집 일시</span></li>
						<li id="k_meeting_time"><span><input name="meeting_time" type="date" id="k_party_set_party_meeting_time">${pvo.meeting_time}</span></li>
						<li><span>만남 장소</span></li>
						<li id="k_meeting_place"><span><input name="meeting_place" type="text" value="${pvo.meeting_place}" id="k_party_set_party_meeting_place"></span></li>
						<li><span>기타 안내</span></li>
						<li id="k_content"><span><textarea name="content">${pvo.content}</textarea></span></li>
							
					</ul>
					<input type="hidden" value="${pvo.no}" name="no">
					<input type="hidden" value="${pvo.id}" name="id">
				</form>			
			</div> 


			<div class="k_party_detail_join">
				<c:if test="${logStatus=='Y'&& pvo.id==logId}">
					<%-- <div class="click-btn"><a href="/club/club_edit?no="${pvo.no}">모임 수정</a></div> --%>
					<div class="click-btn k_party_frm_submit"><a href="">저장</a></div>
				</c:if>
				<div class="click-btn"><a href="/club/club_view?no=${pvo.no}&l_id=${pvo.id}">돌아가기</a></div>
			</div>
		</div>
	</section>

	</body>
</html>
