// 통계 탭 반환
$(function(){
	// ------------------ 플로깅 탭 -------------------
	$('.k_static_tab_p').click(function(){
		$('.k_static_plog_box').css("display", "block");
		$('.k_static_user_box').css("display", "none");
		$('.k_static_trash_box').css("display", "none");

		$(".k_static_tab_p").css("background-color", "#017935");
		$(".k_static_tab_p").css("border-color", "#017935")
		$(".k_static_tab_u").css("background-color", "#918F8F");
		$(".k_static_tab_u").css("border-color", "#918F8F");
		$(".k_static_tab_t").css("background-color", "#918F8F");
		$(".k_static_tab_t").css("border-color", "#918F8F")
	})

	// ------------------ 유저 탭 -------------------
	$('.k_static_tab_u').click(function(){
		$('.k_static_plog_box').css("display", "none");
		$('.k_static_user_box').css("display", "block");
		$('.k_static_trash_box').css("display", "none");

		$(".k_static_tab_u").css("background-color", "#017935");
		$(".k_static_tab_u").css("border-color", "#017935")
		$(".k_static_tab_p").css("background-color", "#918F8F");
		$(".k_static_tab_p").css("border-color", "#918F8F");
		$(".k_static_tab_t").css("background-color", "#918F8F");
		$(".k_static_tab_t").css("border-color", "#918F8F")
	})
	// ------------------ 쓰레기 탭 -------------------
	$('.k_static_tab_t').click(function(){
		$('.k_static_plog_box').css("display", "none");
		$('.k_static_user_box').css("display", "none");
		$('.k_static_trash_box').css("display", "block");

		$(".k_static_tab_t").css("background-color", "#017935");
		$(".k_static_tab_t").css("border-color", "#017935")
		$(".k_static_tab_u").css("background-color", "#918F8F");
		$(".k_static_tab_u").css("border-color", "#918F8F");
		$(".k_static_tab_p").css("background-color", "#918F8F");
		$(".k_static_tab_p").css("border-color", "#918F8F")
	})
})


// -------------------- 여러개 삭제 
$(function(){
	$(".allChk").click(function(){
		console.log("allcheck");
		$(".k_my_club_grid input[type=checkbox]").prop("checked",$(".allChk").prop("checked"));
	});
	
	$(".delBtn").click(function(){
		//체크 갯수 확인
		var countChk = 0;//				반복문					input input input
		$(".k_my_club_grid input[name=noList]").each(function(idx,obj){
			if(obj.checked){ // input 태그가 체크 상태이면 true
				countChk++;
				//console.log("checked++");
			}
		});
		if(countChk<=0){
			alert("삭제할 레코드를 선택 후 삭제하세요.");
			return false;
		}
		$("#listFrm").submit();
	});

})

$(function(){
	$(".allChk").click(function(){
		console.log("allcheck");
		$(".k_my_course_grid input[type=checkbox]").prop("checked",$(".allChk").prop("checked"));
	});
	
	$(".delBtn").click(function(){
		//체크 갯수 확인
		var countChk = 0;//				반복문					input input input
		$(".k_my_course_grid input[name=noList]").each(function(idx,obj){
			if(obj.checked){ // input 태그가 체크 상태이면 true
				countChk++;
				//console.log("checked++");
			}
		});
		if(countChk<=0){
			alert("삭제할 레코드를 선택 후 삭제하세요.");
			return false;
		}
		$("#listFrm").submit();
	});

})

