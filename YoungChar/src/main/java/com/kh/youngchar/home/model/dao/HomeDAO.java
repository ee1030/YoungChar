package com.kh.youngchar.home.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Cars> selectList() {
		return sqlSession.selectList("carsMapper.selectList");
	}

	public List<CAttachment> selectThumbnailList(List<Cars> carList) {
		
		return sqlSession.selectList("carsMapper.selectThumbnailList" , carList);
	}

	public List<News> selectMainNews() {
		return sqlSession.selectList("newsMapper.selectMainNews");
	}

	public List<NewsImage> selectMainThumbnailList(List<News> mainNewsList) {
		return sqlSession.selectList("newsMapper.selectMainThumbnailList" , mainNewsList);
	}
	
	
}
