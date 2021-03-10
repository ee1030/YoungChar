package com.kh.youngchar.home.model.service;

import java.util.List;

import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

public interface HomeService {

	List<Cars> selectList();

	List<CAttachment> selectThumbnailList(List<Cars> carList);

	List<News> selectMainNews();

	List<NewsImage> selectMainThumbnailList(List<News> mainNewsList);

}
