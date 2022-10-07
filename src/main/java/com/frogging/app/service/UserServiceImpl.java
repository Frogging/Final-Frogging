package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.frogging.app.dao.UserDAO;
import com.frogging.app.vo.CommunityVO;
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

}
