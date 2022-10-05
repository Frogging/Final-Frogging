<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/p_style.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
       integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<style>
/* button */
.btn {font-family:'malgunbd';display:inline-block;padding:3px 20px 6px 20px;margin:0;border:1px solid #aaa;cursor:pointer;color:#333;border-radius:2px;vertical-align:middle;font-size:13px;letter-spacing:-1px;line-height:normal;background-color:#feffff;text-decoration:none;}
.btn.black {border-color:#191919;color:#fff;background-color:#333;text-decoration:none;}
</style>
<script type="text/javascript">
 
    
   	function setRe(vo.subject, spanID){
   		var str = '';	 
    	if(depth == 1) str ="답글 : ";
    	else if(depth == 2) str ="답글 : ";
   
            document.getElementById(spanID).innerHTML = str;
   		 
    }
 
    /**  상세 페이지 이동 */
    function goQnaDetail(no){                
        location.href = "/qna/qnaDetail?no="+ no;
    }
    
    /**  작성 페이지 이동 */
    function goQnaWrite(){        
        location.href = "/qna/qnaWrite";
    }
 <!--
    /**  목록 조회  */
    function getQnaList(currentPageNo){
 
    	if(currentPageNo === undefined){
			currentPageNo = "1";
		}
    	
    	$("#current_page_no").val(currentPageNo);
    	
        $.ajax({    
        
            url      : "/qna/qnaList",
            data     : $("#qnaForm").serialize(),
            dataType : "JSON",
            cache    : false,
            async    : true,
            type     : "POST",    
            success  : function(obj) {
                getQnaListCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
         });
    }
    
    /** 목록 조회  콜백 함수 */
    function getQnaListCallback(obj){
     
        var state = obj.state;
        
        if(state == "SUCCESS"){
            
            var data = obj.data;            
            var list = data.list;
            var listLen = list.length;        
            var totalCount = data.totalCount;
            var pagination = data.pagination;
                
            var str = "";
            
            if(listLen >  0){
                
                for(var a=0; a<listLen; a++){
                    
                	var no        = obj.no; 
                    var reply_group      = obj.reply_group; 
                    var depth      = obj.depth; 
                    var reply_seq      = obj.reply_seq; 
                    var id     = obj.id; 
                    var subject	= obj.subject; 
                    var content    = obj.content; 
                    var hit       = obj.hit;
                    var writedate         = obj.writedate; 
                    
                    str += "<tr>";
                    str += "<td>"+ no +"</td>";
                                        
                    str += "<td onclick='javascript:goQnaDetail("+ no +");' style='cursor:Pointer'>";
                    
                    if(depth > 0){
                        
                        for(var b=0; b<depth; b++){
                            
                            str += "Re:";
                        }
                    }
                    
                    str += subject +"</td>";
                                        
                    str += "<td>"+ hit +"</td>";
                    str += "<td>"+ id +"</td>";    
                    str += "<td>"+ writedate +"</td>";    
                    str += "</tr>";
                    
                } 
                
            } else {
                
                str += "<tr>";
                str += "<td colspan='5'>등록된 글이 존재하지 않습니다.</td>";
                str += "<tr>";
            }
            
            $("#tbody").html(str);
            $("#total_count").text(totalCount);
            $("#pagination").html(pagination);
            
        } else {
            alert("관리자에게 문의하세요.");
            return;
        }        
    }
-->    
</script>
</head>
<body>
    <div class="p_container">
        <div class="inner">        
            <br/><h1 class="p_title">QnA 게시판</h1><br/>            
            <form id="qnaForm" name="qnaForm">
            	<input type="hidden" id="function_name" name="function_name" value="getQnaList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				<!--  
				<div class="page_info">
					<span class="total_count"><strong>전체</strong> : <span id="total_count" class="t_red">0</span>개</span>
				</div>
				-->
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="4%" />
                        <col width="37%" />
                        <col width="4%" />
                        <col width="20%" />
                        <col width="15%" />
                    </colgroup>
                    <thead>        
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>조회수</th>
                            <th>작성자</th>
                            <th>작성일</th>
              
                        </tr>  
                       
                    </thead>
                    <tbody id="tbody">
                    <c:forEach var="vo" items="${list }">
                    	<tr>
                            <td>${vo.no}</td>
                            <td style="text-align:left;">
                            
                            <c:if test="${vo.depth== 0 }">
                            	<a href="/qna/qnaDetail?no=${vo.no }">${vo.subject }</a>
                            
                            </c:if>
                            <c:if test="${vo.depth > 0 }">
                            	<a href="/qna/qnaDetail?no=${vo.no }"><span style="padding-left:${vo.depth *40}px;"> 답글:</span>${vo.subject }</a>
                            </c:if>
                            
                           </td>
                            <td>${vo.hit}</td>
                            <td>${vo.id}</td>
                            <td>${vo.writedate}</td>
                        </tr>
                        	</c:forEach> 
                    </tbody>    
                </table>
                
            </form>            
            <div class="btn_right mt15" style="width:80%; margin:0 auto; float:center;">
                <button type="button" class="btn black mr5" onclick="location.href='/qna/qnaWrite'">작성하기</button>
            </div>
        </div>
        
        <div id="pagination"></div>
        
    </div>
</body>    
</html>