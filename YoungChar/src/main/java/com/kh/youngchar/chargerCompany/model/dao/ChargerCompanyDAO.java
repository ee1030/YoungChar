package com.kh.youngchar.chargerCompany.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.chargerCompany.model.vo.CompanyImage;
import com.kh.youngchar.company.model.vo.PageInfo;

@Repository
public class ChargerCompanyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 업체 게시글 목록 조회
	 * @param cp
	 * @return
	 */
	public int getListCount(int cp) {
		return sqlSession.selectOne("chargerCompanyMapper.getListCount", cp);
	}

	
	/** 업체 게시글 페이징 처리
	 * @param pInfo
	 * @return
	 */
	public List<ChargerCompany> selectList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("chargerCompanyMapper.selectList", rowBounds);
	}
	

	/** 업체 게시글 조회
	 * @param temp
	 * @return
	 */
	public ChargerCompany selectCompany(ChargerCompany temp) {
		return sqlSession.selectOne("chargerCompanyMapper.selectCompany", temp);
	}

	
	/** 업체 게시글 목록 조회
	 * @param companyNo
	 * @return
	 */
	public List<ChargerCompany> selectChargerCompanyList(int companyNo) {
		return sqlSession.selectList("chargerCompanyMapper.selectChargerCompanyList", companyNo);
	}
	

	/** 다음 번호 조회
	 * @return
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("chargerCompanyMapper.selectNextNo");
	}

	
	/** 업체 게시글 등록
	 * @param map
	 * @return
	 */
	public int insertCompany(Map<String, Object> map) {
		return sqlSession.insert("chargerCompanyMapper.insertCompany", map);
	}


	public int insertchargerCompanyImagesList(List<CompanyImage> chargerCompanyImages) {
		return sqlSession.insert("chargerCompanyMapper.insertchargerCompanyImagesList", chargerCompanyImages);
	}


}
