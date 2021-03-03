package com.kh.youngchar.testDrive.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.company.model.vo.TestCars;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.testDrive.model.vo.CompanyMember;
import com.kh.youngchar.testDrive.model.vo.TestDrReservation;

@Repository
public class TestDriveDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	/**자동차 목록 불러오기
	 * @return cList
	 */
	public List<TestCars> selectCarList() {
		return sqlSession.selectList("testDriveMapper.selectCarList");
	}

	/**대리점 목록 불러오기
	 * @param carNo
	 * @return companyList
	 */
	public List<CompanyMember> selectCompanyList(int carNo) {
		return sqlSession.selectList("testDriveMapper.selectCompanyList", carNo);
	}
}
