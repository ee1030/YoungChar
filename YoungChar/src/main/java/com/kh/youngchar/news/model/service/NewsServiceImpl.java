package com.kh.youngchar.news.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.news.model.dao.NewsDAO;
import com.kh.youngchar.news.model.vo.News;

@Service
public class NewsServiceImpl implements NewsService{
	
	@Autowired
	private NewsDAO dao;

	@Override
	public PageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount(cp);

		return new PageInfo(cp, listCount);
	}

	@Override
	public List<News> selectNewsList(PageInfo pInfo) {
		return dao.selectNewsList(pInfo);
	}

}
