package com.kh.youngchar.company.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youngchar.company.model.dao.CompanyDAO;
import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.PageInfo;
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
	public List<Application> selectAplList(Map<String, Object> map) {
		return dao.selectAplList(map);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAplStatus(Application apl) {
		return dao.updateAplStatus(apl);
	}

	@Override
	public PageInfo getPageInfo(Map<String, Object> map) {
		int listCount = dao.getListCount(map);
		
		return new PageInfo((int)map.get("cp"), listCount);
	}

}
