package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.stereotype.Service;

import com.frogging.app.dao.AdminDAO;
import com.frogging.app.vo.CustomerServiceVO;
import com.frogging.app.vo.EventVO;
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
	public List<CustomerServiceVO> customerServiceList() {
		return dao.customerServiceList();
	}


	@Override
	public int customerServiceEditOk(CustomerServiceVO vo) {
		return dao.customerServiceEditOk(vo);
	}


	@Override
	public int customerServiceDel(int no, String id) {
		return dao.customerServiceDel(no, id);
	}


	@Override
	public CustomerServiceVO getcustomerService(int no) {
		return dao.getcustomerService(no);
	}


	@Override
	public List<EventVO> eventList() {
		return dao.eventList();
	}


	@Override
	public int eventEdit(EventVO vo) {
		return dao.eventEdit(vo);
	}


	@Override
	public int eventDel(int no, String id) {
		return dao.eventDel(no, id);
	}





	

}
