package com.kh.youngchar.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.youngchar.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")

public class MemberController {

	@Autowired
	private MemberService service;
	
	
	// 로그인 화면전환 Controller
	@RequestMapping("login")
	public String loginForm() {
		
		return "member/login";
	}
	
	// 회원가입 화면전환 Controller
	@RequestMapping("signUp")
	public String signUpForm() {
		
		return "member/signUp";
	}

	// 마이페이지 화면전환 Controller
	@RequestMapping("mypage")
	public String mypageForm() {
		
		return "member/mypage";
	}
	
	// 업체 회원가입 화면전환 Controller
	@RequestMapping("cooSignUp")
	public String cooSignUp() {
		
		return "member/cooSignUp";
	}
	
}
