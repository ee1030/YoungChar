package com.kh.youngchar.news.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.chargerCompany.model.vo.CompanyImage;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

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
	
	public List<News> selectRecentNewsList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("newsMapper.selectRecentNewsList", rowBounds);
	}
	
	


	public News selectNews(News temp) {
		return sqlSession.selectOne("newsMapper.selectNews", temp);
	}
	
	

	public List<NewsImage> selectCharNewsList(int newsNo) {
		return sqlSession.selectList("newsMapper.selectCharNewsList", newsNo);
	}



	public int selectNextNo() {
		return sqlSession.selectOne("newsMapper.selectNextNo");
	}



	public int insertNews(Map<String, Object> map) {
		return sqlSession.insert("newsMapper.insertNews", map);
	}



	public int insertNewsImageList(List<NewsImage> newsImages) {
		return sqlSession.insert("newsMapper.insertNewsImageList", newsImages);
	}



	public List<CompanyImage> selectThumbnailList(List<News> nList) {
		return sqlSession.selectList("newsMapper.selectThumbnailList", nList);
	}
	
	public List<CompanyImage> recentThumbnailList(List<News> recentList) {
		return sqlSession.selectList("newsMapper.recentThumbnailList", recentList);
	}
	



	public int increaseReadCount(int newsNo) {
		return sqlSession.update("newsMapper.increaseReadCount", newsNo);
	}
	
	
	



	public int updateNews(News updateNews) {
		return sqlSession.update("newsMapper.updateNews", updateNews);
	}



	public int updateNewsImage(NewsImage ni) {
		return sqlSession.update("newsMapper.updateNewsImage", ni);
	}



	public int insertNewsImage(NewsImage ni) {
		return sqlSession.insert("newsMapper.insertNewsImage", ni);
	}



	public int deleteNewsImage(int fileNo) {
		return sqlSession.delete("newsMapper.deleteNewsImage",fileNo);
	}



	public int deleteNews(News news) {
		return sqlSession.update("newsMapper.deleteNews", news);
	}



	



	


}
