package com.frogging.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.frogging.app.service.DataService;
import com.frogging.app.vo.AddrVO;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/data/*")
public class DataController {

	DataService service;

	// 주소지 대분류 가져오기
	@GetMapping(value = "getAddr_1")
	public JSONObject getAddr_1() {
		try {
			// List<AddrVO> addr_list = service.getAddr_1();
			// ObjectMapper mapper = new ObjectMapper();
			// String jsonString = mapper.writeValueAsString();
			// System.out.println(jsonString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
