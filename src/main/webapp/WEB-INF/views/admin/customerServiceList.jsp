<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/p_style.css" type="text/css"/>
<link rel="stylesheet" href="/css/k_style.css">
<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
<style>
.listEdit-btn, .listDel-btn {    
	height: 25px;
    width: 40px;
    border : 1px solid white;
    border-radius:5px;
    color: white;
    font-weight: bold;
	border-color:#191919;color:#fff;
	background-color:#333;
	text-decoration:none; 
	   
}
.k_section_title>div>i{ /*아이콘*/
	font-size: calc(var(--size-medium-1)*1.2);
}
</style>
<script>

</script>
<body>
<div style="height:100%;">
<table width="80%" class="table01">
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
					<i class="fa-solid fa-square-caret-right k_green"></i>
					<a href="/admin/adminPage">
						관리자
					</a>
					<a href="customerServiceList">
						<i class="fa-solid fa-angle-right"></i>
						고객센터 관리하기
					</a>
				</div>
			</div>

			<div class="k_section_title">
				<div>고객센터 관리</div>
			</div>

		</div>
	</section>
                    <colgroup>
                        <col width="4%" />
                        <col width="41%" />
                        <col width="17%" />
                        <col width="10%" />
                        <col width="8%" />
                    </colgroup>
                    <thead>        
                        <tr style="font-family: 'Noto Sans KR', sans-serif;">
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>   
              				<th>수정/삭제</th>
                        </tr>  
                       
                    </thead>
                    <tbody id="tbody">
   
                    <c:forEach var="vo" items="${customerServiceList }">
                    	<tr>
                            <td>${vo.no}</td>
                            <td style="text-align:left;">                           
                            <c:if test="${vo.depth== 0 }">
                            	<a href="/customerService/customerServiceDetail?no=${vo.no }">문의사항: ${vo.subject }</a>
                            
                            </c:if>
                            <c:if test="${vo.depth > 0 }">
                            	<a href="/customerService/customerServiceDetail?no=${vo.no }"><span style="padding-left:${vo.depth *40}px;"> 답변:</span>${vo.subject }</a>
                            </c:if> 
                           </td>
                            <td>${vo.id}</td>
                            <td>${vo.writedate}</td>
                            <td>
                            <c:if test="${vo.depth > 0 }">
                            <input type="button" class="listEdit-btn" value="수정" onclick="location.href='/customerService/customerServiceEdit/${vo.no }'"> / 
                            </c:if>
                            <input type="button" class="listDel-btn" value="삭제" onclick="location.href='/customerServiceDel?no=${vo.no}'"></td>
                        </tr>
                     </c:forEach> 
                     
                    </tbody>    
                </table>
</div>
</body>
</html>