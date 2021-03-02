package com.kh.youngchar.chargerCompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.youngchar.chargerCompany.model.service.ChargerCompanyService;
import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.company.model.vo.PageInfo;

@Controller
@RequestMapping("/chargerCompany/*")
public class ChargerCompanyController {
	@Autowired
	private ChargerCompanyService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("introduction")
	public String chargerCompanyList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
										Model model) {
		
		PageInfo pInfo = service.getPageInfo(cp);
		
		List<ChargerCompany> cList = service.selectList(pInfo);
		
		model.addAttribute("cList", cList);
		model.addAttribute("pInfo", pInfo);

		return "chargerCompany/introduction";
	}

}
