package com.kh.youngchar.company.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.company.model.dao.CompanyDAO;
import com.kh.youngchar.member.model.vo.MemberFile;

@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private CompanyDAO dao;

	@Override
	public MemberFile getMemberFile(int memberNo) {
		return dao.getMemberFile(memberNo);
	}

}
