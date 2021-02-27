package com.kh.youngchar.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

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

	//---------------------------------------------------
	//				일반 회원가입 Controller
	//---------------------------------------------------
	public int SignUpAction(Member member) {
		return sqlSession.insert("memberMapper.SignUpAction", member);
		
	}


	//---------------------------------------------------
	//				일반 회원가입 프로필 이미지 저장 Controller
	//---------------------------------------------------
	public int insertMemberFile(List<MemberFile> uploadImages) {
		return sqlSession.insert("memberMapper.insertMemberFile", uploadImages);
		
	}


	public int memNo() {
		return sqlSession.selectOne("memberMapper.memNo");
	}
	
	
	
	
	

}
