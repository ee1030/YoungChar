package com.kh.youngchar.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.Board;
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

		return "member/login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "callback")
	public String callback(@ModelAttribute Member loginMember, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String memberId = (String)response_obj.get("id");
	String nickName = (String)response_obj.get("nickname");
	String memberNm = (String)response_obj.get("name");
	String memberEmail = (String)response_obj.get("email");
	String memberGrade = "G";
	
	loginMember.setMemberId(memberId);
	loginMember.setNickName(nickName);
	loginMember.setMemberNm(memberNm);
	loginMember.setMemberEmail(memberEmail);
	loginMember.setMemberGrade(memberGrade);
	
	model.addAttribute("loginMember", loginMember);
	
	/*
	 * Member member = null;
	 * 
	 * member.setMemberEmail(memberEmail);
	 * 
	 * member = service.naverMem(member);
	 * 
	 * if(member != null) { session.setAttribute("loginMember", member);
	 * 
	 * }
	 */
	//4.파싱 닉네임 세션으로 저장
	session.setAttribute("sessionId",nickName); //세션 생성
	model.addAttribute("result", apiResult);
	return "redirect:/";
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
		
		String memberNo = loginMember.getMemberId();
		List<Board> bList = new ArrayList<Board>();
		
		bList = service.selectList(memberNo);
		int bListNo = service.bListNo(memberNo);
		
		if(bList != null && !bList.isEmpty()) { // 게시글 목록 조회 성공 시 
			List<Attachment> thumbnailList = service.selectThumbnailList(bList);
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
			
		}
		
		model.addAttribute("bList", bList);
		model.addAttribute("bListNo", bListNo);
		
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
		
		String setfrom = "pjhyoung123@gmail.com";
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
							   @RequestParam(value="image", required=false) List<MultipartFile> images,
							   RedirectAttributes ra, Model model,
							   HttpServletRequest request,
							   @RequestParam("memberPwd1") String memberPwd1){
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/memberFile");
		System.out.println(images);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberPwd", member.getMemberPwd());
		map.put("newPwd", memberPwd1);
		map.put("memberAddr", member.getMemberAddr());
		map.put("phone", member.getPhone());
		map.put("nickName", member.getNickName());
		map.put("memberNo", loginMember.getMemberNo());
		
		
		int result = service.mypageUpdate(map, images, savePath);
		
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
		
		int result = service.addMem(memberId);
		
		if(result == 0) {
			loginMember = service.loginMember(loginMember);
		}
		model.addAttribute("loginMember", loginMember);
		
		return loginMember;
	}
	
	
	// ---------------------------------------------------
	// 아이디 찾기 화면전환 Controller
	// ---------------------------------------------------
	@RequestMapping("findId")
	public String findIdForm() {
		
		return "member/findId";
	}
	
	
	@RequestMapping("findIdAction")
	public String findIdAction(@RequestParam("memberNm") String memberNm, @RequestParam("memberEmail") String memberEmail, Model model, RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNm", memberNm);
		map.put("memberEmail", memberEmail);
		
		String memberId = service.findIdAction(map);
		
		
		String url = "";
		if(memberId != null) {
			model.addAttribute("memberId", memberId);
			url = "member/findIdResult";
		}else {
			swalIcon = "error";
			swalTitle = "아이디 또는 이메일을 확인해주세요";
			url = "redirect:findId";
			ra.addFlashAttribute("swalIcon", swalIcon);
			ra.addFlashAttribute("swalTitle", swalTitle);
		}
		
		return url;
	}
	
	
	
	// ---------------------------------------------------
	// 비밀번호 찾기 화면전환 Controller
	// ---------------------------------------------------
	@RequestMapping("findPwd")
	public String findPwdForm() {
		
		return "member/findPwd";
	}
	
	
	
	// ---------------------------------------------------
		// 비밀번호 찾기 이메일 발송 Controller (AJAX)
		// ---------------------------------------------------
		@RequestMapping("findPwdMail")
		@ResponseBody
		public String findPwdMail(HttpServletRequest request) {
			
			String setfrom = "pjhyoung123@gmail.com";
			String tomail = request.getParameter("mail"); // 받는 사람 이메일
			String title = "[영차영차] 비밀번호 찾기에 필요한 이메일 인증 키값 전송"; // 제목
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
	// 비밀번호 찾기  Controller
	// ---------------------------------------------------
	@RequestMapping("findPwdAction")
	public String findPwdAction(@RequestParam("memberId") String memberId,
								@RequestParam("memberEmail") String memberEmail,
								@RequestParam("memberPwd1") String memberPwd1,
								RedirectAttributes ra) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("memberEmail", memberEmail);
		map.put("memberPwd", memberPwd1);
		
		int result = service.findPwdAction(map);
		
		String url = "";
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "회원정보가 변경되었습니다.";
			url = "redirect:/";
			
		}else {
			swalIcon = "error";
			swalTitle = "아이디 또는 이메일을 확인해주세요";
			url = "redirect:findPwd";
		
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		return url;
	}
	
	
	
	// ---------------------------------------------------
	// 내가 쓴 글 카테고리별 조회  Controller
	// ---------------------------------------------------
	@RequestMapping("chooseList")
	public String chooseList(@ModelAttribute(name="loginMember", binding=false) Member loginMember,
							 @RequestParam("boardCode") int boardCode, Model model) {
		
		String memberNo = loginMember.getMemberId();
		List<Board> bList1 = new ArrayList<Board>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("boardCode", boardCode);
		
		bList1 = service.chooseList(map);
		
		if(bList1 != null && !bList1.isEmpty()) { // 게시글 목록 조회 성공 시 
			List<Attachment> thumbnailList = service.selectThumbnailList(bList1);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
			
		}
		
		model.addAttribute("bList", bList1);
		
		
		return "member/mypage";
	}
	
	
	// ---------------------------------------------------
	// 회원 탈퇴 Controller
	// ---------------------------------------------------
	@RequestMapping("deleteMember")
	public String deleteMember(@ModelAttribute("loginMember") Member loginMember,
								RedirectAttributes ra,
								SessionStatus status) {

		int result = service.deleteMember(loginMember);
		
		String url = "";
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "회원 탈퇴 성공";
			url = "/";
			// 회원 탈퇴 성공 시 로그 아웃
			status.setComplete();
			
		}else if(result == 0) {
			swalIcon = "error";
			swalTitle = "회원 탈퇴 과정에서 문제 발생";
			url = "session";
			
		}else {
			swalIcon = "warning";
			swalTitle = "현재 비밀번호가 틀렸습니다.";
			url = "session";
		}
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		
		return "redirect:" + url;
	}
	
	
	
}
