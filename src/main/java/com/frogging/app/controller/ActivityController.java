package com.frogging.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/activity/*")
public class ActivityController {

	ModelAndView mav = null;

	// 나의 엑티비티 페이지
	@GetMapping(value = "my")
	public ModelAndView getMyAct() {

		mav = new ModelAndView();
		mav.setViewName("/my/activity");
		return mav;
	}

}
