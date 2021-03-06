package com.kh.youngchar.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

public interface MemberService {

	//---------------------------------------------------
	//				아이디 중복검사 Service (AJAX)
	//---------------------------------------------------
	int idDupCheck(String memberId);

	
	//---------------------------------------------------
	//				닉네임 중복검사 Service (AJAX)
	//---------------------------------------------------
	int nickDupCheck(String memberNickName);


	//---------------------------------------------------
	//				일반 회원가입 Service
	//---------------------------------------------------
	int SignUpAction(Member member, List<MultipartFile> images, String savePath);

	
	//---------------------------------------------------
	//				로그인 Service
	//---------------------------------------------------
	Member loginAction(Member inputMember);

	
	//---------------------------------------------------
	//				업체 회원가입 Service
	//---------------------------------------------------
	int cooSignUpAction(Member member, List<MultipartFile> images, String savePath);

	
	//---------------------------------------------------
	//				마이페이지 프사 얻어오기 Service
	//---------------------------------------------------
	MemberFile selectFile(int memNo);


	//---------------------------------------------------
	//				내 정보 수정 Service
	//---------------------------------------------------
	int mypageUpdate(Map<String, Object> map);

	
	
	//---------------------------------------------------
	//				내 정보 수정(프로필 삭제) Service
	//---------------------------------------------------
	int deleteProfile(int memImgNo);


	//---------------------------------------------------
	//				카카오 로그인 Service
	//---------------------------------------------------
	Member loginMember(Member loginMember);


	//---------------------------------------------------
	//				네이버 로그인 Service
	//---------------------------------------------------
	Member naverMem(Member member);


	String findIdAction(Map<String, Object> map);


	//---------------------------------------------------
	//				비밀번호 찾기 Service
	//---------------------------------------------------
	int findPwdAction(Map<String, Object> map);





}
