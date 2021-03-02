package com.kh.youngchar.company.controller;

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

import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.PageInfo;
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
	private CompanyService service;
	
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


}
