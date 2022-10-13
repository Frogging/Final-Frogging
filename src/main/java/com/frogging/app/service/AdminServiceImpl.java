package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.frogging.app.dao.AdminDAO;
import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.CustomerServiceVO;
import com.frogging.app.vo.EventVO;
import com.frogging.app.vo.QnaVO;
import com.frogging.app.vo.PagingVO;
//github.com/Frogging/Final-Frogging.git
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

	
	@Override
	public List<QnaVO> qnaList() {
		return dao.qnaList();
	}


	@Override
	public QnaVO getQna(int no) {
		return dao.getQna(no);
	}


	@Override
	public int qnaEditOk(QnaVO vo) {
		return dao.qnaEditOk(vo);
	}


	@Override
	public int qnaDel(int no, String id) {
		return dao.qnaDel(no, id);
	}



	

}
