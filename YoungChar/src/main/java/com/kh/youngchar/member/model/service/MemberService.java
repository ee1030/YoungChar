package com.kh.youngchar.member.model.service;

public interface MemberService {

	//---------------------------------------------------
	//				아이디 중복검사 Controller (AJAX)
	//---------------------------------------------------
	int idDupCheck(String memberId);

	
	//---------------------------------------------------
	//				닉네임 중복검사 Controller (AJAX)
	//---------------------------------------------------
	int nickDupCheck(String memberNickName);

}
