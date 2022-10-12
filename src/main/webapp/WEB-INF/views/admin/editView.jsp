
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="/js_css/style.css" type="text/css"/>
		<style>

		</style>
		<script>
		
		</script>
	</head>
<body>
<h1>회원정보수정</h1>
<form method="post" action="/editProfile">
<table width="50%" class="table01">
                    <colgroup>
                        <col width="40%" />
                        <col width="60%" />
                    </colgroup>
                        <tr>
                            <th>아이디(이메일)</th>
                            <th><input type="text" name="id" value="${vo.id}" readonly }></th>
                        </tr>  
                         <tr>
                            <th>이름</th>
                            <th>${vo.name }</th>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <th>${vo.nickname }</th>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <c:if test="${vo.sex==1 }"><th>남</th></c:if>
                            <c:if test="${vo.sex==2 }"><th>여</th></c:if>
                        </tr>
                        <tr>
                            <th>키</th>
                            <th>${vo.height }</th>
                        </tr>
                        <tr>
                            <th>상태</th>
                          	<c:if test="${vo.restriction==0 }">
                          		<th>
                          			<select name="restriction">
                          				<option selected value=0>정상</option>
                          				<option value=1>불량</option>
                          			</select>
                          		</th>
                          	</c:if>
                            <c:if test="${vo.restriction==1 }">
                          		<th>
                          			<select name="restriction">
                          				<option selected value=1>불량</option>
                          				<option value=0>정상</option>
                          			</select>
                          		</th>
                          	</c:if>
                        </tr>
                </table>
                
                <input type="submit" value="수정하기"><input type="button" value="뒤로가기" onclick="history.back()">
                </form>
</body>
</html>