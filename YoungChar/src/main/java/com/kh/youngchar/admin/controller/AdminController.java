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

}
