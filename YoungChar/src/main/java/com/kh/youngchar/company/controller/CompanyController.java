package com.kh.youngchar.company.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.Company;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 관련 Controller
 * @author jeonga
 *
 */
@Controller
@RequestMapping("/company/*")
@SessionAttributes({"company", "loginMember"})
public class CompanyController {
	
	@Autowired
	private CompanyService service;
	
	private String swalIcon;
	private String swalTitle;
	private String swalText;
	
	private Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@RequestMapping("dashboard")
	public String dashBoard(Model model,
							@ModelAttribute("loginMember") Member loginMember) {
		
		// 대시보드
		int memberNo = loginMember.getMemberNo();
		
		Company company = service.getCompanyProfile(memberNo);
		
		if(company != null) {
			model.addAttribute("company", company);
		}
		
		// 시승 예약 목록
		Map<String, Object> map = new HashMap<String, Object>();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		map.put("date", format.format(System.currentTimeMillis()));
		map.put("memberNo", memberNo);
		
		List<Application> apl = service.selectSchedule(map);
		
		if(apl != null) {
			model.addAttribute("apl", apl);
			model.addAttribute("aplCount", apl.size());
		}
		
		// 승인 대기 개수, 시승 후기 개수
		int waitingCount = service.selectWatingCount(memberNo);
		int reviewCount = service.selectReviewCount(memberNo);
		
		model.addAttribute("waitingCount", waitingCount);
		model.addAttribute("reviewCount", reviewCount);

		
		return "company/dashBoard";
	}
	
	@ResponseBody
	@RequestMapping("selectSchedule/{searchDate}")
	public String selectSchedule(@PathVariable("searchDate") String date,
								 @ModelAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("memberNo", loginMember.getMemberNo());
		
		List<Application> aList = service.selectSchedule(map);
		
		Gson gson = new GsonBuilder().setDateFormat("HH:mm").create();
		
		return gson.toJson(aList);
	}
	
	@RequestMapping("applicationlist/{status}")
	public String applicationList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
								  @ModelAttribute("loginMember") Member loginMember,
								  Model model,
								  @PathVariable String status) {
		
		PageInfo pInfo = null;
		Map<String, Object> map = new HashMap<>();
		map.put("cp", cp);
		map.put("memberNo", loginMember.getMemberNo());
		map.put("status", status.toUpperCase());

		pInfo = service.getPageInfo(map);
		
		map.clear();
		
		map.put("memberNo", loginMember.getMemberNo());
		map.put("status", status.toUpperCase());
		map.put("pInfo", pInfo);
		
		List<Application> list = service.selectAplList(map);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pInfo", pInfo);
		}
		
		return "company/applicationList";
	}
	
	@ResponseBody
	@RequestMapping("updateAplStatus")
	public int updateAplStatus(int rsrvtNo, String approvalStatus) {
	
		Application apl = new Application();
		
		apl.setRsrvtNo(rsrvtNo);
		apl.setApprovalStatus(approvalStatus);
		
		int result = service.updateAplStatus(apl);
		
		
		return result;
	}
	
	
	@RequestMapping("companyinfo")
	public String companyInfo() {
		return "company/companyInfo";
	}
	
	@RequestMapping("updateAction")
	public String updateMember(@ModelAttribute Member updateMember,
							 @RequestParam(value="newPwd", required = false, defaultValue = "null") String newPwd,
							 Model model, RedirectAttributes ra,
							 @ModelAttribute(name="loginMember", binding=false) Member loginMember) {
								
		updateMember.setMemberNo(loginMember.getMemberNo());

		int result = service.updateMember(updateMember, newPwd);
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "회원 정보가 변경되었습니다.";
			
			loginMember.setMemberEmail(updateMember.getMemberEmail());
			loginMember.setPhone(updateMember.getPhone());
			loginMember.setMemberAddr(updateMember.getMemberAddr());
			
			model.addAttribute("loginMember", loginMember);
		}
		else {
			swalIcon = "error";
			swalTitle = "현재 비밀번호를 확인해주세요.";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return "redirect:companyinfo";
	}
	
	@RequestMapping("secession")
	public String updateMemberStatus(@ModelAttribute Member member,
									 @ModelAttribute(name="loginMember", binding=false) Member loginMember,
									 RedirectAttributes ra,
									 SessionStatus status) {
		
		member.setMemberNo(loginMember.getMemberNo());
		
		int result = service.updateMemberStatus(member);
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "회원 탈퇴가 완료되었습니다.";
			status.setComplete();
		}else if(result == 0) {
			swalIcon = "error";
			swalTitle = "현재 비밀번호를 확인해주세요.";
		}else{
			swalIcon = "error";
			swalTitle = "처리되지 않은 시승건이 존재합니다. 확인해주세요.";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return "redirect:companyinfo"; 
		
	}


}
