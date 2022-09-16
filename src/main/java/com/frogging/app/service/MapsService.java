package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.CourseVO;

public interface MapsService {
	public int courseInsert(CourseVO vo);
	public int coursenoSearch(String course_name);
	public int coursedetailInsert(int course_no, int waypoint, String lat, String log, String addr);
	
	public List<CourseVO> courseAllselect();
	
	public int courseDelete(int course_no);
	
	public CourseVO courseSelect(int course_no);
	public List<CourseVO> detailSelect(int course_no);
	
	public int courseUpdate(CourseVO vo);
	public int waypointCheck(int course_no);
	public int coursedetailUpdate(int course_no, int waypoint, String lat, String log, String addr);
	public int waypointDelete(int course_no, int waypoint);
}
