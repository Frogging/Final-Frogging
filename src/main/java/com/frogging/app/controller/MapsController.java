package com.frogging.app.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.frogging.app.service.MapsService;
import com.frogging.app.vo.CourseVO;

@Controller
public class MapsController {
	
	@Inject
	MapsService service;
	ModelAndView mav = null;

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
	public void mapsOk(@RequestParam("lat[]") List<String> lat, 
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
		System.out.println(course_no);
		
		for(int i = 0; i < lat.size(); i++) {
			System.out.println(lat.get(i) + " " + log.get(i));
			System.out.println(addr.get(i));
			if(i == lat.size() - 1) {
				waypoint = 99999;
			}
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
	}
	
	@GetMapping("/maps/maps03")
	@ResponseBody
	public ModelAndView maps03(CourseVO vo) {
		
		mav = new ModelAndView();
		
		mav.addObject("courseList", service.courseAllselect());
		mav.setViewName("maps/naver_maps03");
		return mav;
	}
	
	@GetMapping("/maps/mapsDelete/{course_no}")
	public ModelAndView mapsDelete(@PathVariable("course_no") int course_no) {
		mav = new ModelAndView();
		
		int cnt = service.courseDelete(course_no);
		
		mav.setViewName("redirect:/maps/maps03");
		return mav;
	}
	
	@GetMapping("/maps/maps04/{course_no}")
	public ModelAndView maps04(@PathVariable("course_no") int course_no) {
		
		mav = new ModelAndView();
		
		mav.addObject("course", service.courseSelect(course_no));
		
		JSONArray jsonArray = new JSONArray(service.detailSelect(course_no));
		mav.addObject("course_detail", jsonArray);
		
		mav.setViewName("maps/naver_maps04");
		return mav;
	}
	
	@PostMapping("/maps/mapsEditOk/{course_no}")
	@ResponseBody
	public void mapsEditOk(@PathVariable("course_no") int course_no,
						@RequestParam("lat[]") List<String> lat, 
						@RequestParam("log[]") List<String> log, 
						@RequestParam("address[]") List<String> addr,
						CourseVO vo) {
		int result1 = 0;
		int result2 = 0;
		int waypoint = 0;
		result1 = service.courseUpdate(vo);
		
		if(result1 > 0) {
			System.out.println("course 변경 성공");
		}
		
		int waypoint_number = service.waypointCheck(course_no);
		
		for(int i = 0; i < lat.size(); i++) { // 0, 1, 2, 3, 4
			if(i <= waypoint_number - 1) { // 0, 1, 2
				if(i == lat.size() - 1) { // 4 와 비교
					waypoint = 99999;
				}
				if(i == waypoint_number - 1 && waypoint_number < lat.size()) {
					result2 = service.coursedetailInsert(course_no, waypoint, lat.get(i), log.get(i), addr.get(i));
					//System.out.println("test1" + i);
				} else {
					result2 = service.coursedetailUpdate(course_no, waypoint, lat.get(i), log.get(i), addr.get(i));
					//System.out.println("test2" + i);
				}
				if(result2 > 0) {
					System.out.println("경유지 변경 성공");
					result2 = 0;
				}
			} else {
				if(i == lat.size() - 1) { // 4 와 비교, 3, 4
					waypoint = 99999;
					result2 = service.coursedetailUpdate(course_no, waypoint, lat.get(i), log.get(i), addr.get(i));
				} else {
					result2 = service.coursedetailInsert(course_no, waypoint, lat.get(i), log.get(i), addr.get(i));
					//System.out.println("test3" + i);
				}
				if(result2 > 0) {
					System.out.println("경유지 추가 성공");
					result2 = 0;
				}
			}
			waypoint++;
		}
		
		int result3 = 0;
		
		if (waypoint_number > lat.size()) {
			for (int i = lat.size()-1; i < waypoint_number; i++) {
				result3 = service.waypointDelete(course_no, i);
				if(result3 > 0) {
					System.out.println("경유지 삭제 성공");
				}
			}
		}
		
		System.out.println("distance : " + vo.getDistance() + ", time : " + vo.getTime());
		System.out.println("course_name : " + vo.getCourse_name() + ", course_info : " + vo.getCourse_info());
		System.out.println(vo.getLat());
		System.out.println(vo.getLog());
	}
}
