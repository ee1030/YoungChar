package com.kh.youngchar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youngchar.admin.model.dao.AdminDAO;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	// 신규 회원 수 조회 Service 구현
	@Override
	public int getNewMember() {
		return dao.getNewMember();
	}

	// 신규 업체 수 조회 Service 구현
	@Override
	public int getNewCompany() {
		return dao.getNewCompany();
	}

	// 전체 게시글 수 조회 Service 구현
	@Override
	public int getAllBoardCount() {
		return dao.getAllBoardCount();
	}

	// 전체 시승 예약 건수 조회 Service 구현
	@Override
	public int getTestDrive() {
		return dao.getTestDrive();
	}

	// 신규 회원 목록 조회 Service 구현
	@Override
	public List<Member> getNewMemList() {
		return dao.getNewMemList();
	}

	// 대시보드 차트 데이터 조회 Service 구현
	@Override
	public List<Map<String, Integer>> getChartData() {
		return dao.getChartData();
	}

	// 회원관리 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		return new PageInfo(cp, listCount);
	}

	// 전체 회원 목록 조회 Service 구현
	@Override
	public List<Member> selectMemberList(PageInfo pInfo) {
		return dao.selectMemberList(pInfo);
	}

	// 선택 회원 탈퇴 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberSecession(List<String> chkList) {
		return dao.memberSecession(chkList);
	}
	
	// 선택 회원 복구 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberRestore(List<String> chkList) {
		return dao.memberRestore(chkList);
	}

	// 회원 검색 결과 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchMemPageInfo(int cp, String sv) {
		int listCount = dao.getSearchListCount(sv);
		return new PageInfo(cp, listCount);
	}

	// 회원 검색 결과 조회 Service 구현
	@Override
	public List<Member> selectSearchMember(PageInfo pInfo, String sv) {
		return dao.selectSearchMember(pInfo, sv);
	}

	// 신규 업체 승인 페이징 정보 조회 Service
	@Override
	public PageInfo getNewComPageInfo(int cp) {
		int listCount = dao.getNewCompanyListCount();
		
		return new PageInfo(cp, listCount);
		
	}

	// 신규 업체 승인 목록 조회 Service
	@Override
	public List<Member> selectNewCompanyList(PageInfo pInfo) {
		return dao.selectNewCompanyList(pInfo);
	}

	// 선택된 신규업체 승인 Service 구현
	@Override
	public int newCompanyApproval(List<String> chkList) {
		return dao.newCompanyApproval(chkList);
	}

	// 신규 업체 승인 검색 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchNewComPageInfo(int cp, String sv) {
		int listCount = dao.getSearchNCListCount(sv);
		return new PageInfo(cp, listCount);
	}

	// 신규 업체 승인 검색 목록 조회 Service 구현
	@Override
	public List<Member> selectSearchNewCom(PageInfo pInfo, String sv) {
		return dao.selectSearchNewCom(pInfo, sv);
	}

	// 모든 업체 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getAllComPageInfo(int cp) {
		int listCount = dao.getAllCompanyListCount();
		
		return new PageInfo(cp, listCount);
	}

	// 모든 업체 목록 조회 Service 구현
	@Override
	public List<Member> selectAllCompanyList(PageInfo pInfo) {
		return dao.selectAllCompanyList(pInfo);
	}

	// 모든 업체 페이지 선택 승인 Service 구현
	@Override
	public int allCompanyApproval(List<String> chkList) {
		return dao.allCompanyApproval(chkList);
	}

	// 모든 업체 페이지 선택 승인 취소 Service 구현
	@Override
	public int allCompanyCancellation(List<String> chkList) {
		return dao.allCompanyCancellation(chkList);
	}

	// 모든 업체 검색 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchAllComPageInfo(int cp, String sv) {
		int listCount = dao.getSearchACListCount(sv);
		return new PageInfo(cp, listCount);
	}

	// 모든 업체 검색 목록 조회 Service 구현
	@Override
	public List<Member> selectSearchAllCom(PageInfo pInfo, String sv) {
		return dao.selectSearchAllCom(pInfo, sv);
	}

	// 모든 게시글 관리페이지 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getAllBoardPageInfo(int cp) {
		int listCount = dao.getAllBoardListCount();
		
		return new PageInfo(cp, listCount);
	}

	// 모든 게시글 목록 조회 Service 구현
	@Override
	public List<Board> selectAllBoardList(PageInfo pInfo) {
		return dao.selectAllBoardList(pInfo);
	}
	
	// 모든 게시글 페이지 삭제 Service 구현
	@Override
	public int allBoardDelete(List<String> chkList) {
		return dao.allBoardDelete(chkList);
	}

	// 모든 게시글 페이지 복구 Service 구현
	@Override
	public int allBoardRestore(List<String> chkList) {
		return dao.allBoardRestore(chkList);
	}

	// 차량 DB 목록 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getCarsPageInfo(int cp) {
		int listCount = dao.getCarsListCount();
		
		return new PageInfo(cp, listCount);
	}

	// 차량 DB 목록 조회 Service 구현
	@Override
	public List<Cars> selectCarsList(PageInfo pInfo) {
		return dao.selectCarsList(pInfo);
	}

	// 브랜드 리스트 조회 Service 구현
	@Override
	public List<Map<Integer, String>> selectBrandList() {
		return dao.selectBrandList();
	}

	// 차량 등록 Service 구현
	@Override
	public int insertCar(Cars cars) {
		int result = 0;
		
		int carNo = dao.selectNextNo();
		
		if(carNo > 0) {
			cars.setCarNo(carNo);
			
			result = dao.insertCar(cars);
			
			if(result > 0) {
				carNo = result;
			}
		}
		
		return result;
	}
	
	
}
