package com.kh.youngchar.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	//---------------------------------------------------
	//				아이디 중복검사 Controller (AJAX)
	//---------------------------------------------------
	public int idDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.idDupCheck", memberId);
		
	}


	//---------------------------------------------------
	//				닉네임 중복검사 Controller (AJAX)
	//---------------------------------------------------
	public int nickDupCheck(String memberNickName) {
		return sqlSession.selectOne("memberMapper.nickDupCheck", memberNickName);
		
	}
	
	
	
	
	

}
