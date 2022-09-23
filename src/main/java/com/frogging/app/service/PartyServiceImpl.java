package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.frogging.app.dao.PartyDAO;
import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.CourseVO;
import com.frogging.app.vo.PartyDetailVO;
import com.frogging.app.vo.PartyVO;
import com.frogging.app.vo.PlogPagingVO;

@Controller
public class PartyServiceImpl implements PartyService {

	@Inject
	PartyDAO dao;

	@Override
	public int newPartyRequest(PartyDetailVO p_detail_vo) {
		return dao.newPartyRequest(p_detail_vo);
	}

	@Override
	public List<PartyVO> getPartyList(PlogPagingVO p_pageVO) {
		return dao.getPartyList(p_pageVO);
	}

	@Override
	public int totalRecord(PlogPagingVO p_pageVO) {
		return dao.totalRecord(p_pageVO);
	}

	@Override
	public int addNewParty(PartyVO pVO) {
		return dao.addNewParty(pVO);
	}

	@Override
	public int addNewPartyDetail(PartyDetailVO p_detailVO) {
		return dao.addNewPartyDetail(p_detailVO);
	}

	@Override
	public void countCurrentNum(int party_no) {
		dao.countCurrentNum(party_no);
	}

	@Override
	public PartyVO getPartyDetail(int no) {
		return dao.getPartyDetail(no);
	}

	@Override
	public ActivityVO getLeaderInfo(String id) {
		return dao.getLeaderInfo(id);
	}

	@Override
	public int checkOverlap(PartyDetailVO p_detail_vo) {
		return dao.checkOverlap(p_detail_vo);
	}

	@Override
	public int totalRecord_path(PlogPagingVO p_pageVO) {
		return dao.totalRecord_path(p_pageVO);
	}

	@Override
	public List<CourseVO> getPathList(PlogPagingVO p_pageVO) {
		return dao.getPathList(p_pageVO);
	}

	@Override
	public List<PartyVO> getMyJoinedClub(PartyDetailVO p_dVO) {
		return dao.getMyJoinedClub(p_dVO);
	}

	@Override
	public int getMaxNo() {
		return dao.getMaxNo();
	}

	@Override
	public CourseVO getPathDetail(int no) {
		return dao.getPathDetail(no);
	}

	@Override
	public int partynameCheck(String partyname) {
		return dao.partynameCheck(partyname);
	}

	@Override
	public int rewriteParty(PartyVO pVO) {
		return dao.rewriteParty(pVO);
	}

	@Override
	public int deleteClub(int no) {
		return dao.deleteClub(no);
	}

	@Override
	public int deleteClubDetail(int no) {
		return dao.deleteClubDetail(no);
	}

	@Override
	public int deleteClubDetail_2(int no, String id) {
		return dao.deleteClubDetail_2(no, id);
	}

	@Override
	public void decreaseCurrentNum(int party_no) {
		dao.decreaseCurrentNum(party_no);
	}

	@Override
	public List<PartyDetailVO> getMemberDetail(int no) {
		return dao.getMemberDetail(no);
	}
}
