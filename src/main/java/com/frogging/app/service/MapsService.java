package com.frogging.app.service;

import com.frogging.app.vo.CourseVO;

public interface MapsService {
	public int courseInsert(CourseVO vo);
	public int coursenoSearch(String course_name);
	public int coursedetailInsert(int course_no, int waypoint, String lat, String log, String addr);
}
