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
	
	/** 차량 이미지
	 * @param cList
	 * @return images
	 */
	public List<TestCars> carImages(List<TestCars> cList) {
		return sqlSession.selectList("companyCarMapper.carImages", cList);
	}
	
	/**전국 대리점 목록 불러오기
	 * @return
	 */
	public List<CompanyMember> companyList() {
		return sqlSession.selectList("testDriveMapper.companyList");
	}

	/** 선택된 대리점 목록 불러오기
	 * @param carNo
	 * @return companyList
	 */
	public List<CompanyMember> selectCompanyList(int carNo) {
		return sqlSession.selectList("testDriveMapper.selectCompanyList", carNo);
	}

	/** 예약 목록 조회 
	 * @param memNo
	 * @return rList
	 */
	public List<TestDrReservation> selectReservation(int memNo) {
		return sqlSession.selectList("testDriveMapper.selectReservation", memNo);
	}

	/** 예약목록들의 자동차 정보 가져오기
	 * @param rList
	 * @return cList
	 */
	public List<TestCars> selectRCarList(List<TestDrReservation> rList) {
		
		return sqlSession.selectList("testDriveMapper.selectRCarList", rList);
	}
 
	/** 대리점 정보 가져오기
	 * @param rList
	 * @return comList
	 */
	public List<CompanyMember> selectRcompanyList(List<TestDrReservation> rList) {
		return sqlSession.selectList("testDriveMapper.selectRcompanyList", rList);
	}

	/** 시승 예약 취소
	 * @param reservationNo
	 * @return result
	 */
	public int cancleReservation(int reservationNo) {
		return sqlSession.update("testDriveMapper.cancleReservation", reservationNo);
	}

	/** 시승예약
	 * @param reservation
	 * @return result
	 */
	public int makeReservation(TestDrReservation reservation) {
		return sqlSession.insert("testDriveMapper.makeReservation",reservation);
	}


	/** 예약 정보 가져오기
	 * @param reservationNo
	 * @return rs
	 */
	public TestDrReservation getReservation(int reservationNo) {
		return sqlSession.selectOne("testDriveMapper.getReservation",reservationNo);
	}

	/** 예약 차 이미지 가졍괴
	 * @param rList
	 * @return cList
	 */
	public List<TestCars> selecCarImgs(List<TestDrReservation> rList) {
		return sqlSession.selectList("testDriveMapper.selectCarImgs", rList);
	}

}
