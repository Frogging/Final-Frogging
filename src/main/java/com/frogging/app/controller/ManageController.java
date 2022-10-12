package com.frogging.app.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.ActivityService;
import com.frogging.app.service.PartyService;
import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PartyVO;
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

	// 파티 여러개 삭제
	@PostMapping("/clubMultiDel")
	public ResponseEntity<String> clubMultiDel(PartyVO p_vo) {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		String msg = "<script>";

		int result = 1;
		System.out.println(p_vo.getNolist());

		// 파티삭제 : 파티 디테일 테이블 삭제 -> 파티 테이블 삭제

		try {
			// p_service.clubMultiDel(p_vo);

			if (result != 0) {
				msg += "alert('삭제완료');";
				msg += "location.href='/admin/manageClub';";
			} else {
				msg += "alert('삭제실패');";
				msg += "history.go(-1)";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		msg += "</script>";
		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}
}
