package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.PagingVO;
import com.frogging.app.vo.UserVO;

public interface AdminService {
	public List<UserVO> userList();
	public UserVO getProfile(String id);
	public int listDel(String id);
	public int editProfile(String id,int restriction);
	public List<CommunityVO> communityList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
