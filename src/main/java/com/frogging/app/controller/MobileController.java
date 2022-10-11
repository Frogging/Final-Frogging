package com.frogging.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mobile/*")
public class MobileController {
	@GetMapping("mobileHome")
	public ModelAndView mobileHome(String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mobile/mobileHome");
		return mav;
	}
	
	@GetMapping("mobileStart")
	public ModelAndView mobileStart(String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mobile/mobileStart");
		return mav;
	}
}
