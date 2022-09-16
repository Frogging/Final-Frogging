package com.frogging.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.PartyService;
import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PlogPagingVO;

@RestController
@RequestMapping("/club/*")
public class PartyController {

	ModelAndView mav = null;

	@Inject
	PartyService p_service;

	// 함께 시작하기
	@GetMapping(value = "/join_club")
	public ModelAndView start_party(PlogPagingVO p_PageVO) {

		// DB - 파티 가져오기 + 날짜 조건 + 위치 조건
		// !!!!!!!!!!!!!!!! 위치 조건 가져오기 !!!!!!!!!!!!!!!! (course DB 들어오고 처리)

		// 페이지 + 조건 검색 세팅
		p_PageVO.setTotalRecord(p_service.totalRecord(p_PageVO));

		mav = new ModelAndView();
		mav.addObject("list", p_service.getPartyList(p_PageVO));

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

	// 클럽관리 - 리스트
	@GetMapping(value = "/my_club_list")
	public ModelAndView my_club_list() {

		// DB - 해당 아이디의 파티 가져오기

		mav = new ModelAndView();
		mav.setViewName("plog_together/my_club_list");
		return mav;
	}

	// 파티 참여 신청
	@GetMapping("/ask_join_in")
	public ResponseEntity<String> ask_join_in(HttpSession session, HttpServletRequest request,
			@RequestParam("party_no") int party_no) {

		// entity setting
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");

		// 임의의 유저 세팅 (차후 로그인으로 대체)
		set_sample_user(session);

		String msg = "<script>";

		try {
			// DB에 쓸 파티 세부 정보 세팅
			PartyDetailVO p_detail_vo = new PartyDetailVO();
			p_detail_vo.setParty_no(party_no);
			p_detail_vo.setUser_id((String) request.getSession().getAttribute("logId"));
			p_detail_vo.setJoin_status(0);
			p_service.newPartyRequest(p_detail_vo);

			// 신청 성공일 때 -> 마이 클럽 리스트로

			msg += "alert('클럽 참여 신청 성공하였습니다');";
			msg += "location.href='/club/my_club_list';";

		} catch (Exception e) {
			e.printStackTrace();
			// 신청 실패일 때 -> back
			msg += "alert('클럽 참여 신청 실패하였습니다.');";
			msg += "history.go(-1)";
		}
		msg += "</script>";

		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}

	// 임의의 유저 세션 세팅 -> db 추가할 것
	public void set_sample_user(HttpSession session) {
		session.setAttribute("logId", "sampleId@gmail.com");
		session.setAttribute("logNickName", "sampleNickname");
		session.setAttribute("logStatus", "Y");
	}
}
