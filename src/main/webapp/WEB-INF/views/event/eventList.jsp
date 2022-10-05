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
              <div class="col-4" >
        		<c:if test="${vo.imgName!=null}">
              		<img alt="이벤트 사진" src="${vo.imgName}" class="card-img"/>
              	</c:if>
              	<c:if test="${vo.imgName==null}">
              		<img alt="이벤트 사진" src="/img/event1.png" class="card-img"/>
              	</c:if>
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
