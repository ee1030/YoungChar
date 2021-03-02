package com.kh.youngchar.company.model.service;

import java.util.List;

import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 Service
 * @author jeonga
 *
 */
public interface CompanyService {
	
	MemberFile getCompanyProfile(int memberNo);

	List<Application> selectAplList(int memberNo);

}
