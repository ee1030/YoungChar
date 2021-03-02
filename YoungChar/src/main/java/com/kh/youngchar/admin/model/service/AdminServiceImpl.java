package com.kh.youngchar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.admin.model.dao.AdminDAO;
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
}
