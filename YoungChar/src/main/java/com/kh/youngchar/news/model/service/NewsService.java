package com.kh.youngchar.news.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.news.model.vo.News;

@Service
public interface NewsService {

	PageInfo getPageInfo(int cp);

	List<News> selectNewsList(PageInfo pInfo);

}
