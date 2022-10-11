package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.ActivityVO;
import com.frogging.app.vo.CommunityVO;
import com.frogging.app.vo.CourseVO;
import com.frogging.app.vo.QnaVO;
import com.frogging.app.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {
	// 유저 상세정보
	public UserVO getUserDetail(String id);

	// 유저가 쓴 글 - 커뮤니티 리스트
	public List<CommunityVO> getMyWrite(String id);

	// 유저가 쓴 글 - 큐앤에이 리스트
	public List<QnaVO> getMyWrite_qna(String id);

	// 유저의 달성 기록 쓰레기+키로미터 총
	public ActivityVO getRecord(String id);

	// 유저가 만든 코스
	public List<CourseVO> getUserCourse(String id);
}
