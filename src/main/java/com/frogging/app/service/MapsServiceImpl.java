package com.frogging.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.frogging.app.dao.MapsDAO;
import com.frogging.app.vo.CourseVO;

@Controller
public class MapsServiceImpl implements MapsService{

	@Inject
	MapsDAO dao;
	
	@Override
	public int courseInsert(CourseVO vo) {
		
		return dao.courseInsert(vo);
	}

	@Override
	public int coursenoSearch(String course_name) {
		// TODO Auto-generated method stub
		return dao.coursenoSearch(course_name);
	}

	@Override
	public int coursedetailInsert(int course_no, int waypoint, String lat, String log, String addr) {
		// TODO Auto-generated method stub
		return dao.coursedetailInsert(course_no, waypoint, lat, log, addr);
	}
	
	
}
