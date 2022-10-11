package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.PagingVO;
import com.frogging.app.vo.UserVO;

@Mapper
@Repository
public interface AdminDAO {
	public List<UserVO> userList();
	public UserVO getProfile(String id);
	public int listDel(String id);
	public int editProfile(String id,int restriction);
	public List<CommunityVO> communityList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
