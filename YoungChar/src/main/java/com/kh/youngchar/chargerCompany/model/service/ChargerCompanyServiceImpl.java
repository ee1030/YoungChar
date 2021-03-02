package com.kh.youngchar.chargerCompany.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.chargerCompany.model.dao.ChargerCompanyDAO;
import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.company.model.vo.PageInfo;

@Service
public class ChargerCompanyServiceImpl implements ChargerCompanyService{
	
	@Autowired
	private ChargerCompanyDAO dao;

	@Override
	public PageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount(cp);

		return new PageInfo(cp, listCount);
	}

	@Override
	public List<ChargerCompany> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}


}
