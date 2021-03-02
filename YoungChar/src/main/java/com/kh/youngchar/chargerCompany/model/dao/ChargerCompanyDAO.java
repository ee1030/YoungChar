package com.kh.youngchar.chargerCompany.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.company.model.vo.PageInfo;

@Repository
public class ChargerCompanyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(int cp) {
		return sqlSession.selectOne("chargerCompanyMapper.getListCount", cp);
	}

	public List<ChargerCompany> selectList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("chargerCompanyMapper.selectList", rowBounds);
	}


}
