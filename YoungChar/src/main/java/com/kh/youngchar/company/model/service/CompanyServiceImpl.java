package com.kh.youngchar.company.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youngchar.company.model.dao.CompanyDAO;
import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.Company;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 Service
 * @author jeonga
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder enc;
	

	@Override
	public Company getCompanyProfile(int memberNo) {
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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member updateMember, String newPwd) {

		int result = 0;

			String savePwd = dao.selectPwd(updateMember.getMemberNo());
			
			if(savePwd != null) {
				
				if(enc.matches(updateMember.getMemberPwd(), savePwd )) {
					
					if(!newPwd.equals("null")) {
						updateMember.setMemberPwd(enc.encode(newPwd));
					}else {
						updateMember.setMemberPwd(enc.encode(updateMember.getMemberPwd()));
					}
					
					result = dao.updateMember(updateMember);
				}
			}
		
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMemberStatus(Member member) {
		
		int result = 0;
		
		String savePwd = dao.selectPwd(member.getMemberNo());
				
		if(enc.matches(member.getMemberPwd(), savePwd )) {

			result = dao.selectAplCount(member.getMemberNo());
			
			if(result == 0) {
				result = dao.updateMemberStatus(member.getMemberNo());
			}else {
				result = -1;
			}
		}
		return result;
	}

}
