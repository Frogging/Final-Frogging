package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.CustomerServiceVO;
import com.frogging.app.vo.EventVO;
import com.frogging.app.vo.QnaVO;
import com.frogging.app.vo.PagingVO;
//github.com/Frogging/Final-Frogging.git
import com.frogging.app.vo.UserVO;

public interface AdminService {
	public List<UserVO> userList();
	public UserVO getProfile(String id);
	public int listDel(String id);
	public int editProfile(String id,int restriction);
	public List<CommunityVO> communityList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);

	
	//고객센터
	public List<CustomerServiceVO> customerServiceList();
	public CustomerServiceVO getcustomerService(int no);
	//수정
	public int customerServiceEditOk(CustomerServiceVO vo);
	//삭제
	public int customerServiceDel(int no, String id);
	public List<EventVO> eventList();
	public int eventEdit(EventVO vo);
	public int eventDel(int no, String id);

	public List<QnaVO> qnaList();
	public QnaVO getQna(int no);
	public int qnaEditOk(QnaVO vo);
	public int qnaDel(int no, String id);
}
