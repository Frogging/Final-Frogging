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