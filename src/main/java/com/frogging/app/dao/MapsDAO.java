package com.frogging.app.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.CourseVO;

@Mapper
@Repository
public interface MapsDAO {
	public int courseInsert(CourseVO vo);
	public int coursenoSearch(String course_name);
	public int coursedetailInsert(int course_no, int waypoint, String lat, String log, String addr);
}
