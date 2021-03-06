package com.kh.youngchar.company.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.company.model.vo.TestCars;
import com.kh.youngchar.member.model.vo.Member;

@Repository
public class CompanyCarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 차량 추가 검색 DAO
	 * @param carName
	 * @return cars
	 */
	public List<TestCars> carSearch(String carName) {
		
		return sqlSession.selectList("companyCarMapper.carSearchList", carName);
	}

	/** 차량 있나 검색
	 * @param map
	 * @return result
	 */
	public int ex(Map<String, Object> map) {
		return sqlSession.selectOne("companyCarMapper.ex", map);
	}
	
	/** 추가하려는 차량이 db에 존재하는지 확인하는 DAO
	 * @param map
	 * @return exist
	 */
	public String carListEx(Map<String, Object> map) {
		return sqlSession.selectOne("companyCarMapper.carListEx", map);
	}

	/** 차량 목록 조회 DAO
	 * @param memNo
	 * @return
	 */
	public List<TestCars> carList(int memNo) {
		return sqlSession.selectList("companyCarMapper.carList", memNo);
	}


	/** 차량 추가 DAO
	 * @param map
	 * @return car
	 */
	public int addCar(Map<String, Object> map) {
		
		return sqlSession.insert("companyCarMapper.addCar", map);
	}
	
	/** 차량 삭제 DAO
	 * @param map
	 * @return result
	 */
	public int deleteCar(Map<String, Object> map) {
		return sqlSession.update("companyCarMapper.deleteCar", map);
	}


	/** 차량 상태 변경
	 * @param map
	 * @return result
	 */
	public int updateStatus(Map<String, Object> map) {
		return sqlSession.update("companyCarMapper.updateStatus", map);
	}

	/** 차량 이미지
	 * @param cList
	 * @return images
	 */
	public List<TestCars> carImages(List<TestCars> cList) {
		return sqlSession.selectList("companyCarMapper.carImages", cList);
	}


	
}
