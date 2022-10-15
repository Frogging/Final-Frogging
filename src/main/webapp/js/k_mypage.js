
// 내가 쓴 글 변환
$(function(){
	$('.k_write_tab_c').click(function(){
		$('.k_my_write_c').css("display", "block");
		$('.k_my_write_q').css("display", "none");
		$('.k_my_write_s').css("display", "none");

		$(".k_write_tab_c").css("background-color", "#017935");
		$(".k_write_tab_c").css("border-color", "#017935")
		$(".k_write_tab_q").css("background-color", "#918F8F");
		$(".k_write_tab_q").css("border-color", "#918F8F")
		$(".k_write_tab_s").css("background-color", "#918F8F");
		$(".k_write_tab_s").css("border-color", "#918F8F")
	})

	$('.k_write_tab_q').click(function(){
		$('.k_my_write_c').css("display", "none");
		$('.k_my_write_q').css("display", "block");
		$('.k_my_write_s').css("display", "none");

		$(".k_write_tab_c").css("background-color", "#918F8F");
		$(".k_write_tab_c").css("border-color", "#918F8F")
		$(".k_write_tab_q").css("background-color", "#017935");
		$(".k_write_tab_q").css("border-color", "#017935")
		$(".k_write_tab_s").css("background-color", "#918F8F");
		$(".k_write_tab_s").css("border-color", "#918F8F")
	})

	$('.k_write_tab_s').click(function(){
		$('.k_my_write_c').css("display", "none");
		$('.k_my_write_q').css("display", "none");
		$('.k_my_write_s').css("display", "block");

		$(".k_write_tab_c").css("background-color", "#918F8F");
		$(".k_write_tab_c").css("border-color", "#918F8F")
		$(".k_write_tab_q").css("background-color", "#918F8F");
		$(".k_write_tab_q").css("border-color", "#918F8F")
		$(".k_write_tab_s").css("background-color", "#017935");
		$(".k_write_tab_s").css("border-color", "#017935")
	})
})