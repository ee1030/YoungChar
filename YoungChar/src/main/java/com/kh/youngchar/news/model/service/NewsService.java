package com.kh.youngchar.news.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

@Service
public interface NewsService {

	PageInfo getPageInfo(int cp);

	List<News> selectNewsList(PageInfo pInfo);
	List<News> selectRecentNewsList(PageInfo pInfo);
	

	News selectNews(int newsNo);
	
	

	List<NewsImage> selectCharNewsList(int newsNo);
	
	

	int insertNews(Map<String, Object> map, List<MultipartFile> images, String savePath);
	
	

	List<NewsImage> selectThumbnailList(List<News> nList);
	List<NewsImage> recentThumbnailList(List<News> recentList);
	List<NewsImage> selectMainThumbnailList(List<News> mainNewsList);
	
	

	NewsImage insertImage(MultipartFile uploadFile, String savePath);

	int updateNews(News updateNews, List<MultipartFile> images, String savePath, boolean[] deleteImages);
	
	

	int deleteNews(News news);

	List<News> selectMainNews();

	List<News> selectOldestNewsList(PageInfo pInfo);

	List<News> selectBestNewsList(PageInfo pInfo);

	List<News> selectWorstNewsList(PageInfo pInfo);




}
