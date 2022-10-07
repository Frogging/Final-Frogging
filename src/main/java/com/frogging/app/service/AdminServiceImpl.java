package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.stereotype.Service;

import com.frogging.app.dao.AdminDAO;
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
	public UserVO listEdit1(String id) {
		// TODO Auto-generated method stub
		return dao.listEdit1(id);
	}





	

}
