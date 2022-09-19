//------------------------- 파티 검색 (날짜) -----------------------------
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
var party_no;

//-------------------파티 세부 모달 내용 가져오기-------------------
function modal_data(no) {
	//alert(no);
	$(function(){
		
		//모달 비우기 
		//$('.modal_body').empty();

		//비동기식 파티 데이터 가져오기 
		var url = "/club/getClubDetail";
		var params = {no:no};

		$.ajax({
			url: url,
			data: params,
			success: function(result){
				//console.log(result.party);
				//console.log(result.activity);
				var party_info = result.party;
				var activity_info = result.activity;

				//액티비티 세부 데이터 넣기
				$('#k_nickname>span').html(activity_info.nickname);
				$('#k_total_km>span').html(activity_info.total_distance);
				$('#k_plog_count>span').html(activity_info.plog_count);

				//파티 세부 데이터 넣기 
				$('#k_course_name').html(party_info.course_name);
				$('#k_current_number').html('');

				for (let idx = 0; idx < party_info.number; idx++) {
					if (idx<party_info.current_number) {
						$('#k_current_number').append('<li><i class="fa-solid fa-circle active"></i></li>');
					} else {
						$('#k_current_number').append('<li><i class="fa-solid fa-circle"></i></li>');
					}
				}

				$('#k_partyname>span').html(party_info.partyname);
				$('#k_d_and_t>span').html(party_info.distance + "/ "+ party_info.time);
				$('#k_number>span').html(party_info.number);
				$('#k_meeting_time>span').html(party_info.meeting_time);
				$('#k_meeting_place>span').html(party_info.meeting_place);
				$('#k_content>span').html(party_info.content);

				//파티번호 매개변수 설정
				//console.log(party_info.no);
				party_no = party_info.no;

			}, error:function(e){
				console.log(e.responseText);
			}
		});
	})
}
//----------------- 신청 버튼 클릭 --------------------
function ask_join_in() {
	if(confirm("클럽에 참여하시겠습니까?")){
		//console.log(party_no);
		location.href = "/club/ask_join_in?party_no="+party_no;
	}
}
//----------------- 주소 처리 --------------------
// $(function(){
// 	//대분류 처리
// 	$.ajax({
// 		url: "/data/getAddr_1",
// 		data: {},
// 		success: function(result){

// 		}, error:function(e){
// 			console.log(e.responseText);
// 		}
// 	})
// });