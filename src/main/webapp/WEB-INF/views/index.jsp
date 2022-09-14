<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Frog-ging</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  <!--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>-->
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<link rel="stylesheet" href="/js_css/style.css" type="text/css"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
   	</head>
   	<style>
	html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 77.3%;
      margin: 0 auto;
      padding: auto;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: auto;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }    
	.swiper-container-vertical>.swiper-pagination-bullets{
    	top: unset !important;
    	bottom: 10px;
    	left: 0;
    	width: 100%;
	}
	.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{
  		display : inline-block !important;
  		margin: 6px 2px !important;
	}
        .card-body{
          height:300px;
        }
        .row{
          display: flex;
          overflow: initial;
        }
        .p_plogging-btn:hover{
	      background-color: #2fb86a;
        }
        .p_plogging-btn{
        background-color:white; border-radius:10px; border : 1px solid white; color:#2fb86a;
        }
    </style>
	<script>

	</script>
<body style="overflow-x: hidden">
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="p_mainContent">
	                    <div class="p_nav">
	                        <h3>함께하는 플로깅 <br/> Frog-ging</h3> <br/> 환경보호 활동과 운동을 한번에! <br/><br/>					
	                        <input type="button" value="함께하기" class="p_plogging-btn" onclick=""/>
	                        <input type="button" value="혼자하기" class="p_plogging-btn" onclick=""/>					
	                    </div>
	                    <div class="p_section">
	                        <h3>이번주 기록</h3> <h4>금주의 기록을 확인하세요!</h4><br/>
	                        <div class="p_section-ment">
	                        총 1050KG 의 쓰레기가 수거되었어요!<br/>
	                        총 30000 의 km을 걸으셨어요!<br/>
	                        총 130개 의 파티가 만들어졌어요!<br/>
	                        총 600번 의 프로깅이 기록되었어요!<br/>		
	                        </div>
	                    </div>
	                </div>
			</div>
			<div class="swiper-slide">
				<div class="p_main-plogging">
	                    <div class="p_plogging-ment">
	                        <img src="./img/plogging-ment.jpg" alt="플로깅" class="plogging-img" style="height: 200px; width:300px;" />
	                        <h1 style="color:#2fb86a; font-family: 'Jua', sans-serif;">플로깅(plogging)?</h1><br/>
	                        <h5 style="font-family: 'Noto Sans KR', sans-serif;">
	                        스웨덴어의 '플로카 우프(plocka upp 줍다)'와 영어단어 조깅(jogging)을 합성한 단어로<br/>
	                        '쓰레기를 주으며 조깅하기'라는 의미에요.<br/>
	                        한국에서는 '줍다'와 '조깅'을 결합한 '줍깅'이라는 용어를 사용하기도 해요.<br/>
	                        조깅을 하는 동안 눈에 띄는 쓰레기를 줍는 일로, 운동으로 건강을 챙기는 동시에 환경을 지키기 위한<br/>
	                        작은 실천에 동참하자는 취지로 행하는 환경보호운동이라 할 수 있어요.<br/>
	                        </h5>
	                        <h1> </h1><br/>
	                        <a href="#">프로젝트 소개 보러가기</a>
	                    </div>
	                </div>
			</div>
			<div class="swiper-slide">
				<div class="p_main-event">               
	                    <h2 style="font-weight: bold; font-family: 'Jua', sans-serif;">진행중인 이벤트</h2><br/>
	                    <h5>여러곳에서 진행하는 다양한 플로깅 이벤트를 확인해보세요.</h5>
	                    <br/>	
	                     <div class="container">
	                          <div class="row">
	                            <div class="col-4">
	                              <div class="card">
	                                <div class="card-header">
	                                  2022년 9월 15일~ 10월 17일
	                                </div>
	                                <div class="card-body">
	                                  <h5 class="card-title"></h5>
	                                  <img src="./img/event1.png" alt="이벤트" class="card-img" style="height: 70%; width:100%;" />
	                                  <p class="card-text"></p>
	                                  <a href="#" class="btn btn-primary" style="background-color:#2fb86a; border:1px solid #2fb86a;">이벤트 바로가기</a>
	                                </div>
	                              </div>
	                            </div>
	                            <div class="col-4">						       
	                              <div class="card">
	                                  <div class="card-header">
	                                  2022년 9월 2일~ 10월 1일
	                                  </div>
	                                <img src="images/card-image.png" alt="" class="card-img-top" />
	                                <div class="card-body">
	                                  <h5 class="card-title"></h5>
	                                  <img src="./img/event2.png" alt="이벤트" class="card-img" style="height: 70%; width:100%;" />
	                                  <p class="card-text"></p>
	                                  <a href="#" class="btn btn-primary" style="background-color:#2fb86a; border:1px solid #2fb86a;">이벤트 바로가기</a>
	                                </div>
	                              </div>
	                            </div>
	                            <div class="col-4">
	                              <div class="card">
	                                  <div class="card-header">
	                                    2022년 9월 7일~ 9월 28일
	                                  </div>
	                                <div class="card-body">
	                                  <h5 class="card-title"></h5>
	                                    <img src="./img/event3.png" alt="이벤트" class="card-img" style="height: 70%; width:100%;" />
	                                  <p class="card-text"></p>
	                                  <a href="#" class="btn btn-primary" style="background-color:#2fb86a; border:1px solid #2fb86a;">이벤트 바로가기</a>
	                                </div>
	                              </div>
	                            </div>
	                          </div>
	                          <div class="p_event-btn-area">
	                            <input type="button" value="더보기" onclick="location.href='eventList.html';" class="p_event-btn">
	                          </div>
	                        </div>
	                        
	                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  
	                   </div>
			</div>
			<div class="swiper-pagination"></div>
		
		  <!-- If we need navigation buttons -->
		  <div class="swiper-button-prev"></div>
		  <div class="swiper-button-next"></div>
		
		  <!-- If we need scrollbar -->
		  <div class="swiper-scrollbar"></div>
			<script>
			const swiper = new Swiper('.swiper-container', {
				  //기본 셋팅
				  //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
				  direction: 'horizontal',
				  //한번에 보여지는 페이지 숫자
				  slidesPerView: 1,
				  //페이지와 페이지 사이의 간격
				  spaceBetween: 30,
				  //드레그 기능 true 사용가능 false 사용불가
				  debugger: true,
				  //마우스 휠기능 true 사용가능 false 사용불가
				  mousewheel: true,
				  //반복 기능 true 사용가능 false 사용불가
				  loop: true,
				  //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
				  centeredSlides: true,
				  // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
				  // effect: 'fade',
				  
				  
				  //자동 스크를링
				  autoplay: {
				    //시간 1000 이 1초
				    delay: 2500,
				    disableOnInteraction: false,
				   },
				  
				  //페이징
				  pagination: {
				    //페이지 기능
				    el: '.swiper-pagination',
				    //클릭 가능여부
				    clickable: true,
				  },

				  //방향표
				  navigation: {
				    //다음페이지 설정
				    nextEl: '.swiper-button-next',
				    //이전페이지 설정
				    prevEl: '.swiper-button-prev',
				  },
				  
				});
			</script>
		</div>
	</div>   
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
	</style>
	<script>
	</script>
</head>
<body>
	<div class="container">
		<ul>
			<li><a href="/club/join_club">함께하기</a></li>
			<li><a href="/alone/alone_rec_path">혼자하기</a></li>
			<li><a href="/IntroductionForm">소개페이지</a></li>
			<li><a href="/login">로그인페이지</a></li>
			<li><a href="/rankingForm">랭킹페이지</a></li>
		</ul>
	</div>
>>>>>>> c930a8608e247df7f9b27209cb1a5fe1bc93e20b
</body>
</html>