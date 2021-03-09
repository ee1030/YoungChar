package com.kh.youngchar.cars.model.dao;

import java.util.List;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;

@Repository
public class CarsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 차량 조회 페이지 네이션 
	 * @return
	 */
	public int getCarListCount() {
		return sqlSession.selectOne("carsMapper.getCarListCount");
	}

	/** 차량 리스트 조회
	 * @param pInfo
	 * @return
	 */
	public List<Cars> selectCarList(PageInfo2 pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("carsMapper.selectCarList", null, rowBounds);
		
	}

	/** 차량 상세 조회
	 * @param carNo
	 * @return
	 */
	public Cars selectCar(int carNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("carsMapper.selectCar", carNo);
	}

	/** 썸네일 조회
	 * @param carInfo
	 * @return
	 */
	public List<CAttachment> selectThumbnailList(List<Cars> carList) {
		return sqlSession.selectList("carsMapper.selectThumbnailList" , carList);
	}

	/** 상세 조회 시 이미지 목록 조회
	 * @param carNo
	 * @return
	 */
	public List<CAttachment> selectAttachmentList(int carNo) {
		return sqlSession.selectList("carsMapper.selectAttachmentList" , carNo);
	}

	/** 검색 차량 1 
	 * @param carNo1
	 * @return
	 */
	public Cars selectSearchCar1(int carNo1) {
		return sqlSession.selectOne("carsMapper.selectSearchCar1",carNo1);
	}

	/** 검색 차량 2
	 * @param carNo2
	 * @return
	 */
	public Cars selectSearchCar2(int carNo2) {
		return sqlSession.selectOne("carsMapper.selectSearchCar2",carNo2);
	}

	/** 검색 차량 이미지 1
	 * @param carNo1
	 * @return
	 */
	public List<CAttachment> selectAtList1(int carNo1) {
		return sqlSession.selectList("carsMapper.selectAtList1", carNo1);
	}

	/** 검색 차량 이미지 2
	 * @param carNo2
	 * @return
	 */
	public List<CAttachment> selectAtList2(int carNo2) {
		return sqlSession.selectList("carsMapper.selectAtList1", carNo2);

	}

	/** 검색 페이지 인포
	 * @param search
	 * @return
	 */
	public int getListCount(Search search) {
		
		return sqlSession.selectOne("carsMapper.getListCount" , search);
	}

	/** 카테고리 검색 조회
	 * @param search
	 * @param pInfo
	 * @return
	 */
	public List<Cars> selectCarList2(Search search, PageInfo2 pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = null;
		rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		
		return sqlSession.selectList("carsMapper.selectCarList2",search , rowBounds);
	}

	public List<Cars> selectList() {
		return sqlSession.selectList("carsMapper.selectList");
	}

}
