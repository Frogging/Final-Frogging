package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PartyVO;
import com.frogging.app.vo.PlogPagingVO;

@Mapper
@Repository
public interface PartyDAO {

	// 새 파티 참여 요청
	public int newPartyRequest(PartyDetailVO p_detail_vo);

	// 파티 리스트 가져오기
	public List<PartyVO> getPartyList(PlogPagingVO p_pageVO);

	// 리스트 세팅
	public int totalRecord(PlogPagingVO p_pageVO);

	// 파티 인원 증가시키기
	public void countCurrentNum(int party_no);

	// 파티 세부 정보 가져오기
	public PartyVO getPartyDetail(int no);
}
