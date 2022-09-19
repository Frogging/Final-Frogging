package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.CourseVO;
import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PartyVO;
import com.frogging.app.vo.PlogPagingVO;

public interface PartyService {
	public int newPartyRequest(PartyDetailVO p_detail_vo);

	public List<PartyVO> getPartyList(PlogPagingVO p_pageVO);

	public int totalRecord(PlogPagingVO p_pageVO);

	public int totalRecord_path(PlogPagingVO p_pageVO);

	public int addNewParty(PartyVO pVO);

	public int addNewPartyDetail(PartyDetailVO p_detailVO);

	public void countCurrentNum(int party_no);

	public PartyVO getPartyDetail(int no);

	public ActivityVO getLeaderInfo(String id);

	public int checkOverlap(PartyDetailVO p_detail_vo);

	public List<CourseVO> getPathList(PlogPagingVO p_pageVO);

	public List<PartyVO> getMyJoinedClub(PartyDetailVO p_dVO);
}