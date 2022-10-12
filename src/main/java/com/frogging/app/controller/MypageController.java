package com.frogging.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.ActivityService;
import com.frogging.app.service.UserService;
import com.frogging.app.vo.ActivityVO;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
		// System.out.println(id);
		// 랭킹 정보
		mav.addObject("plog_count", a_serivce.getRank_p(id).getRownum());
		mav.addObject("distance", a_serivce.getRank_k(id).getRownum());
		// System.out.println(a_serivce.getRank_p(id).getRownum() + "/" +
		// a_serivce.getRank_k(id).getRownum());

		// 내가 쓴 글 (커뮤니티 + 큐앤애이)
		mav.addObject("c_list", u_service.getMyWrite(id));
		mav.addObject("q_list", u_service.getMyWrite_qna(id));

		// 달성기록: 쓰레기 총량, 총 Km
		mav.addObject("a_vo", u_service.getRecord(id));
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
	public ModelAndView getMyAct(HttpSession session) {

		mav = new ModelAndView();

		// 나의 통계 데이터
		String id = (String) session.getAttribute("logId");

		mav.addObject("a_vo_w", a_serivce.getUserStatistic_w(id, "yeek"));
		mav.addObject("a_vo_m", a_serivce.getUserStatistic_m(id, "month"));
		mav.addObject("a_vo_y", a_serivce.getUserStatistic_y(id, "year"));
		mav.addObject("a_vo_t", a_serivce.getUserStatistic(id, "total"));

		mav.addObject("a_list", a_serivce.getActivityList(id));
		mav.setViewName("/mypage/activity");
		return mav;
	}

	// 나의 엑티비티 페이지 - 그래프 데이터1
	@GetMapping(value = "getUserRecord_w")
	public List<ActivityVO> AgetUserRecord_w(HttpSession session) {
		String id = (String) session.getAttribute("logId");
		List<ActivityVO> w_graph = a_serivce.getGraph_w(id);
		return w_graph;
	}

	// 나의 엑티비티 페이지 - 그래프 데이터2
	@GetMapping(value = "getUserRecord_m")
	public List<ActivityVO> AgetUserRecord_m(HttpSession session) {
		String id = (String) session.getAttribute("logId");
		List<ActivityVO> m_graph = a_serivce.getGraph_m(id);
		return m_graph;
	}

	// 나의 엑티비티 페이지 - 그래프 데이터3
	@GetMapping(value = "getUserRecord_y")
	public List<ActivityVO> AgetUserRecord_y(HttpSession session) {
		String id = (String) session.getAttribute("logId");
		List<ActivityVO> y_graph = a_serivce.getGraph_y(id);
		return y_graph;
	}

	// 나의 엑티비티 페이지 - 그래프 데이터4
	@GetMapping(value = "getUserRecord_t")
	public List<ActivityVO> AgetUserRecord_t(HttpSession session) {
		String id = (String) session.getAttribute("logId");
		List<ActivityVO> t_graph = a_serivce.getGraph_t(id);
		return t_graph;
	}

	// ------------------------------------------------------
	@GetMapping("myCourse")
	public ModelAndView getMyCourse(HttpSession session) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("logId");

		mav.addObject("c_list", u_service.getUserCourse(id));
		mav.setViewName("/mypage/myCourse");
		return mav;
	}

	@GetMapping("myCourseView")
	public ModelAndView getMyCourseView(HttpSession session, int no) {

		mav = new ModelAndView();

		String id = (String) session.getAttribute("logId");

		// mav.addObject("c_list", u_service.getUserCourse(id));
		mav.setViewName("/mypage/myCourseView");
		return mav;
	}
}
