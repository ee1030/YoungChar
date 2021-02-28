package com.kh.youngchar.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.member.model.vo.MemberFile;

@Controller
@RequestMapping("/carCompany/*")
public class CarController {
	
	
	@RequestMapping("carView")
	   public String carView() {
	      return "company/carManagement";
	  }
	
	

}
