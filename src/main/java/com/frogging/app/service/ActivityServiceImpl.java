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

	@Override
	public ActivityVO getRank_p(String id) {
		return dao.getRank_p(id);
	}

	@Override
	public ActivityVO getRank_k(String id) {
		return dao.getRank_k(id);
	}

	@Override
	public ActivityVO getUserStatistic(String id, String date_param) {
		return dao.getUserStatistic(id, date_param);
	}

	@Override
	public List<ActivityVO> getActivityList(String id) {
		return dao.getActivityList(id);
	}

	@Override
	public ActivityVO getUserStatistic_w(String id, String date_param) {
		return dao.getUserStatistic_w(id, date_param);
	}

	@Override
	public ActivityVO getUserStatistic_m(String id, String date_param) {
		return dao.getUserStatistic_m(id, date_param);
	}

	@Override
	public ActivityVO getUserStatistic_y(String id, String date_param) {
		return dao.getUserStatistic_y(id, date_param);
	}

	@Override
	public List<ActivityVO> getGraph_w(String id) {
		return dao.getGraph_w(id);
	}

	@Override
	public List<ActivityVO> getGraph_m(String id) {
		return dao.getGraph_m(id);
	}

	@Override
	public List<ActivityVO> getGraph_y(String id) {
		return dao.getGraph_y(id);
	}

	@Override
	public List<ActivityVO> getGraph_t(String id) {
		return dao.getGraph_t(id);
	}

	@Override
	public List<ActivityVO> getPlogGraph() {
		return dao.getPlogGraph();
	}

	@Override
	public int numberOfBad() {
		return dao.numberOfBad();
	}

	@Override
	public int numberOfGood() {
		return dao.numberOfGood();
	}

	@Override
	public int numberOfActive() {
		return dao.numberOfActive();
	}

	@Override
	public int numberOfUnactive() {
		return dao.numberOfUnactive();
	}

	@Override
	public List<ActivityVO> getTrashGraph() {
		return dao.getTrashGraph();
	}

	@Override
	public int activityInsert(ActivityVO avo) {
		return dao.activityInsert(avo);
	}

	@Override
	public int courseuserInsert(int course_no, String id, int waypoint, String lat, String log) {
		// TODO Auto-generated method stub
		return dao.courseuserInsert(course_no, id, waypoint, lat, log);
	}

}
