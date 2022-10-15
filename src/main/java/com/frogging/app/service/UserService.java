package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.CourseVO;
import com.frogging.app.vo.CustomerServiceVO;
import com.frogging.app.vo.QnaVO;
import com.frogging.app.vo.UserVO;

public interface UserService {
	public UserVO getUserDetail(String id);

	public List<CommunityVO> getMyWrite(String id);

	public List<QnaVO> getMyWrite_qna(String id);

	public List<CustomerServiceVO> getMyWrite_service(String id);

	public ActivityVO getRecord(String id);

	public List<CourseVO> getUserCourse(String id);
}
