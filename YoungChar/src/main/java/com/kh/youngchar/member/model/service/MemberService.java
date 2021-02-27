package com.kh.youngchar.member.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.member.model.vo.Member;

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



}
