package com.kh.youngchar.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	@RequestMapping("{newsNo}")
	public String NewsView(@PathVariable("newsNo") int newsNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		News news = service.selectNews(newsNo);

		String url = null;

		if (news != null) { // 상세 조회 성공 시

//			상세조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출 
			List<News> newsList = service.selectCharNewsList(newsNo);

//			조회된 이미지 목록이 있을 경우 
			if (newsList != null && !newsList.isEmpty()) {

				model.addAttribute("newsList", newsList);
			}

//			request scope로 board를 세팅한다.
			model.addAttribute("news", news);

			url = "news/newsPage";

		} else { // 상세 조회 실패 시

			if (referer == null) { // 이전 요청 주소가 없는 경우 (직접 주소를 적는 경우)

				url = "redirect:..";

			} else { // 이전 요청 주소가 있는 경우

				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않습니다.");

		}

		return url;
	}

	
	
	
	
}
