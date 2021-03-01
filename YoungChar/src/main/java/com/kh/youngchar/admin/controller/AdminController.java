package com.kh.youngchar.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping("dashboard")
	public String adminDashboard() {
		return "admin/adminDashboard";
	}
	
	@RequestMapping("memberManagement")
	public String memberManagement() {
		return "admin/memberManagement";
	}
	
	@RequestMapping("newCompanyManagement")
	public String newCompanyManagement() {
		return "admin/newCompanyManagement";
	}
	
	@RequestMapping("allCompanyManagement")
	public String allCompanyManagement() {
		return "admin/allCompanyManagement";
	}
	
	@RequestMapping("allBoardManagement")
	public String allBoardManagement() {
		return "admin/allBoardManagement";
	}
	
	@RequestMapping("reviewBoardManagement")
	public String reviewBoardManagement() {
		return "admin/reviewBoardManagement";
	}
	
	@RequestMapping("infoBoardManagement")
	public String infoBoardManagement() {
		return "admin/infoBoardManagement";
	}
	
	@RequestMapping("freeBoardManagement")
	public String freeBoardManagement() {
		return "admin/freeBoardManagement";
	}
	
	@RequestMapping("replyManagement")
	public String replyManagement() {
		return "admin/replyManagement";
	}
	
	@RequestMapping("reportBoardManagement")
	public String reportBoardManagement() {
		return "admin/reportBoardManagement";
	}
	
	@RequestMapping("reportReplyManagement")
	public String reportReplyManagement() {
		return "admin/reportReplyManagement";
	}
	
	@RequestMapping("carDBManagement")
	public String carDBManagement() {
		return "admin/carDBManagement";
	}

}
