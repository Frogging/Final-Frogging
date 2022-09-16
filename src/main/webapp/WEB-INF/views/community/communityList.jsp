<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
       integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="/js_css/jquery-1.12.3.js"></script>
<link rel="stylesheet" href="/css/p_style.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<style>
</style>
<script>
$(function(){
	$(".p_searchFrom").submit(function(){
		if($(".p_searchWord").val()==""){
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	});
	
	//리스트 전체 선택
	$(".p_allChk").click(function(){
		$(".p_community input[type=checkbox]").prop("checked",$(".p_allChk").prop("checked"));
	});
	
	//여러개를 삭제하도록
	$(".p_multiDel").click(function(){
		//체크 갯수 확인
		var countChk = 0;		//						
		$(".p_community input[name=noList]").each(function(idx, obj){
			if(obj.checked){
				countChk++;
			}			
		});
		console.log(countChk);
		if(countChk<=0){
			alert("삭제할 레코드를 선택후 삭제하세요..");
			return false;
		}
		
		$(".p_communityForm").submit();
	});
});
</script>
<body>
    <div class="p_container">
        <span class="p_title"><h1>게시판</h1></span>
                   
        <div class="p_communityList">
              <input type="button" value="선택삭제" class="p_multiDel"/>   
        <form method="post" action="/community/multiDel" id="p_communityForm">
            <ul class="p_community">
                <li><input type="checkbox" class="p_allChk"/></li>
                <li>번호</li>
                <li>제목</li>
                <li>작성자</li>
                <li>조회수</li>
                <li>등록일</li>
                
                <c:forEach var="vo" items="${list }">
				<li><input type="checkbox" name="noList" value="${vo.no}"/></li>
				<li>${vo.no }</li>
				<li><a href="/community/communityView?no=${vo.no }&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${vo.subject }</a></li>
				<li>${vo.id }</li>
				<li>${vo.hit }</li>
				<li>${vo.writedate }</li>
				</c:forEach>	
            </ul>
        </form>
        <div class="p_page">
		<ul>
		<!-- 페이지 번호 -->
			<c:if test="${pVO.nowPage<=1 }"><!-- 이전페이지가 없을때 -->
				<li>이전</li>
			</c:if>
			<c:if test="${pVO.nowPage>1 }"><!-- 이전페이지가 있을때 -->
				<li><a href="/community/communityList?nowPage=${pVO.nowPage-1 }<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">이전</a></li>
			</c:if>
			<c:forEach var="p" begin="${pVO.startPage }" end="${pVO.startPage+pVO.onePageCount-1 }">
				<!--  출력할 페이지번호 총페이지수 보다 작거나 같을 떄 -->
				<c:if test="${p<=pVO.totalPage }">
					<li
					<c:if test="${p==pVO.nowPage }">
					</c:if>
					><a href="/community/communityList?nowPage=${p}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음페이지 -->
			<c:if test="${pVO.nowPage==pVO.totalPage }">
				<li>다음</li>
			</c:if>
			<c:if test="${pVO.nowPage<pVO.totalPage }">
				<li><a href="/community/communityList?nowPage=${pVO.nowPage+1 }<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">next</a></li>
			</c:if>
		</ul>
		</div>
        <div>
            <form method="get" action="/community/communityList" class="p_searchFrom">
                <select name="searchKey" class="p_searchKey">
                    <option value="subject">제목</option>
                    <option value="nickname">작성자</option>
                    <option value="content">글내용</option>
                </select>
                <input type="text" name="searchWord" class="p_searchWord" style="height:30px;"/>
            </form>	
            <div class="p_communitywrite">
                    <input type="button" class="p_communitywrite-btn" value="글쓰기" onclick="location.href='/community/communityForm'"/>
            </div>
        </div>
        </div>
    </div>   
</body>
