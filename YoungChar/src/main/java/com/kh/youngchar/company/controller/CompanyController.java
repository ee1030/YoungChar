package com.kh.youngchar.company.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.youngchar.company.model.service.DriveReviewService;
import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 관련 Controller
 * @author jeonga
 *
 */
@Controller
@RequestMapping("/company/*")
@SessionAttributes({"memberFile"})
public class CompanyController {
	
	@Autowired
	private DriveReviewService service;
	
	private Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@RequestMapping("dashboard")
	public String dashBoard(Model model) {
		
		MemberFile memberFile = service.getCompanyProfile(2);
		// 파라미터 memNo 으로 수정 필요
		
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
