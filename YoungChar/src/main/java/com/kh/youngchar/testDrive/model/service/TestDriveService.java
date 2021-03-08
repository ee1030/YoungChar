package com.kh.youngchar.testDrive.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.company.model.vo.TestCars;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.testDrive.model.dao.TestDriveDAO;
import com.kh.youngchar.testDrive.model.vo.CompanyMember;
import com.kh.youngchar.testDrive.model.vo.TestDrReservation;

@Service
public class TestDriveService {

	@Autowired
	private TestDriveDAO dao;

	/** 자동차 목록 불러오기
	 * @return cList
	 */
	public List<TestCars> selectCarList() {
		
		return dao.selectCarList();
	}

	/** 전국 대리점 목록 불러오기
	 * @return company
	 */
	public List<CompanyMember> companyList() {
		return dao.companyList();
	}
	
	/** 선택된 대리점 목록 불러오기
	 * @param carNo
	 * @return companyList
	 */
	public List<CompanyMember> selectCompanyList(int carNo) {
		return dao.selectCompanyList(carNo);
	}

	/** 예약 목록 조회
	 * @param memNo
	 * @return rList
	 */
	public List<TestDrReservation> selectReservation(int memNo) {
		
		return dao.selectReservation(memNo);
	}

	/** 예약목록들의 자동차 정보 가져오기
	 * @param rList
	 * @return cList
	 */
	public List<TestCars> selectRCarList(List<TestDrReservation> rList) {
		
		return dao.selectRCarList(rList);
	}

	/** 대리점 정보 가져오기
	 * @param rList
	 * @return comList
	 */
	public List<CompanyMember> selectRcompanyList(List<TestDrReservation> rList) {
		return dao.selectRcompanyList(rList);
	}

	/**시승 예약 취소
	 * @param reservationNo
	 * @return result
	 */
	public int cancleReservation(int reservationNo) {
		
		return  dao.cancleReservation(reservationNo);
	}

	
	
}
