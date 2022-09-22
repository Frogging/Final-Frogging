<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
       integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/p_style.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<style>
.card{
	height: 200px;
	width:80%;
	margin: 0 auto;
}
.row no-gutters{
 	margin: 5px;
}
.col-8{
 	margin: 5px auto;
}
img{ width: 150px; height:200px;}
.card-body{
	 font-family: 'Noto Sans KR', sans-serif;
	 text-overflow:ellipsis;
}
.card-text{
	width:100%;
	text-overflow:hidden;
}
</style>
<script>
$(function(){
	$(".e_searchForm").submit(function(){
		if($(".e_searchWord").val()==""){
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	});
});
</script>
  <body style="overflow-x: hidden">
    <div class="p_container">
        <br/><h1 class="p_title">이벤트 게시판</h1><br/>
      <c:forEach var="vo" items="${list }">
      <div class="row">
        <div class="col-8" style="font-family: 'Noto Sans KR', sans-serif;">
         <!--  <p class="p_eventList">no${vo.no } 조회수:${vo.hit } 게시날짜:${vo.writedate } 관리자:${vo.id }</p><hr/>--> 
          <div class="card">
            <div class="row no-gutters">
              <div class="col-4">
                <img src="../img/event1.png" alt="이벤트" class="card-img" />
              </div>
              <div class="col-8">
                <div class="card-body">
                    <p class="card-subject">no${vo.no }  조회수:${vo.hit }  게시날짜:${vo.writedate }  관리자:${vo.id }</p><hr/>
                  <p class="card-text"><a href="/event/eventView?no=${vo.no }&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${vo.subject }</a></p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 지구도 지키고 건강도 지키는 플로깅 이벤트
        <div class="col-8">
            <p></p>
            <div class="card">
              <div class="row no-gutters">
                <div class="col-4">
                  <img src="../img/event2.png" alt="이벤트" class="card-img" />
                </div>
                <div class="col-8">
                  <div class="card-body">
                    <p class="card-subject">'함께 줍깅-아름다운 바다를 위해 걷고, 담고, 응원해요'</p><hr/>
                    <p class="card-text">마녀공장은 오는 9월 6일 자원 순환의 날을 맞아 국제구호개발NGO ‘휴먼인러브’와 내달 1일 충남 보령 원산도 해수욕장에서 탄소저감과 환경보호를 위한 플로깅 행사를 개최한다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-8">
            <p></p>
            <div class="card">
              <div class="row no-gutters">
                <div class="col-4">
                  <img src="../img/event3.png" alt="이벤트" class="card-img" />
                </div>
                <div class="col-8">
                  <div class="card-body">
                    <p class="card-subject">KB금융 한강공원 플로깅 캠페인</p><hr/>
                    <p class="card-text">KB금융, 28일 반포 한강공원에서 플로깅 캠페인 진행한다. KB금융은 이번 프로젝트를 통해 국민들이 자연스럽게 플로깅 문화를 익히고, 환경정화 활동에 손쉽게 참여할 수 있도록 할 계획이다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8">
            <p></p>
            <div class="card">
              <div class="row no-gutters">
                <div class="col-4">
                  <img src="../img/event4.png" alt="이벤트" class="card-img" />
                </div>
                <div class="col-8">
                  <div class="card-body">
                    <p class="card-subject">거제 씨월드 플로깅 캠페인</p><hr/>
                    <p class="card-text">플로깅 하고! 환경 생각도 하고! 거제씨월드 무료입장도 하고! <br/>
                        지구를 살리는 아름다운 달리기를 거제씨월드와 함께해요</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
         --> 
       </div>
       </c:forEach>
    </div>
        <div class="p_eventListForm">
            <form method="get" action="/event/eventList" class="e_searchForm">
                <select name="searchKey" class="e_searchKey" style="height:40px;">
                    <option value="subject">이벤트명</option>
                    <option value="content">이벤트내용</option>
                </select>
                <input type="text" name="searchWord" class="e_searchWord" style="width:300px;"/>
                <input type="submit" value="찾기" class="p_eventsearch-btn"/>
            </form>	
            <div class="p_eventwrite">
            	<input type="button" class="p_eventwrite-btn" value="글쓰기" onclick="location.href='/event/eventForm'"/>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </body>
