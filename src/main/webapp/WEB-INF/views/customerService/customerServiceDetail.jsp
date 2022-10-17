<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/p_style.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
       integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<style>
/* button */
.btn {    height: 35px;
    width: 90px;
    background-color: #2fb86a;
    border : 1px solid white;
    border-radius:5px;
    color: white;
    font-weight: bold;
    font-size: 18px;
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0 2px;}
.btn.black {border-color:#191919;color:#fff;background-color:#333;text-decoration:none;}
</style>





<script type="text/javascript">
	
	function customerServiceDel(){
	if(confirm("글을 삭제하시겠습니까?")){
		location.href="/customerService/customerServiceDel?no=${vo.no}";
	}
}
     
    $(document).ready(function(){        
        getcustomerServiceDetail();        
    });
   
    
    /* 수정 페이지 이동 */
    function gocustomerServiceUpdate(){
        
        var no = $("#customerService_seq").val();
        
        location.href = "/customerService/customerServiceUpdate?no="+ no;
    }
    
    /* 답글 페이지 이동 */
	function gocustomerServiceReply(){
		
		var no = $("#customerService_seq").val();
		
		location.href = "/customerService/customerServiceReply?no="+ no;
	}
        
    
</script>
</head>
<body>

    <div class="p_container">
        <div class="inner">    
           <br/><h1 class="p_title">고객센터 내용</h1><br/>
            <form id="customerServiceForm" name="customerServiceForm">        
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                    	<tr>
            				<th>제목</th>
            				<td>${vo.subject}</td>
            				<th>조회수</th>
           					<td>${vo.hit}</td>
            			</tr>       
            			<tr>
           					<th>작성자</th>
            				<td>${vo.id}</td>
            				<th>작성일시</th>
           					<td>${vo.writedate}</td>
           				</tr>       
           				<tr>
           					<th style="height:300px;">내용</th>
           					<td colspan='3'style="height:300px;">${vo.content}</td>
            			</tr>	   
                    </tbody>
                </table>        
                <input type="hidden" id="customerService_seq"      name="customerService_seq"    	value="${vo.no}"/> <!-- 게시글 번호 -->
                 <input type="hidden" id="customerService_reply_group"      name="customerService_seq"    	value="${vo.reply_group}"/>
                <input type="hidden" id="search_type"    name="search_type"		value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
            </form>
            <div class="btn_right mt15" style="width:80%; margin:0 auto; float:center; padding:5px;">
                <c:if test="${logStatus=='Admin'}">
                	<button type="button" class="btn black mr5" onclick="location.href='/admin/customerServiceList'" style="width:150px;">관리자페이지로</button>
                </c:if>
                <button type="button" class="btn black mr5" onclick="location.href='/customerService/customerServiceList'">목록으로</button>
                <c:if test="${vo.id==logId}">
                <button type="button" class="btn black mr5" onclick="location.href='/customerService/customerServiceEdit/${vo.no }'">수정하기</button>
                <input type="button" class="btn black" value="삭제하기" onclick="location.href='javascript:customerServiceDel();'"/>
                </c:if>
                <c:if test="${logStatus=='Admin'}">
                <button type="button" class="btn black mr5" onclick="location.href='/customerService/customerServiceReply?no=${vo.no }'">답글쓰기</button>
				</c:if>                              
            </div>
        </div>
    </div>

</body>
</html>