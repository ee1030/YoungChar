package com.kh.youngchar.company.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.company.model.vo.TestCars;

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

	/** 차량 추가 DAO
	 * @param map
	 * @return car
	 */
	public int addCar(Map<String, Object> map) {
		
		return sqlSession.insert("companyCarMapper.addCar", map);
	}

}
