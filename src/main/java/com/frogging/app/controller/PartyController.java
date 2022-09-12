package com.frogging.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/club/*")
public class PartyController {

	ModelAndView mav = null;

	// 함께 시작하기
	@GetMapping(value = "/join_club")
	public ModelAndView start_party() {

		mav = new ModelAndView();
		mav.setViewName("plog_together/join_club");
		return mav;
	}

	// 새 클럽 - 추천 경로
	@GetMapping(value = "/make_club_rec_path")
	public ModelAndView make_club_rec_path() {

		mav = new ModelAndView();
		mav.setViewName("plog_together/make_club_rec_path");
		return mav;
	}

	// 새 클럽 - 새 경로
	@GetMapping(value = "/make_club_new_path")
	public ModelAndView make_club_new_path() {

		mav = new ModelAndView();
		mav.setViewName("plog_together/make_club_new_path");
		return mav;
	}
}
