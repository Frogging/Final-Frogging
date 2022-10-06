package com.frogging.app.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.AdminService;


@Controller
public class AdminController {
	@Autowired
	AdminService service;
	ModelAndView mav = new ModelAndView();
	
	@GetMapping("adminPage")
	public ModelAndView adiminPage(){
		mav.setViewName("admin/adminPage");
		return mav;
	}
	
	@GetMapping("userlist")
	public ModelAndView userlist() {
		mav.addObject("userList", service.userList());
		mav.setViewName("admin/userlist");
		return mav;
	}
}
