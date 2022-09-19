package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.CourseVO;
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

	// 리스트 세팅 - 파티
	public int totalRecord(PlogPagingVO p_pageVO);

	// 리스트 세팅 - 경로
	public int totalRecord_path(PlogPagingVO p_pageVO);

	// 새로운 파티 만들기
	public int addNewParty(PartyVO pVO);

	// 새로운 파티 디테일 - 파티장 추가
	public int addNewPartyDetail(PartyDetailVO p_detailVO);

	// 파티 인원 증가시키기
	public void countCurrentNum(int party_no);

	// 파티 세부 정보 가져오기
	public PartyVO getPartyDetail(int no);

	// 파티장 액티비티 정보 가져오기
	public ActivityVO getLeaderInfo(String id);

	// 파티 중복 신청 확인
	public int checkOverlap(PartyDetailVO p_detail_vo);

	// 경로 리스트 가져오기
	public List<CourseVO> getPathList(PlogPagingVO p_pageVO);

	// 나의 모임 리스트
	public List<PartyVO> getMyJoinedClub(PartyDetailVO p_dVO);
}
