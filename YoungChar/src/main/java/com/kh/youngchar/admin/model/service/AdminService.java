package com.kh.youngchar.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;

public interface AdminService {

	
	/** 신규 회원 수 조회 Service
	 * @return newMember
	 */
	public abstract int getNewMember();

	/** 신규 업체 수 조회 Service
	 * @return newCompany
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
	public abstract List<Map<String, Integer>> getChartData();

	/** 회원관리 페이징 정보 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getPageInfo(int cp);

	/** 전체 회원 목록 조회 Service
	 * @param pInfo
	 * @return mList
	 */
	public abstract List<Member> selectMemberList(PageInfo pInfo);

	/** 선택 회원 탈퇴 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int memberSecession(List<String> chkList);
	
	/** 선택 회원 복구 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int memberRestore(List<String> chkList);

	/** 회원 검색 결과 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @return pInfo
	 */
	public abstract PageInfo getSearchMemPageInfo(int cp, String sv);

	/** 회원 검색 결과 조회 Service
	 * @param pInfo
	 * @param sv
	 * @return mList
	 */
	public abstract List<Member> selectSearchMember(PageInfo pInfo, String sv);

}
