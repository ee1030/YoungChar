package com.kh.youngchar.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news/*")

public class NewsController {

//	@Autowired
//	private NewsService service;
//	
	@RequestMapping("newsMain")
	public String NewsMain() {
		return "news/newsMain";
	}
}
