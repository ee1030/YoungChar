package com.kh.youngchar.home.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.home.model.service.HomeService;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		
		List<Cars> carList = service.selectList();
		List<News> mainNewsList = service.selectMainNews();
		
		if(carList != null) {
			List<CAttachment> thumbnailList = service.selectThumbnailList(carList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList" , thumbnailList);
			}
		}
		
		else if(mainNewsList != null) {
			List<NewsImage> mainThumbnailList = service.selectMainThumbnailList(mainNewsList);
			
			if(mainThumbnailList != null) {
				model.addAttribute("mainThList" , mainThumbnailList);
				
			}
		}
		
		model.addAttribute("carList" , carList);
		model.addAttribute("mainNewsList" , mainNewsList);
		
		
		
		
		
		
		
		return "index";
	}
	

	
}
