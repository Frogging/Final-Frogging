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
		.nickchk1{
			display:none;
		}
		.nickchk2{
			display:none;
		}
		</style>
	</head>
<script>
$(document).ready(function(){      
	var pattern_blank = /[\s]/g;//공백
	var pattern_num = /[0-9]/;	// 숫자     	
	var pattern_eng = /[a-zA-Z]/;	// 문자     	
	var pattern_spc = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g; // 특수문자    	
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ]/; // 한글체크
	//유효성 검사
	$("#sign").submit(function(){
		
		//문자열에 공백이 있는 경우
		
		if(pattern_blank.test($("#nickname").val()) == true){
		    alert('닉네임에 공백을 사용할수없습니다.');
		    return false;
		}
		//ㅎㄱㅁㅎㅁㄱㅎㅁ 자음모음이있는경우
		if(pattern_kor.test($("#nickname").val()) == true){
		    alert('닉네임에 특수문자를 사용할수없습니다');
		    return false;
		}
		
		//특수문자가 있는 경우
		if(pattern_spc.test($("#nickname").val()) == true){
		    alert('닉네임에 특수문자를 사용할수없습니다');
		    return false;
		}
		if($("#nickname").val()==""){
			alert("닉네임 입력하세요..");
			return false;
		}
		if($("#nickname").val().length<2 || $("#nickname").val().length>8){
			alert("닉네임을 2~8글자 사이로 입력해주세요");
			return false;
		}
		if($("#height").val()==""){
			alert("키를 입력하세요.");
			return false;
		}
		return true;
	});
	
	$('#nickname').on("propertychange change keyup paste input", function() {

		var nickname = $('#nickname').val();
		var data = {nickname : nickname}
		$.ajax({
			type : "post",
			url : "/login/nicknameCheck",
			data : data,
			success : function(result){
				if((result !='fail') && !(pattern_blank.test(nickname)) && !(pattern_spc.test(nickname)) && !(pattern_kor.test(nickname)) && nickname.length > 1 && nickname.length<9){
					$('.nickchk2').css("display",'none');
					$('.nickchk1').css("display","inline-block");
			
				}else if(nickname.length==0){
					$('.nickchk1').css("display",'none');
					$('.nickchk2').css("display",'none');
				}
				else{
					$('.nickchk1').css("display",'none');
					$('.nickchk2').css("display","inline-block");
					
				}
			}
		});
	});
});
</script>

<body>
<div id="#">
	<h1>회원가입</h1>
	<div id="#">
		<h2>작성자정보<span>
	</div>
	<form method="post" action="/signUpOk" id="sign">
		<div id="#">
			<ul>
				<li>아이디</li>
					<li><input type="text" name="id" id="id" value="${vo.id }" readonly/></li>
				<li>아이디</li>
					<li><input type="text" name="name" id="name" value="${vo.name }" readonly/></li>
				<li>닉네임</li>
					<li><input type="text" name="nickname" id="nickname" />
					<li><span class="nickchk1">사용 가능한 닉네임입니다.</span></li>
					<li><span class="nickchk2">사용 불가능한 닉네임입니다.</span></li>
					
				<li id="sex">성별</li>
				<li >
					<select name="sex">
						<option id="sex" value=1>남</option>
						<option id="sex" value=2>여</option>
					</select>
				</li>
				<li>키</li>
				<li><input type="number" name="height" id="height"/>cm</li>
				<li><input type="submit" value="가입하기"/></li>
			</ul>
			
		</div>
	</form>
</div>
</body>
</html>