package com.frogging.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.frogging.app.dao.PartyDAO;
import com.frogging.app.vo.PartyDetailVO;

@Controller
public class PartyServiceImpl implements PartyService {

	@Inject
	PartyDAO dao;

	@Override
	public int newPartyRequest(PartyDetailVO p_detail_vo) {
		return dao.newPartyRequest(p_detail_vo);
	}

}
