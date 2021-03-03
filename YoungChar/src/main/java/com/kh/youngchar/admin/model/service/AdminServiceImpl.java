package com.kh.youngchar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youngchar.admin.model.dao.AdminDAO;
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
}
