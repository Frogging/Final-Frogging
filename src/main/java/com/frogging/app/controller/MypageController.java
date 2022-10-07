package com.frogging.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.ActivityService;
import com.frogging.app.service.UserService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/mypage/*")
public class MypageController {

	ModelAndView mav = null;

	@Inject
	ActivityService a_serivce;

	@Inject
	UserService u_service;

	// 마이페이지
	@GetMapping(value = "/my")
	public ModelAndView getMy(HttpSession session) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("logId");

		// 랭킹 정보, 내가 쓴 글, 달성 기록 정보
		mav.addObject("plog_count", a_serivce.getRank_p(id));
		mav.addObject("distance", a_serivce.getRank_k(id));
		mav.addObject("c_list", u_service.getMyWrite(id));
		mav.setViewName("/mypage/my");
		return mav;
	}

	// 상세정보 페이지
	@GetMapping(value = "/myDetail")
	public ModelAndView getMyDetail(HttpSession session) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("logId");

		mav.addObject("u_vo", u_service.getUserDetail(id));
		mav.setViewName("/mypage/myDetail");
		return mav;
	}

	// 상세정보 페이지 수정
	@GetMapping(value = "/myDetailEdit")
	public ModelAndView getMyDetailEdit(HttpSession session) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("logId");

		mav.addObject("u_vo", u_service.getUserDetail(id));
		mav.setViewName("/mypage/myDetailEdit");
		return mav;
	}

	// 나의 엑티비티 페이지
	@GetMapping(value = "activity")
	public ModelAndView getMyAct() {

		mav = new ModelAndView();
		mav.setViewName("/mypage/activity");
		return mav;
	}

}
