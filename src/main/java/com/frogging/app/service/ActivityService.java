package com.frogging.app.service;

import java.util.List;

import com.frogging.app.vo.ActivityVO;

public interface ActivityService {
	public List<ActivityVO> getWeeklyCount();

	public List<ActivityVO> getWeeklyKm();

	public List<ActivityVO> getMonthlyCount();

	public List<ActivityVO> getMonthlyKm();
}