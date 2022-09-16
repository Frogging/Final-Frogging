<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/p_style.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<style>

</style>
<script>
	function communityDel(){
		if(confirm("글을 삭제하시겠습니까?")){
			location.href="/community/communityDel?no=${vo.no}";
		}
	};
	

</script>
<div class="p_container">
	<h1 class="p_title">글내용보기</h1>
	
	<div id="p_communityview">
		<ul style="padding: 10 50; margin: 10px 20px;">
			<h5><li>no: ${vo.no }</li>
				<li>아이디: ${vo.id }<hr/></li>
			
				<span style="word-spacing:15px;"><li>조회수:${vo.hit } 등록일:${vo.writedate }</li></span>
				<span style="padding:1px;"><li>제목: ${vo.subject }</li></span></h5>
				
		</ul>	
		<div id="p_content">
			<ul>
				<h5><li>글내용</li>
				<span style="padding:1px;"><li>${vo.content}</li></span></h5>
			</ul>
		</div>	
	<div id="p_viewselect">
			
			<input type="button" value="목록" id="p_viewbutton" onclick="location.href='/community/communityList?nowPage=${pVO.nowPage }<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>'"/>
			<c:if test="${vo.id==logId}">
			<input type="button" value="수정" id="p_viewbutton" onclick="location.href='/community/communityEdit/${vo.no }'"/>
			<input type="button" value="삭제" id="p_viewbutton" onclick="location.href='javascript:communityDel();'"/>
			</c:if>
		</div>
	</div>
</div>