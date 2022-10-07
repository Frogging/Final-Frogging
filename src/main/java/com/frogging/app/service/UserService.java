package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.UserVO;

public interface UserService {
	public UserVO getUserDetail(String id);

	public List<CommunityVO> getMyWrite(String id);
}
