<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
</head>
<body class="k_body">
	<section>
		<div class="k_wrapper">

			<div class="k_section_title_links">
				<div>
					<i class="fa-solid fa-square-caret-right k_green"></i>
					<a href="/mypage/my">
						마이페이지
					</a>
					<a href="/mypage/myDetail">
						<i class="fa-solid fa-angle-right"></i>
						나의 상세정보
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<div class="k_green" >
					프로거 ${logNickName }의 
				</div>
				<div>상세정보</div>
			</div>

		</div>
	</section>

	<section class="k_mydetail">
		<div class="k_wrapper">
			<form action="">
			<div class="k_mydetail_info">
				<div class="k_mydetail_pic">
					<form action="">
						<div class="k_mydetail_imgbox"><img src="/img/profile.png" alt=""></div>	
						프로필 이미지 업로드 <input type="file" /> 
					</form>
				</div>
				
			
				<ul class="k_mydetail_list">
					<li class="k_mydetail_label">이름</li>
					<li>${u_vo.name}</li>
					<li class="k_mydetail_label">닉네임</li>
					<li><input type="text" value="${u_vo.nickname }"></li>
					<li class="k_mydetail_label">아이디</li>
					<li>${u_vo.id }</li>
					<li class="k_mydetail_label">성별</li>
					<li>
						<select name="" id="">
							<option value="1">남성</option>
							<option value="2">여성</option>
						</select>
					</li>
					<li class="k_mydetail_label">키</li>
					<li><input type="number" value="${u_vo.height}">cm</li>
				</ul>
			</div>

			</form>
		</div>

		<div class="k_mydetail_set">
			<div><a href="/mypage/myDetail">돌아가기</a></div>
			<c:if test="${u_vo.id == logId}">
				<div><a href="/mypage/myDetailEditOk">저장하기</a></div>
			</c:if>
			</div>
	</section>
</body>