package com.kh.youngchar.cars.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.PageInfo2;
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

}
