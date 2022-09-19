//------------------------- 코스 검색 (날짜) -----------------------------
function searchWithDate() {
	$(function(){
		if($("#searchDate").val() == ''){
			alert("날짜를 입력하세요.");
			return false;
		}
		else{
			$("#clubDateForm").submit();
		}
	})
}

// 전역 변수 
var course_no;
var select_course_no;

//-------------------경로 세부 모달 내용 가져오기-------------------
function modal_data(no) {
	$(function(){
		
		course_no = no;
		alert(no);
		//모달 비우기 

		//비동기식 파티 데이터 가져오기 
		// var url = "/club/getPathDetail";
		// var params = {no:no};

		// $.ajax({
		// 	url: url,
		// 	data: params,
		// 	success: function(result){


			
		// 	}, error:function(e){
		// 		console.log(e.responseText);
		// 	}
		// });

	})
}
//----------------- 코스 선택 버튼 클릭 --------------------
function select_path() {
	if(confirm("이 경로를 선택하시겠습니까?")){
		//console.log("선택한 경로 번호: " + course_no);
		select_course_no = course_no;
		alert(course_no + "번 코스 선택완료");

		//선택한 파티 -> 폼
		$(function(){
			console.log('------');
			$("#k_party_set_course").val(select_course_no);
		});
	}
}
//----------------- 클럽  유효성 검사 --------------------
$(function(){
	$('.k_party_frm_submit').click(function(){
		if(!$('#k_party_set_agree').is(':checked')){
			alert("모임 가이드에 동의해주세요");
			return false;
		}
		if($('#k_party_set_party_name').val() == ""){
			alert("모임명을 입력해주세요");
			return false;
		}
		if($('#k_party_set_course').val() == ""){
			alert("코스를 선택해주세요");
			return false;
		}
		if($('#k_party_set_party_number').val() == ""){
			alert("모집인원을 선택해주세요");
			return false;
		}
		if($('#k_party_set_party_number').val()<3 || $('#k_party_set_party_number').val()>12){
			alert("선택가능한 모집인원은 3 ~ 12명 사이입니다.");
			return false;
		}
		if($('#k_party_set_meeting_time').val() == ""){
			alert("모임 일시를 선택해주세요");
			return false;
		}
		if($('#k_party_set_meeting_place').val() == ""){
			alert("만남 장소를 입력해주세요");
			return false;
		}

		$("#k_party_set_frm").submit();
	});
});
