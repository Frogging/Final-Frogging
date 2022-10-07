package com.frogging.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.frogging.app.vo.ActivityVO;

@Mapper
@Repository
public interface ActivityDAO {

	// 주간 횟수 리스트
	public List<ActivityVO> getWeeklyCount();

	// 주간 km 리스트
	public List<ActivityVO> getWeeklyKm();

	// 월간 횟수 리스트
	public List<ActivityVO> getMonthlyCount();

	// 월간 km 리스트
	public List<ActivityVO> getMonthlyKm();

	// 횟수 전체 랭킹
	public int getRank_p(String id);

	// km 전체 랭킹
	public int getRank_k(String id);
}
