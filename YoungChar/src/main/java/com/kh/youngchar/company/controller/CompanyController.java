package com.kh.youngchar.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.member.model.vo.MemberFile;

@Controller
@RequestMapping("/company/*")
@SessionAttributes({"memberFile"})
public class CompanyController {
	
	@Autowired
	CompanyService service;
	
	@RequestMapping("dashboard")
	public String dashBoard(Model model) {
		
		MemberFile memberFile = service.getMemberFile(1);
		
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
	@RequestMapping("insertreview")
	public String insertReview() {
		return "company/insertReview";
	}
	@RequestMapping("reviewview")
	public String reviewView() {
		return "company/reviewView";
	}
	@RequestMapping("reviewlist")
	public String reviewList() {
		return "company/reviewList";
	}

}
