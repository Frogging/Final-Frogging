package com.frogging.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.ActivityService;
import com.frogging.app.service.PartyService;
import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PlogPagingVO;

@RestController
@RequestMapping("/admin/*")
public class ManageController {

	ModelAndView mav;

	@Inject
	ActivityService a_serivce;

	@Inject
	PartyService p_service;

	// 통계 페이지
	@GetMapping("/statistic")
	public ModelAndView statisticView() {

		mav = new ModelAndView();

		mav.setViewName("/admin/statistic");
		return mav;
	}

	// 관리자 - 플로깅 통계
	@GetMapping(value = "getPlogData")
	public List<ActivityVO> getPlogData() {
		List<ActivityVO> graph = a_serivce.getPlogGraph();
		return graph;
	}

	// 관리자 - 유저 통계
	@GetMapping(value = "getUserData")
	public ArrayList<Integer> getUserData() {
		ArrayList<Integer> user_data = new ArrayList<Integer>();
		user_data.add(a_serivce.numberOfBad());
		user_data.add(a_serivce.numberOfGood());

		user_data.add(a_serivce.numberOfUnactive());
		user_data.add(a_serivce.numberOfActive());

		return user_data;
	}

	// 관리자 - 쓰레기 통계
	@GetMapping(value = "getTrashData")
	public List<ActivityVO> getTrashData() {
		List<ActivityVO> graph = a_serivce.getTrashGraph();
		return graph;
	}

	// ----------------------------------------------------
	// 코스 관리 페이지
	@GetMapping("/manageCourse")
	public ModelAndView manageCourse() {

		mav = new ModelAndView();

		PlogPagingVO p_pageVO = new PlogPagingVO();
		mav.addObject("c_list", p_service.getPathList(p_pageVO));
		mav.setViewName("/admin/manageCourse");
		// System.out.println(p_service.getPathList(p_pageVO));
		return mav;
	}

	// 파티 관리 페이지
	@GetMapping("/manageClub")
	public ModelAndView manageParty() {

		mav = new ModelAndView();

		PartyDetailVO p_dVO = new PartyDetailVO();
		p_dVO.setJoin_status(4);
		mav.addObject("c_list", p_service.getTotalClub(p_dVO));
		mav.setViewName("/admin/manageClub");
		return mav;
	}
}
