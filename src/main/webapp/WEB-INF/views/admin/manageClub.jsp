<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="/js/k_admin.js"></script>
</head>
	<ul class="adminMenu">
		<li class="tabMenu"><a href="/admin/userlist">사용자목록</a></li>
		<li class="tabMenu"><a href="/admin/communityList">커뮤니티관리</a></li>
		<li class="tabMenu"><a href="/admin/eventList">이벤트관리</a></li>
		<li class="tabMenu"><a href="/admin/qnaList">QnA관리</a></li>
		<li class="tabMenu"><a href="/admin/customerServiceList">고객센터관리</a></li>
		<li class="tabMenu"><a href="/admin/manageCourse">코스관리</a></li>
		<li class="tabMenu"><a href="/admin/manageClub">클럽관리</a></li>
		<li class="tabMenu"><a href="/admin/statistic">데이터관리</a></li>
	</ul>
<body class="k_body">
	<div style="height:100%;">
	<section>
		<div class="k_wrapper">


			<div class="k_section_title">
				<div>클럽 관리</div>
			</div>

		</div>
	</section>

	<section class="k_mycourse">
		<div class="k_wrapper">
			<form method="post" action="/admin/clubMultiDel" id="listFrm">
			<ul class="k_my_club_grid">
				<li class="k_my_list_head"><span>번호</span></li>
				<li class="k_my_list_head"><span>파티명</span></li>
				<li class="k_my_list_head"><span>코스명</span></li>
				<li class="k_my_list_head"><span>일시</span></li>
				<li class="k_my_list_head"><span>인원</span></li>
				<li class="k_my_list_head"><span>관리</span></li>
				<c:forEach var="vo" items="${c_list}">
					<li><span>${vo.no}</span></li>
					<li><a href="/club/club_view?no=${vo.no}&l_id=${vo.id}"><span>${vo.partyname}</span></a></li>
					<li><a href="/mypage/myCourseView?no=${vo.no}"><span>${vo.course_name}</span></a></li>
					<li><span>${vo.meeting_time}</span></li>
					<li class="open_modal" onclick="modal_data(${vo.no});">
						<span>${vo.current_number}/${vo.number}</span>
					</li>
					<li><span><input type="checkbox" name="noList" value="${vo.no}"></span></li>
				</c:forEach>
			</ul>
			<div class="k_manage_btn_section">
				<input type="checkbox" class="allChk">
				<input type="submit" class="delBtn" value="삭제하기">
			</div>

			</form>
		</div>
	</section>
	</div>
</body>
