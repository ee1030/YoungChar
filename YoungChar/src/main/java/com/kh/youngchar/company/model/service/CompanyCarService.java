package com.kh.youngchar.company.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.company.model.dao.CompanyCarDAO;
import com.kh.youngchar.company.model.vo.TestCars;

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

}
