package com.frogging.app.service;

import java.util.List;

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
		
		return dao.coursenoSearch(course_name);
	}

	@Override
	public int coursedetailInsert(int course_no, int waypoint, String lat, String log, String addr) {
		
		return dao.coursedetailInsert(course_no, waypoint, lat, log, addr);
	}

	@Override
	public List<CourseVO> courseAllselect() {
		
		return dao.courseAllselect();
	}

	@Override
	public int courseDelete(int course_no) {
		
		return dao.courseDelete(course_no);
	}

	@Override
	public CourseVO courseSelect(int course_no) {
		
		return dao.courseSelect(course_no);
	}

	@Override
	public List<CourseVO> detailSelect(int course_no) {
		
		return dao.detailSelect(course_no);
	}

	@Override
	public int courseUpdate(CourseVO vo) {
		
		return dao.courseUpdate(vo);
	}

	@Override
	public int waypointCheck(int course_no) {
		
		return dao.waypointCheck(course_no);
	}

	@Override
	public int coursedetailUpdate(int course_no, int waypoint, String lat, String log, String addr) {
		
		return dao.coursedetailUpdate(course_no, waypoint, lat, log, addr);
	}

	@Override
	public int waypointDelete(int course_no, int waypoint) {
		
		return dao.waypointDelete(course_no, waypoint);
	}

	@Override
	public List<CourseVO> courseAllselect_t() {
		
		return dao.courseAllselect_t();
	}

	@Override
	public List<CourseVO> detailAllselect_t() {
		// TODO Auto-generated method stub
		return dao.detailAllselect_t();
	}
}
