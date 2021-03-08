package com.kh.youngchar.news.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.news.model.vo.News;

@Repository
public class NewsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(int cp) {
		return sqlSession.selectOne("newsMapper.getListCount", cp);
	}
	
	
	
	public List<News> selectNewsList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("newsMapper.selectNewsList", rowBounds);
	}
	
	


	public News selectNews(News temp) {
		return sqlSession.selectOne("newsMapper.selectNews", temp);
	}
	
	

	public List<News> selectCharNewsList(int newsNo) {
		return sqlSession.selectList("newsMapper.selectCharNewsList", newsNo);
	}


}
