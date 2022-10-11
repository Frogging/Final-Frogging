
// 전역 변수 
var party_no;

$(function(){
	// alert("ee");
	//--------------- date picker에서 오늘 이후 선택 처리 ----------
			//날짜입력창 최소 선택: 현재날짜 
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month + '-' + day;
		$('#searchDate').attr('min', dateString);
		
			//날짜 최대 입력값 제한 : 2개월 이후 
		today.setMonth(today.getMonth() + 2);
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month + '-' + day;
		$('#searchDate').attr('max', dateString);
	
	})

//-------------------파티 세부 모달 내용 가져오기-------------------
function modal_data(no) {
	alert(no);
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
				$('#k_addr>span').html(party_info.addr);
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

function searchClub() {
	$(function(){
	//------------------------- 파티 검색 (날짜/주소) -----------------------------
		$("#clubSearchForm").submit(function(){
			// if($("#addr_section_1").val() == ''){
			// 	alert("주소 대분류 선택하세요.");
			// 	return false;
			// }

			if($("#addr_section_2").val()==""){
				alert("주소 소분류 선택하세요.");
				return false;
			}
			if($("#searchDate").val() == ""){
				alert("검색 날짜를 선택하세요.");
				return false;
			}
			return true;
		})
	});
}
//----------------- 신청 버튼 클릭 --------------------
function ask_join_in() {
	if(confirm("클럽에 참여하시겠습니까?")){
		//console.log(party_no);
		location.href = "/club/ask_join_in?party_no="+party_no;
	}
}
//----------------- 주소 처리 --------------------
function changeAddr() {
	//대분류 바꿨을 때
	$(function(){
		//소분류 처리
		$.ajax({
			url: "/data/getAddr_2",
			data: {addr_1:$("#addr_section_1 option:selected").val()},
			success: function(result){				
				var tag = "";

				tag += "<option value=''>세부 선택</option>";
				for (let index = 0; index < result.idx; index++) {
					tag += "<option value='"+result[index].addr_section_2+"'>"+result[index].addr_section_2+"</option>";
					console.log(result[index].addr_section_2);
				}

				$("#addr_section_2").empty("");
				$("#addr_section_2").html(tag);
			}, error:function(e){
				console.log(e.responseText);
			}
		})
	});
}
function changeAddr_2() {
	//소분류 바꿨을 때
	$(function(){
		console.log($("#addr_section_2").val());
	});
}
