package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {
	// 유저 상세정보
	public UserVO getUserDetail(String id);

	// 유저가 쓴 글 - 리스트
	public List<CommunityVO> getMyWrite(String id);

}
