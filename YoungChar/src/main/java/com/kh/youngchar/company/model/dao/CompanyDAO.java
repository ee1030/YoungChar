package com.kh.youngchar.company.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.member.model.vo.MemberFile;

@Repository
public class CompanyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberFile getMemberFile(int memberNo) {
		return sqlSession.selectOne("companyMapper.getMemberFile", memberNo);
	}

}
