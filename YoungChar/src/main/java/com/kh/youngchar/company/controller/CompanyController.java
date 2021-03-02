package com.kh.youngchar.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.youngchar.company.model.service.DriveReviewService;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 관련 Controller
 * @author jeonga
 *
 */
@Controller
@RequestMapping("/company/*")
@SessionAttributes({"memberFile", "loginMember"})
public class CompanyController {
	
	@Autowired
	private DriveReviewService service;
	
	private Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@RequestMapping("dashboard")
	public String dashBoard(Model model,
							@ModelAttribute("loginMember") Member loginMember) {
		
		MemberFile memberFile = service.getCompanyProfile(loginMember.getMemberNo());
		
		if(memberFile != null) {
			model.addAttribute("memberFile", memberFile);
		}
		
		return "company/dashBoard";
	}
	@RequestMapping("applicationlist")
	public String applicationList() {
		return "company/applicationList";
	}
	@RequestMapping("companyinfo")
	public String companyInfo() {
		return "company/companyInfo";
	}


}
