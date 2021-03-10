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
import com.kh.youngchar.news.model.vo.NewsImage;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/news/*")
public class RecentNewsController {
	
	@Autowired
	private NewsService service;

	@RequestMapping("recentNews")
	public String RecentNews(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {

		PageInfo pInfo = service.getPageInfo(cp);

		List<News> recentList = service.selectRecentNewsList(pInfo);


		if(recentList != null && !recentList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<NewsImage> recentThumbnailList = service.recentThumbnailList(recentList);

			if (recentThumbnailList != null) {
				model.addAttribute("recentThList", recentThumbnailList);
			}

		}

		model.addAttribute("recentList", recentList);
		model.addAttribute("pInfo", pInfo);

		return "news/recentNews";
	}

}
