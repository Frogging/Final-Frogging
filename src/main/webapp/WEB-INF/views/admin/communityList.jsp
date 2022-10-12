<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<link rel="stylesheet" href="/css/k_style.css">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
	<script src="/js/k_admin.js" type="text/javascript"></script>
	<script src="/js/k_chart.js" type="text/javascript"></script>
</head>
<script>
$(function(){
	$(".p_searchForm").submit(function(){
		if($(".p_searchWord").val()==""){
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	});
	
	//리스트 전체 선택
	$(".p_allChk").click(function(){
		$("input[type=checkbox]").prop("checked",$(".p_allChk").prop("checked"));
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
	<ul class="adminMenu">
		<li class="tabMenu"><a href="/admin/userlist">사용자목록</a></li>
		<li class="tabMenu"><a href="/admin/communityList">게시판관리</a></li>
		<li class="tabMenu"><a href="/admin/customerServiceList">고객센터관리</a></li>
		<li class="tabMenu"><a href="/admin/manageCourse">코스관리</a></li>
		<li class="tabMenu"><a href="/admin/manageClub">클럽관리</a></li>
		<li class="tabMenu"><a href="/admin/statistic">데이터관리</a></li>
	</ul>
	<section>
		<div class="k_wrapper">

			<div class="k_section_title_links">
				<div>
					<i class="fa-solid fa-square-caret-right k_green"></i> <a
						href="/admin/adminPage"> 관리자 </a> <a href="userlist"> <i
						class="fa-solid fa-angle-right"></i> 게시판 관리
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<div>게시판 관리</div>
			</div>

		</div>
	</section>
	<section class="k_mycourse">
		<div class="k_wrapper">
			<form action="">
				<ul class="k_my_communityList_grid">
					<li class="k_my_list_head"><input type="checkbox" class="p_allChk"/><span></span></li>
					<li class="k_my_list_head"><span>번호</span></li>
					<li class="k_my_list_head"><span>제목</span></li>
					<li class="k_my_list_head"><span>작성자</span></li>
					<li class="k_my_list_head"><span>조회수</span></li>
					<li class="k_my_list_head"><span>등록일</span></li>

					<c:forEach var="vo" items="${list }">
						<li><input type="checkbox" name="noList" value="${vo.no}" /></li>
						<li>${vo.no }</li>
						<li>
							<div
								<c:if test="${vo.subject.length() >= 30}">
					style='width:90%'
				</c:if>>
								<a
									href="/community/communityView?no=${vo.no }&nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${vo.subject }</a>
							</div> <c:if test="${vo.reply_count>0}">
								<span style="margin: auto 10px;">(${vo.reply_count})</span>
							</c:if>
						</li>
						<li>${vo.id }</li>
						<li>${vo.hit }</li>
						<li>${vo.writedate }</li>
					</c:forEach>
				</ul>
			</form>
			<div class="p_page">
				<ul>
					<!-- 페이지 번호 -->
					<c:if test="${pVO.nowPage<=1 }">
						<!-- 이전페이지가 없을때 -->
						<li>이전</li>
					</c:if>
					<c:if test="${pVO.nowPage>1 }">
						<!-- 이전페이지가 있을때 -->
						<li><a
							href="/admin/communityList?nowPage=${pVO.nowPage-1 }<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">이전</a></li>
					</c:if>
					<c:forEach var="p" begin="${pVO.startPage }"
						end="${pVO.startPage+pVO.onePageCount-1 }">
						<!--  출력할 페이지번호 총페이지수 보다 작거나 같을 떄 -->
						<c:if test="${p<=pVO.totalPage }">
							<li <c:if test="${p==pVO.nowPage }">
					</c:if>><a
								href="/admin/communityList?nowPage=${p}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${p}</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음페이지 -->
					<c:if test="${pVO.nowPage==pVO.totalPage }">
						<li>다음</li>
					</c:if>
					<c:if test="${pVO.nowPage<pVO.totalPage }">
						<li><a
							href="/admin/communityList?nowPage=${pVO.nowPage+1 }<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">다음</a></li>
					</c:if>
				</ul>
			</div>
			<div>
				<form method="get" action="/community/communityList"
					class="p_searchForm">
					<select name="searchKey" class="p_searchKey">
						<option value="subject">제목</option>
						<option value="nickname">작성자</option>
						<option value="content">글내용</option>
					</select> <input type="text" name="searchWord" class="p_searchWord"
						style="height: 30px;" /> <input type="submit" value="찾기"
						class="p_communitysearch-btn" />
				</form>
			</div>
		</div>
	</section>
</body>
