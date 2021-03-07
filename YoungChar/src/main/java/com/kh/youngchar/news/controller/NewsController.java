package com.kh.youngchar.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.news.model.service.NewsService;
import com.kh.youngchar.news.model.vo.News;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/news/*")
public class NewsController {

	@Autowired
	private NewsService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("newsMain")
	public String NewsMain(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {

		PageInfo pInfo = service.getPageInfo(cp);

		List<News> nList = service.selectNewsList(pInfo);

//		if (nList != null && !nList.isEmpty()) { // 게시글 목록 조회 성공 시
//			List<CompanyImage> thumbnailList = service.selectThumbnailList(nList);
//
//			if (thumbnailList != null) {
//				model.addAttribute("thList", thumbnailList);
//			}
//
//		}

		model.addAttribute("nList", nList);
		model.addAttribute("pInfo", pInfo);

		return "news/newsMain";
	}
	
	
	
	
}
