package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.frogging.app.dao.UserDAO;
import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.CourseVO;
import com.frogging.app.vo.CustomerServiceVO;
import com.frogging.app.vo.QnaVO;
import com.frogging.app.vo.UserVO;

@Controller
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;

	@Override
	public UserVO getUserDetail(String id) {
		return dao.getUserDetail(id);
	}

	@Override
	public List<CommunityVO> getMyWrite(String id) {
		return dao.getMyWrite(id);
	}

	@Override
	public List<QnaVO> getMyWrite_qna(String id) {
		return dao.getMyWrite_qna(id);
	}

	@Override
	public ActivityVO getRecord(String id) {
		return dao.getRecord(id);
	}

	@Override
	public List<CourseVO> getUserCourse(String id) {
		return dao.getUserCourse(id);
	}

	@Override
	public List<CustomerServiceVO> getMyWrite_service(String id) {
		return dao.getMyWrite_service(id);
	}

}
