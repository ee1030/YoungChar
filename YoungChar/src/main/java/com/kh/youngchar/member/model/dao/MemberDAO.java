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



	//---------------------------------------------------
	//				로그인 DAO
	//---------------------------------------------------
	public Member loginAction(Member inputMember) {
		return sqlSession.selectOne("memberMapper.loginAction", inputMember);
		
	}

	
	//---------------------------------------------------
	//				다음 회원번호 DAO
	//---------------------------------------------------
	public int nextMemNo() {
		return sqlSession.selectOne("memberMapper.nextMem");
		
	}


	//---------------------------------------------------
	//				업체 회원가입 공통부분 DAO
	//---------------------------------------------------
	public int cooSignUpAction(Member member) {
		return sqlSession.insert("memberMapper.cooSignUpAction", member);
		
	}


	//---------------------------------------------------
	//				업체 회원가입 업체 테이블 삽입 DAO
	//---------------------------------------------------
	public int cooMemberInsert(Member member) {
		return sqlSession.insert("memberMapper.cooMemberInsert", member);
		
	}


	public MemberFile selectFile(int memNo) {
		return sqlSession.selectOne("companyMapper.selectFile", memNo);
	}


	
	
	
	
	

}
