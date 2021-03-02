package com.kh.youngchar.admin.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.youngchar.admin.model.service.AdminService;
import com.kh.youngchar.admin.model.vo.ChartData;
import com.kh.youngchar.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 관리자 대시보드로 이동
	@RequestMapping("dashboard")
	public String adminDashboard(Model model) {
		
		// 서비스 아이템 부분
		int newMember = service.getNewMember();
		int newCompany = service.getNewCompany();
		int allBoardCount = service.getAllBoardCount();
		int testDrive = service.getTestDrive();
		
		List<Member> mList = service.getNewMemList();
		List<ChartData> cList = service.getChartData();
		
		model.addAttribute("newMember", newMember);
		model.addAttribute("newCompany", newCompany);
		model.addAttribute("allBoardCount", allBoardCount);
		model.addAttribute("testDrive", testDrive);
		
		model.addAttribute("mList", mList);
		
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
