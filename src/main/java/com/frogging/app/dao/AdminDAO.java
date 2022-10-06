package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.UserVO;

@Mapper
@Repository
public interface AdminDAO {
	public List<UserVO> userList();
}
