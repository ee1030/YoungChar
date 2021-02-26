package com.kh.youngchar.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.youngchar.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")

public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired 
	private JavaMailSender mailSender;
	 

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

	// ---------------------------------------------------
	// 아이디 중복검사 Controller (AJAX)
	// ---------------------------------------------------
	@RequestMapping("idDupCheck")
	@ResponseBody
	public int idDupCheck(@RequestParam("memberId") String memberId) {

		int result = service.idDupCheck(memberId);

		return result;
	}

	// ---------------------------------------------------
	// 닉네임 중복검사 Controller (AJAX)
	// ---------------------------------------------------
	@RequestMapping("nickDupCheck")
	@ResponseBody
	public int nickDupCheck(@RequestParam("memberNickName") String memberNickName) {

		int result = service.nickDupCheck(memberNickName);

		return result;
	}

	// ---------------------------------------------------
	// 일반 회원가입 이메일 발송 Controller (AJAX)
	// ---------------------------------------------------
	@RequestMapping("normalSignUpMail")
	@ResponseBody
	public String normalSignUpMail(HttpServletRequest request) {
		
		String setfrom = "jihoprac@gmail.com";
		String tomail = request.getParameter("mail"); // 받는 사람 이메일
		String title = "[영차영차] 회원 가입에 필요한 이메일 인증 키값 전송"; // 제목
		String content = "키 값을 인증번호 확인영역에 입력해주세요."; // 내용
		String key = "";

		try {
			Random random = new Random();
			  
			  for (int i = 0; i < 3; i++) {
					int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
					key += (char) index;
				}
				int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
				key += numIndex;
				
				
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content + key); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return key;
	}
	
}
