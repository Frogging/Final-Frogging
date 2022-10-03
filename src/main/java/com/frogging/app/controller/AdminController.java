package com.frogging.app.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	ModelAndView mav = new ModelAndView();
	
	@GetMapping("adminPage")
	public ModelAndView adiminPage(){
		mav.setViewName("admin/adminPage");
		return mav;
	}
	
	@GetMapping("userlist")
	public ModelAndView userlist() {
		mav.setViewName("admin/userlist");
		return mav;
	}
}
