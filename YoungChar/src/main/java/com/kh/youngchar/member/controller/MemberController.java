package com.kh.youngchar.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.youngchar.member.model.service.MemberService;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;
import com.kh.youngchar.member.model.vo.NaverLoginBO;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember", "memFile"})
public class MemberController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}


	@Autowired
	private MemberService service;

	@Autowired 
	private JavaMailSender mailSender;
	
	private String swalIcon;
	private String swalTitle;
	private String swalText;
	 

	// 로그인 화면전환 Controller
	@RequestMapping("login")
	public String loginForm(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);

		출처: https://bumcrush.tistory.com/151 [맑음때때로 여름]

		return "member/login";
	}


	// 회원가입 화면전환 Controller
	@RequestMapping("signUp")
	public String signUpForm() {
		
		return "member/signUp";
	}
	
	// 마이페이지 수정 페이지 Controller
	@RequestMapping("updateMypage")
	public String updateMypage() {
		
		return "member/updateMypage";
	}

	// 마이페이지 화면전환 Controller
	@RequestMapping("mypage")
	public String mypageForm(@ModelAttribute("loginMember") Member loginMember, Model model) {
		
		int memNo = loginMember.getMemberNo();
		
		MemberFile mFile = service.selectFile(memNo);
		
		if(mFile != null) {
			model.addAttribute("memFile", mFile);
			
		}
		
		return "member/mypage";
	}

	// 업체 회원가입 화면전환 Controller
	@RequestMapping("cooSignUp")
	public String cooSignUp() {

		return "member/cooSignUp";
	}
	
	
	@RequestMapping("session")
	public String session() {
		
		return "member/session";
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
	// 회원가입 이메일 발송 Controller (AJAX)
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
						       RedirectAttributes ra, Model model) {
		
		
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
	// 업체 회원가입  Controller
	// ---------------------------------------------------
	@RequestMapping("cooSignUpAction")
	public String cooSignUpAction(@ModelAttribute Member member,
			@RequestParam(value="images", required=false) List<MultipartFile> images,
			HttpServletRequest request,
			RedirectAttributes ra) {
		
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/memberFile");
		
		
		int result = service.cooSignUpAction(member,images, savePath);
		
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
		
		String url = null;
		
		if(loginMember != null) {	// 로그인 성공 시
			model.addAttribute("loginMember", loginMember);
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			if(saveId != null) { // 아이디 저장이 체크 되었을 경우
				// 한달동안 유지되는 쿠키 설정
				cookie.setMaxAge(60 * 60 * 24 * 30); // 초 단위로 지정
			}else {
				cookie.setMaxAge(0);
			}
				
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
	
	
	// ---------------------------------------------------
	// 로그아웃  Controller
	// ---------------------------------------------------
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	
	// ---------------------------------------------------
	// 내 정보 수정  Controller
	// ---------------------------------------------------
	@RequestMapping("mypageUpdate")
	public String mypageUpdate(@ModelAttribute Member member,
							   @ModelAttribute(name="loginMember", binding=false) Member loginMember,
							   RedirectAttributes ra, Model model,
							   @RequestParam("memberPwd1") String memberPwd1){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberPwd", member.getMemberPwd());
		map.put("newPwd", memberPwd1);
		map.put("memberAddr", member.getMemberAddr());
		map.put("phone", member.getPhone());
		map.put("nickName", member.getNickName());
		map.put("memberNo", loginMember.getMemberNo());
		
		
		int result = service.mypageUpdate(map);
		
		String url = null;
		
		// 비밀번호 변경 성공 시 
		// success, 비밀번호 변경 성공, 마이페이지 재요청
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "회원정보가 변경되었습니다.";
			
			loginMember.setMemberAddr(member.getMemberAddr());
			loginMember.setPhone(member.getPhone());
			loginMember.setNickName(member.getNickName());
			
			model.addAttribute("loginMember", loginMember);
			
			url = "redirect:mypage";
		}else {
		// 비밀번호 변경 실패 시 
		// error, 비밀번호 변경 실패, 비밀번호 변경 페이지 재요청 
			swalIcon = "error";
			swalTitle = "회원정보 수정 실패";
			url = "redirect:updateMypage";
		}
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		
		
		return url;
	}
	
	
	// ---------------------------------------------------
	// 내 정보 수정(프로필 삭제부분)  Controller
	// ---------------------------------------------------
	@RequestMapping("deleteProfile")
	@ResponseBody
	public int deleteProfile(@RequestParam("memImgNo") int memImgNo ) {
		
		int result = service.deleteProfile(memImgNo);
				
		return result;
		
	}
	
	
	// ---------------------------------------------------
	// 카카오 로그인 Controller
	// ---------------------------------------------------
	@RequestMapping("kakaoLogin")
	@ResponseBody
	public Member loginMember(@ModelAttribute Member loginMember,
							  @RequestParam("memberId") String memberId,
							  @RequestParam("memberPwd") String memberPwd,
							  @RequestParam("memberNm") String memberNm, Model model) {
		
		loginMember = service.loginMember(loginMember);
		
		model.addAttribute("loginMember", loginMember);
		
		return loginMember;
	}
	
	
	
	
}
