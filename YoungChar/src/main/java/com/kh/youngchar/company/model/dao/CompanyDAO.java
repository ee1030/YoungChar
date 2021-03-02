package com.kh.youngchar.company.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 DAO
 * @author jeonga
 *
 */
@Repository
public class CompanyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberFile getCompanyProfile(int memberNo) {
		return sqlSession.selectOne("companyMapper.getCompanyProfile", memberNo);
	}

	public List<Application> selectAplList(int memberNo) {
		return sqlSession.selectList("companyMapper.selectAplList", memberNo);
	}

}
