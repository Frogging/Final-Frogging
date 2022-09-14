package com.frogging.app.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.PartyDetailVO;

@Mapper
@Repository
public interface PartyDAO {

	// 새 파티 참여 요청
	public int newPartyRequest(PartyDetailVO p_detail_vo);
}
