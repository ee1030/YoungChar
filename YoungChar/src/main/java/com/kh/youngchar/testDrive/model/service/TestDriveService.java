package com.kh.youngchar.testDrive.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.testDrive.model.dao.TestDriveDAO;
import com.kh.youngchar.testDrive.model.vo.TestDrReservation;

@Service
public class TestDriveService {

	@Autowired
	private TestDriveDAO dao;

	/** 자동차 목록 불러오기
	 * @return cList
	 */
	public List<TestDrReservation> selectCarList() {
		
		return dao.selectCarList();
	}
	
	
}
