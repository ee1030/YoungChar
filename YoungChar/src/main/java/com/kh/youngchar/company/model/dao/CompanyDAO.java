package com.kh.youngchar.company.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.Company;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 관련 DAO
 * @author jeonga
 *
 */
@Repository
public class CompanyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Company getCompanyProfile(int memberNo) {
		return sqlSession.selectOne("companyMapper.getCompanyProfile", memberNo);
	}
	
	public int selectWatingCount(int memberNo) {
		return sqlSession.selectOne("companyMapper.selectWatingCount", memberNo);
	}

	public int selectReviewCount(int memberNo) {
		return sqlSession.selectOne("companyMapper.selectReviewCount", memberNo);
	}

	public List<Application> selectSchedule(Map<String, Object> map) {
		return sqlSession.selectList("companyMapper.selectSchedule", map);
	}


	public List<Application> selectAplList(Map<String, Object> map) {
		
		PageInfo pInfo = (PageInfo)map.get("pInfo");
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		List<Application> list = null;
		String status = (String)map.get("status");
		
		if(status.equals("ALL")) {
			list = sqlSession.selectList("companyMapper.selectAplList1", (int)map.get("memberNo"), rowBounds);
			
		}else {
			list = sqlSession.selectList("companyMapper.selectAplList2", map, rowBounds);
		}
		
		return list;		
	}

	public int updateAplStatus(Application apl) {
		return sqlSession.update("companyMapper.updateAplStatus", apl);
	}

	public int getListCount(Map<String, Object> map) {
		
		int listCount = 0;
		String status = (String)map.get("status");
		
		if(status.equals("ALL")) {
			listCount = sqlSession.selectOne("companyMapper.getListCount1", (int)map.get("memberNo"));
		}else {
			listCount = sqlSession.selectOne("companyMapper.getListCount2", map);
		}
		
		return listCount;
	}


	public String selectPwd(int memberNo) {
		return sqlSession.selectOne("companyMapper.selectPwd", memberNo);
	}


	public int updateMember(Member updateMember) {
		return sqlSession.update("companyMapper.updateMember", updateMember);
	}


	public int updateMemberStatus(int memberNo) {
		return sqlSession.update("companyMapper.updateMemberStatus", memberNo);
	}


	public int selectAplCount(int memberNo) {
		return sqlSession.selectOne("companyMapper.selectAplCount", memberNo);
	}

	public int changeProfileImg(Map<String, Object> map) {
		return sqlSession.update("companyMapper.changeProfileImg", map);
	}





}
