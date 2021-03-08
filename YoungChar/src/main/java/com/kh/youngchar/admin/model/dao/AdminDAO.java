package com.kh.youngchar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.board.model.vo.Reply;
import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/**
 * @author sksgu
 *
 */
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
	
	/** 신규 회원 목록 프로필 사진 조회 DAO
	 * @return
	 */
	public List<MemberFile> getNewMfList() {
		return sqlSession.selectList("adminMapper.getNewMfList");
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
	public int getBoardListCount(int type) {
		return sqlSession.selectOne("adminMapper.getBoardListCount", type);
	}

	/** 전체 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return bList
	 */
	public List<Board> getBoardList(PageInfo pInfo, int type) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectBoardList", type, rowBounds);
	}

	/** 모든 게시글 페이지 삭제 DAO
	 * @param chkList
	 * @return result
	 */
	public int allBoardDelete(List<String> chkList) {
		return sqlSession.update("adminMapper.allBoardDelete", chkList);
	}

	/** 모든 게시글 페이지 복구 DAO
	 * @param chkList
	 * @return result
	 */
	public int allBoardRestore(List<String> chkList) {
		return sqlSession.update("adminMapper.allBoardRestore", chkList);
	}
	
	/** 게시글 관리 검색 정보 조회 DAO
	 * @param map
	 * @return listCount
	 */
	public int getSearchBoardPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("adminMapper.getSearchBoardPageInfo", map);
	}
	

	/** 게시글 관리 검색 DAO
	 * @param pInfo
	 * @param map
	 * @return bList
	 */
	public List<Board> selectSearchBoard(PageInfo pInfo, Map<String, Object> map) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchBoard", map, rowBounds);
	}


	/** 차량 DB 목록 개수 조회 DAO
	 * @return listCount
	 */
	public int getCarsListCount() {
		return sqlSession.selectOne("adminMapper.getCarsListCount");
	}

	/** 차량 DB 목록 조회 DAO
	 * @param pInfo
	 * @return carList
	 */
	public List<Cars> selectCarsList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectCarsList", null, rowBounds);
	}

	/** 브랜드 리스트 조회 DAO
	 * @return brandList
	 */
	public List<Map<Integer, String>> selectBrandList() {
		return sqlSession.selectList("adminMapper.selectBrandList");
	}

	/** 다음 차량번호 조회 DAO
	 * @return carNo
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("adminMapper.selectNextNo");
	}

	/** 차량 등록 DAO
	 * @param cars
	 * @return result
	 */
	public int insertCar(Cars cars) {
		return sqlSession.insert("adminMapper.insertCar", cars);
	}

	/** 차량 이미지 등록 DAO
	 * @param uploadImages
	 * @return result
	 */
	public int insertAttachmentList(List<CAttachment> uploadImages) {
		return sqlSession.insert("adminMapper.insertAttachmentList", uploadImages);
	}

	/** 선택된 차량 정보 삭제 DAO
	 * @param chkList
	 * @return result
	 */
	public int selectedCarDelete(List<String> chkList) {
		return sqlSession.delete("adminMapper.selectedCarDelete", chkList);
	}

	/** 댓글 목록 페이지 정보 조회 DAO
	 * @return listCount
	 */
	public int getReplyListCount() {
		return sqlSession.selectOne("adminMapper.getReplyListCount");
	}

	/** 댓글 목록 조회 DAO
	 * @param pInfo
	 * @return rList
	 */
	public List<Reply> selectReplyList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectReplyList", null, rowBounds);
	}

	/** 선택된 댓글 삭제 DAO
	 * @param chkList
	 * @return result
	 */
	public int replyDelete(List<String> chkList) {
		return sqlSession.update("adminMapper.replyDelete", chkList);
	}

	/** 선택된 댓글 복구 DAO
	 * @param chkList
	 * @return result
	 */
	public int replyRestore(List<String> chkList) {
		return sqlSession.update("adminMapper.replyRestore", chkList);
	}

	/** 댓글 검색 페이징 정보 조회 DAO
	 * @param sv
	 * @return listCount
	 */
	public int getSearchReplyCount(String sv) {
		return sqlSession.selectOne("adminMapper.getSearchReplyCount", sv);
	}

	/** 댓글 검색 목록 조회 DAO
	 * @param pInfo
	 * @param sv
	 * @return rList
	 */
	public List<Reply> selectSearchReply(PageInfo pInfo, String sv) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchReply", sv, rowBounds);
	}

	/** 차량정보 수정용 데이터 조회 DAO
	 * @param carNo
	 * @return carInfo
	 */
	public Cars selectUpdateCar(int carNo) {
		return sqlSession.selectOne("adminMapper.selectUpdateCar", carNo);
	}

	/** 차량 정보 수정 DAO
	 * @param cars
	 * @return result
	 */
	public int updateCarAction(Cars cars) {
		return sqlSession.update("adminMapper.updateCarAction", cars);
	}

	/** 차량 정보 검색 결과 갯수 조회 DAO
	 * @param sv
	 * @return listCount
	 */
	public int getSearchCarCount(String sv) {
		return sqlSession.selectOne("adminMapper.getSearchCarCount", sv);
	}

	/** 차량 정보 검색 목록 조회 DAO
	 * @param pInfo
	 * @param sv
	 * @return carList
	 */
	public List<Cars> selectSearchCarInfo(PageInfo pInfo, String sv) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchCarInfo", sv, rowBounds);
	}

	/** 신고 게시글 갯수 조회 DAO
	 * @return lsitCount
	 */
	public int getRBCount() {
		return sqlSession.selectOne("adminMapper.getRBCount");
	}

	/** 신고 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return bList
	 */
	public List<Board> selectRBList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectRBList", null, rowBounds);
	}

	/** 신고 게시글 검색 목록 갯수 조회 DAO
	 * @param sv
	 * @return listCount
	 */
	public int getSearchRBCount(String sv) {
		return sqlSession.selectOne("adminMapper.getSearchRBCount", sv);
	}

	/** 신고 게시글 검색 목록 조회 DAO
	 * @param pInfo
	 * @param sv
	 * @return bList
	 */
	public List<Board> selectSearchRB(PageInfo pInfo, String sv) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectSearchRB", sv, rowBounds);
	}

	/** 디비에 저장된 모든 이미지 가져오기 DAO
	 * @return dbFileList
	 */
	public List<String> getDbList() {
		return sqlSession.selectList("adminMapper.getDbList");
	}

}
