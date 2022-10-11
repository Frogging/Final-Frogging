package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.stereotype.Service;

import com.frogging.app.dao.AdminDAO;
import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.PagingVO;
import com.frogging.app.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Inject
	AdminDAO dao;

	@Override
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		return dao.userList();
	}


	@Override
	public int listDel(String id) {
		// TODO Auto-generated method stub
		return dao.listDel(id);
	}


	@Override
	public UserVO getProfile(String id) {
		// TODO Auto-generated method stub
		return dao.getProfile(id);
	}


	@Override
	public int editProfile(String id, int restriction) {
		// TODO Auto-generated method stub
		return dao.editProfile(id, restriction);
	}


	@Override
	public List<CommunityVO> communityList(PagingVO pVO) {
		// TODO Auto-generated method stub
		return dao.communityList(pVO);
	}


	@Override
	public int totalRecord(PagingVO pVO) {
		// TODO Auto-generated method stub
		return dao.totalRecord(pVO);
	}





	

}
