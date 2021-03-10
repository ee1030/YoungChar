package com.kh.youngchar.home.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.home.model.dao.HomeDAO;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeDAO dao;
	
	@Override
	public List<Cars> selectList() {
		return dao.selectList();
	}
	
	@Override
	public List<CAttachment> selectThumbnailList(List<Cars> carList) {
		return dao.selectThumbnailList(carList);
	}

	@Override
	public List<News> selectMainNews() {
		return dao.selectMainNews();
	}

	@Override
	public List<NewsImage> selectMainThumbnailList(List<News> mainNewsList) {
		return dao.selectMainThumbnailList(mainNewsList);
	}
	

}
