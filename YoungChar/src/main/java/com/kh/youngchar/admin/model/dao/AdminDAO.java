package com.kh.youngchar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;

/**
 * @author sksgu
 *
 */
@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 신규 회원 수 조회 DAO
	 * @return newMember
	 */
	public int getNewMember() {
		return sqlSession.selectOne("adminMapper.getNewMember");
	}

	/** 신규 업체 수 조회 DAO
	 * @return newCompany
	 */
	public int getNewCompany() {
		return sqlSession.selectOne("adminMapper.getNewCompany");
	}

	/** 전체 게시글 수 조회 DAO
	 * @return allBoardCount
	 */
	public int getAllBoardCount() {
		return sqlSession.selectOne("adminMapper.getAllBoardCount");
	}

	/** 전체 시승 예약 건수 조회 DAO
	 * @return testDrive
	 */
	public int getTestDrive() {
		return sqlSession.selectOne("adminMapper.getTestDrive");
	}

	/** 신규 회원 목록 조회 DAO
	 * @return mList
	 */
	public List<Member> getNewMemList() {
		return sqlSession.selectList("adminMapper.getNewMemList");
	}

	/** 대시보드 차트 데이터 조회 DAO
	 * @return
	 */
	public List<Map<String, Integer>> getChartData() {
		return sqlSession.selectList("adminMapper.getChartData");
	}

	/** 회원관리 페이징 정보 조회 DAO
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	/** 전체 회원 목록 조회 DAO
	 * @param pInfo
	 * @return mList
	 */
	public List<Member> selectMemberList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}

	/** 선택 회원 탈퇴 DAO
	 * @param chkList
	 * @return result
	 */
	public int memberSecession(List<String> chkList) {
		return sqlSession.update("adminMapper.memberSecession", chkList);
	}
	
	/** 선택 회원 복구 DAO
	 * @param chkList
	 * @return result
	 */
	public int memberRestore(List<String> chkList) {
		return sqlSession.update("adminMapper.memberRestore", chkList);
	}

	/** 검색결과 페이징 정보 조회 DAO
	 * @param sv
	 * @return listCount
	 */
	public int getSearchListCount(String sv) {
		return sqlSession.selectOne("adminMapper.getSearchListCount", sv);
	}

	/** 회원 검색 결과 목록 조회 DAO
	 * @param pInfo
	 * @param sv
	 * @return mList
	 */
	public List<Member> selectSearchMember(PageInfo pInfo, String sv) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchMember", sv, rowBounds);
	}

	/** 신규 업체 승인 갯수 조회 DAO
	 * @return listCount
	 */
	public int getNewCompanyListCount() {
		return sqlSession.selectOne("adminMapper.getNewCompanyListCount");
	}

	/** 신규업체 승인 목록 조회 DAO
	 * @param pInfo
	 * @return cList
	 */
	public List<Member> selectNewCompanyList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectNewCompanyList", null, rowBounds);
	}

	/** 선택된 신규업체 승인 DAO
	 * @param chkList
	 * @return result
	 */
	public int newCompanyApproval(List<String> chkList) {
		return sqlSession.update("adminMapper.newCompanyApproval", chkList);
	}

	/** 신규 업체 승인 목록 갯수 조회 DAO
	 * @param sv
	 * @return listCount
	 */
	public int getSearchNCListCount(String sv) {
		return sqlSession.selectOne("adminMapper.getSearchNCListCount", sv);
	}

	/** 신규 업체 승인 목록 조회 DAO
	 * @param pInfo
	 * @param sv
	 * @return cList
	 */
	public List<Member> selectSearchNewCom(PageInfo pInfo, String sv) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchNewCom", sv, rowBounds);
	}

	/** 모든 업체 갯수 조회 DAO
	 * @return listCount
	 */
	public int getAllCompanyListCount() {
		return sqlSession.selectOne("adminMapper.getAllCompanyListCount");
	}

	/** 모든 업체 목록 조회 DAO
	 * @param pInfo
	 * @return cList
	 */
	public List<Member> selectAllCompanyList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectAllCompanyList", null, rowBounds);
	}

	/** 모든 업체 페이지 선택 승인 DAO
	 * @param chkList
	 * @return result
	 */
	public int allCompanyApproval(List<String> chkList) {
		return sqlSession.update("adminMapper.allCompanyApproval", chkList);
	}

	/** 모든 업체 페이지 선택 승인 취소 DAO
	 * @param chkList
	 * @return result
	 */
	public int allCompanyCancellation(List<String> chkList) {
		return sqlSession.update("adminMapper.allCompanyCancellation", chkList);
	}

	/** 모든 업체 검색 목록 갯수 조회 DAO
	 * @param sv
	 * @return listCount
	 */
	public int getSearchACListCount(String sv) {
		return sqlSession.selectOne("adminMapper.getSearchACListCount", sv);
	}

	/** 모든 업체 검색 목록 조회 DAO
	 * @param pInfo
	 * @param sv
	 * @return cList
	 */
	public List<Member> selectSearchAllCom(PageInfo pInfo, String sv) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchAllCom", sv, rowBounds);
	}

	/** 전체 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int getAllBoardListCount() {
		return sqlSession.selectOne("adminMapper.getAllBoardListCount");
	}

	/** 전체 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return bList
	 */
	public List<Board> selectAllBoardList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectAllBoardList", null, rowBounds);
	}
}
