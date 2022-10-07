<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
</head>
<body class="k_body">
<%-- 나의 프로필 --%>
	<section class="k_mypage_top">
		<div class="k_wrapper">

			<div class="k_section_title_links">
				<div>
					<i class="fa-solid fa-square-caret-right k_green"></i>
					<a href="/mypage/my">
						마이페이지
					</a>
				</div>
			</div>
		</div>
	</section>
	
	<section class="k_profile">
		<div class="k_wrapper">

			<div class="k_profile_main">

				<div class="k_pro_left">
					<div class="k_pro_img"><img src="/img/profile.png" alt=""></div>
					${logNickName}
				</div>

				<div class="k_pro_line">
				</div>

				<div class="k_pro_right">
					<ul>
						<li>거리 랭킹: ${plog_count}위</li>
						<li>횟수 랭킹: ${distance}위</li>
						<li><a href="/mypage/myDetail">나의 상세정보</a></li>
						<li><a href="/mypage/activity">나의 플로깅 활동</a></li>
					</ul>
				</div>

			</div>
			
		</div>
	</section>

<%-- 내가 쓴  글 --%>
	<section class="k_mywrite">
		<div class="k_section_title">
				<div>내가 쓴 글 보기</div>
			</div>
		<div class="k_wrapper">
			

			<ul class="k_my_party_grid">
				<li class="k_my_list_head"><span>분류</span></li>
				<li class="k_my_list_head"><span>제목</span></li>
				<li class="k_my_list_head"><span>작성일</span></li>
				<li class="k_my_list_head"><span>댓글수</span></li>
				<li class="k_my_list_head"><span>조회수</span></li>

				<c:forEach var="vo" items="${c_list}">
					<li><span>커뮤니티</span></li>
					<li><span>${vo.subject}</span></li>
					<li><span>${vo.writedate}</span></li>
					<li><span>-</span></li>
					<li><span>${vo.hit}</span></li>
				</c:forEach>

				<li><span>커뮤니티</span></li>
				<li><span>10월 가을 프로깅 코스 추천!</span></li>
				<li><span>2022-10-02</span></li>
				<li><span>3</span></li>
				<li><span>23</span></li>

				<li><span>고객센터</span></li>
				<li><span>프로깅 기록이 이상해요</span></li>
				<li><span>2022-10-01</span></li>
				<li><span>1</span></li>
				<li><span>3</span></li>
			</ul>
		</div>
	</section>


<%-- 나의 달성 기록 --%>
	<section class="k_achieve">
		<div class="k_section_title">
					<div>나의 달성 기록</div>
			</div>
		<div class="k_wrapper">

			<div class="k_achieve_badge">
				<i class="fa-solid fa-caret-left"></i>
				<ul>
					<li><img src="/img/5k.png" alt=""></li>
					<li><img src="/img/10k.png" alt=""></li>
					<li><img src="/img/10l.png" alt=""></li>
					<li><img src="/img/20l.png" alt=""></li>
				</ul>
				<i class="fa-solid fa-caret-right"></i>		
				</div>	
		</div>

	</section>

</body>
