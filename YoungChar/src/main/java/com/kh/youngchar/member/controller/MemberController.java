package com.kh.youngchar.member.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.youngchar.member.model.service.MemberService;
import com.kh.youngchar.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired 
	private JavaMailSender mailSender;
	
	private String swalIcon;
	private String swalTitle;
	private String swalText;
	 

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
	
	
	// ---------------------------------------------------
	// 일반 회원가입  Controller
	// ---------------------------------------------------
	@RequestMapping("SignUpAction")
	public String SignUpAction(@ModelAttribute Member member,
						       @RequestParam(value="images", required=false) List<MultipartFile> images,
						       HttpServletRequest request,
						       RedirectAttributes ra) {
		
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/memberFile");
		
		
		int result = service.SignUpAction(member,images, savePath);
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "회원가입 성공";
			swalText = "회원가입을 환영합니다.";
		}else {
			
			swalIcon = "error";
			swalTitle = "회원가입 실패";
			swalText = "회원가입 과정에서 문제가 발생했습니다.";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);
		
		return "redirect:/";
	}
	
	
	// ---------------------------------------------------
	// 로그인  Controller
	// ---------------------------------------------------
	@RequestMapping("loginAction")
	public String login(Member inputMember,
						@RequestParam(value="saveId", required=false) String saveId,
						RedirectAttributes ra, Model model, HttpServletResponse response) {
		
		Member loginMember = service.loginAction(inputMember);
		
String url = null;	// 로그인 성공 또는 실패 시의 요청 경로를 저장할 변수
		
		if(loginMember != null) {	// 로그인 성공 시
			model.addAttribute("loginMember", loginMember);
			
			// 쿠키 생성
			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			// 쿠키 유지 시간 지정
			if(saveId != null) { // 아이디 저장이 체크 되었을 경우
				// 한달동안 유지되는 쿠키 설정
				cookie.setMaxAge(60 * 60 * 24 * 30); // 초 단위로 지정
			}else {
				cookie.setMaxAge(0);
				// - 쿠키를 생성하지 않겠다
				// - 기존에 있던 쿠키도 없애겠다.
			}
				
			// 생성된 쿠키 객체를 응답 객체에 담아서 내보냄
			response.addCookie(cookie);
			url = "/";
			
		}else {		// 로그인 실패 시
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "로그인 실패");
			ra.addFlashAttribute("swalText", "아이디 또는 비밀번호가 일치하지 않습니다.");
			url = "login";	// 로그인 실패 시 로그인 화면
		}
		
		return "redirect:" + url;
	}
	
	
}
