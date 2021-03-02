package com.kh.youngchar.testDrive.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.testDrive.model.vo.TestDrReservation;

@Repository
public class TestDriveDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<TestDrReservation> selectCarList() {
		return sqlSession.selectList("testDriveMapper.selectCarList");
	}
}
