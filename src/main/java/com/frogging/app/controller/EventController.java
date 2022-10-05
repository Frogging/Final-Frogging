package com.frogging.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.EventService;
import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.EventPagingVO;
import com.frogging.app.vo.EventVO;
import com.frogging.app.vo.PagingVO;

@Controller
@RequestMapping("/event/*")
public class EventController {
	@Inject
	EventService service;
	ModelAndView mav = null;
	//이벤트 페이지
	@GetMapping("eventList")
	public ModelAndView eventList(EventPagingVO pVO) {
		
		mav = new ModelAndView();
		pVO.setTotalRecord(service.totalRecord(pVO));
		System.out.println(pVO.toString());
		
		
		mav.addObject("list", service.eventList(pVO));
		mav.addObject("pVO", pVO);
		mav.setViewName("event/eventList");
		return mav;	
	}
	//이벤트 내용보기
	@GetMapping("eventView")
	public ModelAndView eventView(@RequestParam("no") int no, EventPagingVO pVO) {
		service.hitCount(no);
		mav = new ModelAndView();
		
		mav.addObject("vo", service.getEvent(no));
		mav.addObject("pVO", pVO);
		mav.setViewName("event/eventView");
		return mav;
	}
	//이벤트 쓰기폼
	@GetMapping("eventForm")
	public ModelAndView eventForm() {
		mav	= new ModelAndView();
		mav.setViewName("event/eventForm");
		return mav;
	}
	//글쓰기 DB
	@PostMapping("eventFormOk")
	public ResponseEntity<String> eventFormOk(EventVO vo, HttpServletRequest request){		
		vo.setId((String)request.getSession().getAttribute("logId"));//세션 로그인 아이디logId
		//vo.setId("testid1");
		
		String msg="<script>";
		try {
			service.eventWrite(vo);
			msg += "location.href='/event/eventList';";
		}catch(Exception e) {
			msg += "alert('글등록이 실패하였습니다.');";
			msg += "history.go(-1);";
			e.printStackTrace();
		}
		msg += "</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
}
