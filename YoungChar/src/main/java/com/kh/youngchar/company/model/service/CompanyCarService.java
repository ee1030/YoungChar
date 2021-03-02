package com.kh.youngchar.company.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youngchar.company.model.dao.CompanyCarDAO;
import com.kh.youngchar.company.model.vo.TestCars;
import com.kh.youngchar.member.model.vo.Member;

@Service
public class CompanyCarService {

	@Autowired
	private CompanyCarDAO dao;
	
	/** 차량 목록 조회 Service
	 * @param memNo
	 * @return cList
	 */
	public List<TestCars> carList(int memNo) {
		return dao.carList(memNo);
	}
	
	/** 차량 추가 검색 Service
	 * @param carName
	 * @return cars
	 */
	public List<TestCars> carSearch(String carName) {
		return dao.carSearch(carName);
	}


	/** 차량 추가 Service
	 * @param map
	 * @return car
	 */
	@Transactional(rollbackFor = Exception.class)
	public int addCar(Map<String, Object> map) {
		
		return dao.addCar(map);
	}

	/** 추가하려는 차량이 db에 존재하는지 확인하는 Service
	 * @param map
	 * @return exist
	 */
	public int carListEx(Map<String, Object> map) {
		return dao.carListEx(map);
	}

	/** 차량 삭제 Service
	 * @param map
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	public int deleteCar(Map<String, Object> map) {
		return dao.deleteCar(map);
	}

}
