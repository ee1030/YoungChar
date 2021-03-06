package com.kh.youngchar.company.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.Company;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 관련 Service
 * @author jeonga
 *
 */
public interface CompanyService {
	
	Company getCompanyProfile(int memberNo);

	int selectWatingCount(int memberNo);
	
	int selectReviewCount(int memberNo);

	List<Application> selectSchedule(Map<String, Object> map);

	List<Application> selectAplList(Map<String, Object> map);

	int updateAplStatus(Application apl);

	PageInfo getPageInfo(Map<String, Object> map);

	int updateMember(Member updateMember, String newPwd);

	int updateMemberStatus(Member member);

	int changeProfileImg(Map<String, Object> map);




}
