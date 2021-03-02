package com.kh.youngchar.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.company.model.dao.CompanyDAO;
import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 Service
 * @author jeonga
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO dao;

	@Override
	public MemberFile getCompanyProfile(int memberNo) {
		return dao.getCompanyProfile(memberNo);
	}

	@Override
	public List<Application> selectAplList(int memberNo) {
		return dao.selectAplList(memberNo);
	}

}
