package com.frogging.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.frogging.app.dao.ActivityDAO;
import com.frogging.app.vo.ActivityVO;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Inject
	ActivityDAO dao;

	@Override
	public List<ActivityVO> getWeeklyKm() {
		return dao.getWeeklyKm();
	}

	@Override
	public List<ActivityVO> getWeeklyCount() {
		return dao.getWeeklyCount();
	}

	@Override
	public List<ActivityVO> getMonthlyCount() {
		return dao.getMonthlyCount();
	}

	@Override
	public List<ActivityVO> getMonthlyKm() {
		return dao.getMonthlyKm();
	}

}
