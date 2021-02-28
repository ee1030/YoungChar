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
	
	/** 차량 추가 검색 Service
	 * @param carName
	 * @return cars
	 */
	public List<TestCars> carSearch(String carName) {
		
		return dao.carSearch(carName);
	}

	public List<TestCars> carList(Member loginMember) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 차량 추가 Service
	 * @param map
	 * @return car
	 */
	@Transactional(rollbackFor = Exception.class)
	public int addCar(Map<String, Object> map) {
		
		return dao.addCar(map);
	}

}
