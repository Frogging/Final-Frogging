package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PartyVO;
import com.frogging.app.vo.PlogPagingVO;

public interface PartyService {
	public int newPartyRequest(PartyDetailVO p_detail_vo);

	public List<PartyVO> getPartyList(PlogPagingVO p_pageVO);

	public int totalRecord(PlogPagingVO p_pageVO);

	public void countCurrentNum(int party_no);

	public PartyVO getPartyDetail(int no);
}