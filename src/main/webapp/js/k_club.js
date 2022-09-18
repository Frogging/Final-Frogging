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

//---------------------- 버튼 클릭 --------------------
function ask_join_in(party_no) {
	if(confirm("클럽에 참여하시겠습니까?")){
		console.log("check1");
		location.href = "/club/ask_join_in?party_no="+party_no ;
	}
}