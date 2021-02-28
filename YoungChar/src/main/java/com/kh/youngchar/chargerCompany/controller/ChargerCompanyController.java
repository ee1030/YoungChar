package com.kh.youngchar.chargerCompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/chargerCompany/*")
public class ChargerCompanyController {
	
	
	@RequestMapping("introduction")
	public String introduction () {
		return "chargerCompany/introduction";
	}

}
