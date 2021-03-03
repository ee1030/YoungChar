package com.kh.youngchar.company.model.service;

import java.util.List;
import java.util.Map;

import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 Service
 * @author jeonga
 *
 */
public interface CompanyService {
	
	MemberFile getCompanyProfile(int memberNo);

	List<Application> selectAplList(Map<String, Object> map);

	int updateAplStatus(Application apl);

	PageInfo getPageInfo(Map<String, Object> map);

}
