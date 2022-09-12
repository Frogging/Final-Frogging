package com.frogging.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/alone/*")
public class AloneController {

	ModelAndView mav = null;

	@GetMapping(value = "alone_rec_path")
	public ModelAndView alone_rec_path() {

		mav = new ModelAndView();
		mav.setViewName("plog_alone/alone_rec_path");
		return mav;
	}

	@GetMapping(value = "alone_new_path")
	public ModelAndView alone_new_path() {

		mav = new ModelAndView();
		mav.setViewName("plog_alone/alone_new_path");
		return mav;
	}

}
