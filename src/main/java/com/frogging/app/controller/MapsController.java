package com.frogging.app.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.frogging.app.service.MapsService;
import com.frogging.app.vo.CourseVO;

@Controller
public class MapsController {
	
	@Inject
	MapsService service;

	@RequestMapping("/maps/maps01")
	public String maps01() {
		return "maps/naver_maps01";
	}
	
	@RequestMapping("/maps/maps02")
	public String maps02() {
		return "maps/naver_maps02";
	}
	
	@PostMapping("/maps/mapsOk")
	@ResponseBody
	public String mapsOk(@RequestParam("lat[]") List<String> lat, 
						@RequestParam("log[]") List<String> log, 
						@RequestParam("address[]") List<String> addr,
						CourseVO vo) {
		
		int result1 = 0;
		int result2 = 0;
		int course_no;
		int waypoint = 0;
		result1 = service.courseInsert(vo);
		
		if(result1 > 0) {
			System.out.println("course 등록 성공");
		}
		course_no = service.coursenoSearch(vo.getCourse_name());
		
		for(int i = 0; i < lat.size(); i++) {
			System.out.println(lat.get(i) + " " + log.get(i));
			System.out.println(addr.get(i));
			result2 = service.coursedetailInsert(course_no, waypoint, lat.get(i), log.get(i), addr.get(i));
			if(result2 > 0) {
				System.out.println("경유지 등록 성공");
				result2 = 0;
			}
			waypoint++;
		}
		
		System.out.println("distance : " + vo.getDistance() + ", time : " + vo.getTime());
		System.out.println("course_name : " + vo.getCourse_name() + ", course_info : " + vo.getCourse_info());
		System.out.println(vo.getLat());
		System.out.println(vo.getLog());
		return "";
	}
}
