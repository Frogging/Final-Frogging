package com.frogging.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frogging.app.service.DataService;
import com.frogging.app.vo.AddrVO;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/data/*")
public class DataController {

	@Inject
	DataService service;

	ModelAndView mav = new ModelAndView();

	// 주소지 대분류->소분류 변경
	@GetMapping(value = "getAddr_2")
	public JSONObject getAddr_2(String addr_1) {
		JSONObject voList = new JSONObject();

		try {
			// System.out.println(addr_1);
			ObjectMapper mapper = new ObjectMapper();
			int idx = 0;

			List<AddrVO> addr_2_list = service.getAddr_2(addr_1);
			for (AddrVO vo : addr_2_list) {
				String jsonString = mapper.writeValueAsString(vo);
				// System.out.println(jsonString);

				JSONParser jsonParser = new JSONParser();
				JSONObject jObj_addr_2 = (JSONObject) jsonParser.parse(jsonString);
				voList.put(idx, jObj_addr_2);
				idx += 1;
			}
			voList.put("idx", idx);
			// System.out.println(addr_2_list.get(0).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return voList;
	}

}
