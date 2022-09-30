// 전역 변수 
var partyname_checked=false;
var new_name=false;
// ------------------ 클럽 삭제하기/신청 취소하기 -------------------
function deleteClub(no) {
	if(confirm("이 모임을 삭제하시겠습니까?")){
		location.href = "/club/deleteClub?no="+no;
	}
}
function leaveClub(no) {
	if(confirm("이 모임 참여를 취소하시겠습니까?")){
		location.href = "/club/leaveClub?no="+no;
	}
}
//---------------- 파티이름 중복검사 ---------------
function checkPartyname() {
	$(function(){
		$.ajax({
			type : "post",
			url: "/club/checkPartyname",
			data: {partyname: $('#k_party_set_party_name').val()},
			success: function(result){
				if (result=="yes"){
					alert("모임명 사용가능");
					partyname_checked = true;
				}else{
					alert("모임명 사용 불가능");
					partyname_checked = false;
					$('#k_party_set_party_name').val('');
				}
			}, error:function(e){
				console.log(e.responseText);
			}
		});
		
	})
}

//----------------- 클럽  유효성 검사 --------------------
$(function(){
	//partyname onchange event -> new_name = true;
	//meeting_time : MM-dd  hh:mm :상태 

	$('.k_party_frm_submit').click(function(){
		if($('#k_party_set_party_name').val() == ""){
			alert("모임명을 입력해주세요");
			return false;
		}
		// if(!partyname_checked && new_name){
		// 	alert("모임명 중복검사를 해주세요");
		// 	return false;
		// }

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
		alert("submit");
		$("#k_editPartyFrm").submit();
	});
});

// --------------------------- member manage modal ----------------------
function modal_data(no) {
	$(function(){
		var url = "/club/getMemberDetail";
		var params = {no:no};

		$.ajax({
			url: url,
			data: params,
			success: function(result){
				console.log(result);

				$('.modal_title').html('[ '+result[0].partyname+' ] 참여 멤버');
				var tag='<li class="k_my_list_head"><span>파티번호</span></li><li class="k_my_list_head"><span>아이디</span></li><li class="k_my_list_head"><span>닉네임</span></li>';
				tag += '<li class="k_my_list_head"><span>상태</span></li><li class="k_my_list_head"><span>확인</span></li>';
				for (let index = 0; index < result.idx; index++) {
					tag += "<li><span>"+result[index].party_no+"</span></li>";
					tag += "<li><span>"+result[index].user_id+"</span></li>";
					tag += "<li><span>"+result[index].nickname+"</span></li>";

					if (result[index].join_status == 4){//관리자
						tag += "<li><span>관리자</span></li>";
						tag += "<li><span>-</span></li>";
					} else if (result[index].join_status == 3 ){//퇴장
						tag += "<li><span>퇴장</span></li>";
						tag += "<li><span>-</span></li>";
					} else if (result[index].join_status == 2 ){//신청 - 거절
						tag += "<li><span>퇴장</span></li>";
						tag += "<li><span>-</span></li>";
					} else if (result[index].join_status == 2 ){//신청 - 수락
						tag += "<li><span>수락 완료</span></li>";
						tag += "<li class='k_btn'><span><button class='k_manage_3'>퇴장</button></span></li>";
					} else{
						tag += "<li><span>수락 대기</span></li>";
						tag += "<li class='k_btn'><span><button class='k_manage_1'>수락</button><button class='k_manage_2'>거절</button></span></li>";
					}
				}

				$('.k_party_manage_infos').html(tag);
			}, error:function(e){
				console.log(e.responseText);
			}
		});


		$('.k_manage_1').on({
			mouseenter: function() {
				console.log("in");
				$(this).css('color', 'red');
			}, mouseleave: function() {
				$(this).css('color', 'green');
			}
		});


	})		
}

// ---------------- member manage button ------------------
// $(function(){
// 	alert("jqeury");
	
// });