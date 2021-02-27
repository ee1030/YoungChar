package com.kh.youngchar.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;

	
	
	//---------------------------------------------------
	//				아이디 중복검사 Controller (AJAX)
	//---------------------------------------------------
	@Override
	public int idDupCheck(String memberId) {
		return dao.idDupCheck(memberId);
		
	}


	//---------------------------------------------------
	//				닉네임 중복검사 Controller (AJAX)
	//---------------------------------------------------
	@Override
	public int nickDupCheck(String memberNickName) {
		return dao.nickDupCheck(memberNickName);
		
	}
	
	
	
	
	
	
}
