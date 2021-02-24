package com.kh.youngchar.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/*")
public class CompanyController {
	
	@RequestMapping("dashboard")
	public String dashBoard() {
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
