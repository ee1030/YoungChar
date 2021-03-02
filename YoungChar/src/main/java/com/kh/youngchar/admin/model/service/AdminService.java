package com.kh.youngchar.admin.model.service;

import java.util.List;

import com.kh.youngchar.admin.model.vo.ChartData;
import com.kh.youngchar.member.model.vo.Member;

public interface AdminService {

	
	/** 신규 회원 수 조회 Service
	 * @return newMember
	 */
	public abstract int getNewMember();

	/** 신규 업체 수 조회 Service
	 * @return
	 */
	public abstract int getNewCompany();

	/** 전체 게시글 수 조회 Service
	 * @return allBoardCount
	 */
	public abstract int getAllBoardCount();

	/** 전체 시승 예약 건수 조회 Service
	 * @return testDrive
	 */
	public abstract int getTestDrive();

	/** 신규 회원 목록 조회 Service
	 * @return mList
	 */
	public abstract List<Member> getNewMemList();

	/** 대시보드 차트 데이터 조회 Service
	 * @return cList
	 */
	public abstract List<ChartData> getChartData();

}
