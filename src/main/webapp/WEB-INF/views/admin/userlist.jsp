<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="/css/login.css" type="text/css"/>
		<script src="https://accounts.google.com/gsi/client" async defer></script>
	</head>

<style>
#userlist {
	width: 1600px;
	overflow: auto;
	margin: 0 auto 50px;
}

#list {
	overflow: auto;
}

#list li {
	float: left;
	line-height: 40px;
	border-bottom: 1px solid gray;
	width: 10%;
}

#list li:nth-child(6n+1) {
	width: 20%;
}
#list li:nth-child(n+1) {
	width: 15%;
}

.b{font-weight: bold;}
</style>
<body>
<form method="post" action="/editlist" id="sign">
<div id="userlist">
	<ul id="list">
		<li class="b">아이디(이메일)</li>
		<li class="b">이름</li>
		<li class="b">닉네임</li>
		<li class="b">키</li>
		<li class="b">성별</li>
		<li class="b">상태</li>
		<c:forEach var="vo" items="${userList }">
			<li><input type="text" name="id" id="id" value="${vo.id }" style="border:none" readonly/></li>
			<li>${vo.name }</li>
			<li>${vo.nickname }</li>
			<li>${vo.height }</li>
			<c:if test="${vo.sex==1 }"><li>남</li></c:if>
			<c:if test="${vo.sex==2 }"><li>여</li></c:if>
			<c:if test="${vo.restriction==0 }">
				<li>
					<select name ="restriction">
						<option id ="restriction" value=0 selected>정상</option>
						<option id ="restriction" value=1>불량</option>
					</select>
				</li>
			</c:if>
			<c:if test="${vo.restriction==1 }">
				<li>	
					<select name ="restriction">
						<option id ="restriction" value=0 >정상</option>
						<option id ="restriction" value=1 selected>불량</option>
					</select>
				</li>
			</c:if>
		</c:forEach>
	</ul>
	<input type="submit" value="수정" >
</div>	
</form>
</body>
</html>