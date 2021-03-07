package com.kh.youngchar.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.Board;
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


	//---------------------------------------------------
	//				마이페이지 프사 조회 DAO
	//---------------------------------------------------
	public MemberFile selectFile(int memNo) {
		return sqlSession.selectOne("companyMapper.selectFile", memNo);
	}


	//---------------------------------------------------
	//				비밀번호 조회 DAO
	//---------------------------------------------------
	public String selectPwd(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPwd", memberNo);
		
	}


	
	//---------------------------------------------------
	//				비밀번호 수정 DAO
	//---------------------------------------------------
	public int updatePwd(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updatePwd", map);
	}


	//---------------------------------------------------
	//				회원정보 수정 DAO
	//---------------------------------------------------
	public int updateAction(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateAction", map);
		
	}

	
	//---------------------------------------------------
	//				회원정보 수정(프로필 삭제) DAO
	//---------------------------------------------------
	public int deleteProfile(int memImgNo) {
		return sqlSession.delete("memberMapper.deleteProfile", memImgNo);
		
	}

	//---------------------------------------------------
	//				카카오 로그인 DAO
	//---------------------------------------------------
	public int loginMember(Member loginMember) {
		return sqlSession.insert("memberMapper.loginMember", loginMember);
		
	}


	public int naverMem(Member member) {
		return sqlSession.insert("memberMapper.naverMem", member);
		
	}


	public String findIdAction(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.findIdAction", map);
		
	}


	
	// 비밀번호 찾기
	public int findPwdAction(Map<String, Object> map) {
		return sqlSession.update("memberMapper.findPwdAction", map);
		
	}


	public List<Board> selectList(String memberNo) {
		return sqlSession.selectList("memberMapper.selectList", memberNo);
		
	}


	public List<Attachment> selectThumbnailList(List<Board> bList) {
		return sqlSession.selectList("memberMapper.selectThumbnailList", bList);
		
	}


	public int bListNo(String memberNo) {
		return sqlSession.selectOne("memberMapper.bListNo", memberNo);
		
	}


	// 마이페이지 카테고리별 조회
	public List<Board> chooseList(Map<String, Object> map) {
		return sqlSession.selectList("memberMapper.chooseList", map);
		
	}


	
	
	
	
	

}
