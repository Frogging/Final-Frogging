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
	<script src="/js/k_script.js" type="text/javascript"></script>
	<title>혼자하기-새경로</title>
</head>
<body>
	<header></header>
		<!-- --------- NEW PARTY with rec paths --------- -->
		<section class="k_new_party_rec_path">
			<div class="k_wrapper">
				<div class="k_section_title">
					<div>오늘은 혼자 걷고 싶어!</div>
					<div class="k_green">프로깅 혼자하기  <i class="fa-solid fa-circle-plus"></i></div>
				</div>
			</div>

			<!-- ----------- make path ------------->
			<div class="k_path_list">
				<div class="k_wrapper">
					<ul class="k_rec_path_button">
						<li><a href="/alone/alone_rec_path">추천 코스 선택하기</a></li>
						<li class="active"><a href="/alone/alone_new_path">나만의 코스 만들기</a></li>
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
					<div class="k_alone_start_button">
						<div>혼자 프로깅 시작</div>
					</div>
				</div>
			</div>
		</section>
		<footer></footer>
</body>
</html>