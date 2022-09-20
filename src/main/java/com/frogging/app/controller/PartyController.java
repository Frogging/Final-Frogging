package com.frogging.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frogging.app.service.PartyService;
import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PartyVO;
import com.frogging.app.vo.PlogPagingVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
		// System.out.println(p_PageVO.toString());

		mav = new ModelAndView();
		mav.addObject("list", p_service.getPartyList(p_PageVO));
		mav.setViewName("plog_together/join_club");
		return mav;
	}

	// 새 클럽 - 추천 경로
	@GetMapping(value = "/make_club_rec_path")
	public ModelAndView make_club_rec_path(PlogPagingVO p_PageVO) {

		// DB - 경로 가져오기 + 위치 조건
		// !!!!!!!!!!!!!!!! 위치 조건 검색 !!!!!!!!!!!!!!!!
		p_PageVO.setTotalRecord(p_service.totalRecord_path(p_PageVO));

		mav = new ModelAndView();
		mav.addObject("list", p_service.getPathList(p_PageVO));
		mav.addObject("p_PageVO", p_PageVO);
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
	public ModelAndView my_club_list(HttpSession session, HttpServletRequest request) {
		mav = new ModelAndView();

		// DB - 해당 아이디의 파티 가져오기
		set_sample_user(session);
		PartyDetailVO p_dVO = new PartyDetailVO();
		p_dVO.setUser_id((String) request.getSession().getAttribute("logId"));

		// 자신이 참여한 클럽
		mav.addObject("join_list", p_service.getMyJoinedClub(p_dVO));
		// 자신이 운영하는 클럽
		p_dVO.setJoin_status(4);
		mav.addObject("manage_list", p_service.getMyJoinedClub(p_dVO));

		mav.setViewName("plog_together/my_club_list");
		return mav;
	}

	// ---------------------- 모달 내 클럽 상세 정보
	@GetMapping(value = "/getClubDetail")
	public JSONObject getClubDetail(int no) {
		JSONObject voList = new JSONObject();
		try {
			// 1) party 정보 가져오기 + course 이름 + 거리 + 소요시간
			PartyVO vo = new PartyVO();
			vo = p_service.getPartyDetail(no);

			// 1-1) vo 객체 jsonString으로 변환
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(vo);
			// System.out.println(jsonString);

			// 1-2) jsonString -> JSONObject로 변환
			JSONParser jsonParser = new JSONParser();
			JSONObject jObj_party = (JSONObject) jsonParser.parse(jsonString);
			voList.put("party", jObj_party);

			// 2)party.id -> activity에서 group by id 해서 총 플로깅 횟수, 총 걸은 거리
			// 2-1)id 가져오기
			String p_id = vo.getId();

			// 2-2) vo -> jsonString
			jsonString = mapper.writeValueAsString(p_service.getLeaderInfo(p_id));

			// 2-3) jsonString -> JSONObject
			JSONObject jObj_activity = (JSONObject) jsonParser.parse(jsonString);
			voList.put("activity", jObj_activity);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return voList;
	}

	// ------------------------ 클럽 참여 신청
	@GetMapping("/ask_join_in")
	public ResponseEntity<String> ask_join_in(HttpSession session, HttpServletRequest request,
			@RequestParam("party_no") int party_no) {

		// entity setting
		// ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		String msg = "<script>";

		// 임의의 유저 세팅 (차후 로그인으로 대체)
		set_sample_user(session);

		try {
			// DB에 쓸 파티 세부 정보 세팅
			PartyDetailVO p_detail_vo = new PartyDetailVO();
			p_detail_vo.setParty_no(party_no);
			p_detail_vo.setUser_id((String) request.getSession().getAttribute("logId"));
			p_detail_vo.setJoin_status(0);

			// 신청 검사
			// 검사-i) detail에 이미 있으면 x
			// System.out.println("party_no:" + p_detail_vo.getParty_no() + " /in party:" +
			// p_service.checkOverlap(p_detail_vo));
			if (p_service.checkOverlap(p_detail_vo) == 0) {

				// 검사-ii) party 정원이 찼는지 p_service.checkNumber
				PartyVO p_vo = p_service.getPartyDetail(party_no);
				if (p_vo.getCurrent_number() < p_vo.getNumber()) {

					p_service.countCurrentNum(party_no); // current number 증가
					p_service.newPartyRequest(p_detail_vo); // p_detail추가

					// 신청 성공일 때 -> 마이 클럽 리스트로
					msg += "alert('클럽 참여 신청 성공하였습니다');";
					msg += "location.href='/club/my_club_list';";
				} else {
					// 모임 정원이 다 찼을 때
					msg += "alert('모집이 마감된 모임입니다');";
					msg += "history.go(-1)";
				}
			} else {
				// 중복 신청일 때
				msg += "alert('이미 신청한 모임입니다');";
				msg += "history.go(-1)";
			}

		} catch (Exception e) {
			e.printStackTrace();
			// 신청 실패일 때 -> back
			msg += "alert('클럽 참여 신청 실패하였습니다.');";
			msg += "history.go(-1)";
		}
		msg += "</script>";

		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}

	// ------------------------ 새 클럽 생성
	@PostMapping(value = "/makeNewClub")
	public ResponseEntity<String> makeNewClub(PartyVO pVO, HttpServletRequest request, HttpSession session) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		String msg = "<script>";

		try {
			set_sample_user(session);
			// DB:party
			// party vo세팅
			pVO.setId((String) request.getSession().getAttribute("logId"));
			pVO.setCurrent_number(1); // 현재 참여인원 1명
			// System.out.println(pVO.toString());
			p_service.addNewParty(pVO);

			// DB:party_detail (파티장) - status:4
			// party_detail vo 세팅
			PartyDetailVO p_detailVO = new PartyDetailVO();
			p_detailVO.setParty_no(p_service.getMaxNo());
			p_detailVO.setUser_id(pVO.getId());
			p_detailVO.setJoin_status(4);
			// System.out.println(p_detailVO.toString());
			p_service.addNewPartyDetail(p_detailVO);

			msg += "alert('클럽 생성을 성공하였습니다');";
			msg += "location.href='/club/my_club_list';";
		} catch (Exception e) {
			e.printStackTrace();
			msg += "alert('클럽 생성을 실패하였습니다.');";
			msg += "history.go(-1)";
		}
		msg += "</script>";

		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}

	// 임의의 유저 세션 세팅 -> db 추가할 것
	public void set_sample_user(HttpSession session) {
		session.setAttribute("logId", "sampleId2@gmail.com");
		session.setAttribute("logNickName", "sampleNickname2");
		session.setAttribute("logStatus", "Y");
	}
}
