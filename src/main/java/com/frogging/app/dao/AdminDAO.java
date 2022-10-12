package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.CustomerServiceVO;
import com.frogging.app.vo.EventPagingVO;
import com.frogging.app.vo.EventVO;
import com.frogging.app.vo.PagingVO;
import com.frogging.app.vo.UserVO;

@Mapper
@Repository
public interface AdminDAO {
	public List<UserVO> userList();
	public UserVO getProfile(String id);
	public int listDel(String id);
	public int editProfile(String id,int restriction);
	
	//고객센터
	public List<CustomerServiceVO> customerServiceList();
	//내용보기
	public CustomerServiceVO getcustomerService(int no);
	//수정
	public int customerServiceEditOk(CustomerServiceVO vo);
	//삭제
	public int customerServiceDel(int no, String id);
	
	public List<EventVO> eventList();
	public int eventEdit(EventVO vo);
	public int eventDel(int no, String id);
}
