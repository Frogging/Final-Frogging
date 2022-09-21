package com.frogging.app.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.frogging.app.dao.EventDAO;
import com.frogging.app.vo.EventPagingVO;
import com.frogging.app.vo.EventVO;


@Service
public class EventServiceImpl implements EventService{
	@Inject
	EventDAO dao;

	@Override
	public List<EventVO> eventList(EventPagingVO pVO) {
		return dao.eventList(pVO);
	}

	@Override
	public int eventWrite(EventVO vo) {
		return dao.EventWrite(vo);
	}

	@Override
	public EventVO getEvent(int no) {
		return dao.getEvent(no);
	}

	@Override
	public int eventEdit(EventVO vo) {
		return dao.eventEdit(vo);
	}

	@Override
	public int eventDel(int no, String id) {
		return dao.eventDel(no, id);
	}

	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
		
	}

	@Override
	public int totalRecord(EventPagingVO pVO) {
		return dao.totalRecord(pVO);
	}
	
}
