package com.frogging.app.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.DataService;
import com.frogging.app.service.PartyService;
import com.frogging.app.vo.PlogPagingVO;

@RestController
@RequestMapping("/alone/*")
public class AloneController {

	ModelAndView mav = null;

	@Inject
	PartyService p_service;

	@Inject
	DataService d_service;

	@GetMapping(value = "alone_rec_path")
	public ModelAndView alone_rec_path(PlogPagingVO p_PageVO) {

		// DB - 경로 가져오기 + 위치 조건
		// !!!!!!!!!!!!!!!! 위치 조건 검색 !!!!!!!!!!!!!!!!
		if (p_PageVO.getAddr_section_1() != null) {

			// 시군구 뒤에 \n 있는거 처리
			String pull = p_PageVO.getAddr_section_2();
			String[] words = pull.split("\\s");
			p_PageVO.setAddr_section_2(words[0]);

			p_PageVO.setSearchLoc(p_PageVO.getAddr_section_1() + " " + p_PageVO.getAddr_section_2());
		}

		p_PageVO.setTotalRecord(p_service.totalRecord_path(p_PageVO));

		mav = new ModelAndView();
		mav.addObject("addr_1", d_service.getAddr_1());
		mav.addObject("addr_2", d_service.getAddr_2("서울특별시"));

		mav.addObject("list", p_service.getPathList(p_PageVO));
		mav.addObject("p_PageVO", p_PageVO);
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
