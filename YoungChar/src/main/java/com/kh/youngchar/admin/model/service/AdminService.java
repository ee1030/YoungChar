package com.kh.youngchar.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.board.model.vo.Reply;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

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
	
	/** 신규 회원 목록 프로필 사진 조회 Service
	 * @return mfList
	 */
	public abstract List<MemberFile> getNewMfList();

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

	/** 신규 업체 승인 페이징 정보 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getNewComPageInfo(int cp);

	/** 신규 업체 승인 목록 조회 Service
	 * @param pInfo
	 * @return cList
	 */
	public abstract List<Member> selectNewCompanyList(PageInfo pInfo);

	/** 선택된 신규업체 승인 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int newCompanyApproval(List<String> chkList);

	/** 신규 업체 승인 검색 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @return pInfo
	 */
	public abstract PageInfo getSearchNewComPageInfo(int cp, String sv);

	/** 신규 업체 승인 검색 목록 조회 Service
	 * @param pInfo
	 * @param sv
	 * @return cList
	 */
	public abstract List<Member> selectSearchNewCom(PageInfo pInfo, String sv);

	/** 모든 업체 페이징 정보 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getAllComPageInfo(int cp);

	/** 모든 업체 목록 조회 Service
	 * @param pInfo
	 * @return cList
	 */
	public abstract List<Member> selectAllCompanyList(PageInfo pInfo);

	/** 모든 업체 페이지 선택 승인 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int allCompanyApproval(List<String> chkList);

	/** 모든 업체 페이지 선택 승인 취소 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int allCompanyCancellation(List<String> chkList);
	
	/** 모든 업체 검색 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @return pInfo
	 */
	public abstract PageInfo getSearchAllComPageInfo(int cp, String sv);

	/** 모든 업체 검색 목록 조회 Service
	 * @param pInfo
	 * @param sv
	 * @return cList
	 */
	public abstract List<Member> selectSearchAllCom(PageInfo pInfo, String sv);

	/** 모든 게시글 관리페이지 페이징 정보 조회 Service
	 * @param cp
	 * @param type 
	 * @return pInfo
	 */
	public abstract PageInfo getBoardPageInfo(int cp, int type);

	/** 모든 게시글 목록 조회 Service
	 * @param pInfo
	 * @param type 
	 * @return bList
	 */
	public abstract List<Board> selectBoardList(PageInfo pInfo, int type);

	/** 모든 게시글 페이지 삭제 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int allBoardDelete(List<String> chkList);

	/** 모든 게시글 페이지 복구 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int allBoardRestore(List<String> chkList);

	/** 차량 DB 목록 페이징 정보 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getCarsPageInfo(int cp);

	/** 차량 DB 목록 조회 Service
	 * @param pInfo
	 * @return carList
	 */
	public abstract List<Cars> selectCarsList(PageInfo pInfo);

	/** 브랜드 리스트 조회 Service
	 * @return brandList
	 */
	public abstract List<Map<Integer, String>> selectBrandList();

	/** 차량 등록 Service
	 * @param cars
	 * @return result
	 */
	public abstract int insertCar(Cars cars);

	/** 차량 이미지 삽입 Service
	 * @param result
	 * @param carImgs
	 * @param savePath
	 * @return result
	 */
	public abstract int insertImages(int result, List<MultipartFile> carImgs, String savePath);

	/** 선택된 차량정보 삭제 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int selectedCarDelete(List<String> chkList);

	/** 게시글 관리 검색 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @param type
	 * @return pInfo
	 */
	public abstract PageInfo getSearchBoardPageInfo(int cp, Map<String, Object> map);

	/** 게시글 관리 검색 Serivce
	 * @param pInfo
	 * @param sv
	 * @param type
	 * @return bList
	 */
	public abstract List<Board> selectSearchBoard(PageInfo pInfo, Map<String, Object> map);

	/** 댓글 목록 페이징 정보 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getReplyPageInfo(int cp);

	/** 댓글 목록 조회 Service
	 * @param pInfo
	 * @return rList
	 */
	public abstract List<Reply> selectReplyList(PageInfo pInfo);

	/** 선택된 댓글 삭제 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int replyDelete(List<String> chkList);

	/** 선택된 댓글 복구 Service
	 * @param chkList
	 * @return result
	 */
	public abstract int replyRestore(List<String> chkList);
	
	/** 댓글 관리 검색 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @param type
	 * @return pInfo
	 */
	public abstract PageInfo getSearchReplyPageInfo(int cp, String sv);

	/** 댓글 관리 검색 Serivce
	 * @param pInfo
	 * @param sv
	 * @param type
	 * @return rList
	 */
	public abstract List<Reply> selectSearchReply(PageInfo pInfo, String sv);

	/** 차량정보 수정용 데이터 조회 Service
	 * @param carNo
	 * @return carInfo
	 */
	public abstract Cars selectUpdateCar(int carNo);

	/** 차량 정보 수정 Service
	 * @param cars
	 * @return result
	 */
	public abstract int updateCarAction(Cars cars);

	/** 차량 정보 검색 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @return pInfo
	 */
	public abstract PageInfo getSearchCarPageInfo(int cp, String sv);

	/** 차량 정보 검색 목록 조회 Service
	 * @param pInfo
	 * @param sv
	 * @return carList
	 */
	public abstract List<Cars> selectSearchCarInfo(PageInfo pInfo, String sv);

	/** 신고 게시글 목록 페이징 정보 조회 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getRBPageInfo(int cp);

	/** 신고 게시글 목록 조회 Service
	 * @param pInfo
	 * @return bList
	 */
	public abstract List<Board> selectRBList(PageInfo pInfo);
	
	/** 신고 게시글 관리 검색 페이징 정보 조회 Service
	 * @param cp
	 * @param sv
	 * @return pInfo
	 */
	public abstract PageInfo getSearchRBPageInfo(int cp, String sv);

	/** 신고 게시글 관리 검색 Serivce
	 * @param pInfo
	 * @param sv
	 * @return bList
	 */
	public abstract List<Board> selectSearchRB(PageInfo pInfo, String sv);

	/** 디비에 저장된 모든 이미지 조회
	 * @return dbFileList
	 */
	public abstract List<String> getDbList();

	/** 신고 게시글 내용 조회
	 * @param boardNo
	 * @return board
	 */
	public abstract Board selectReportBoard(int boardNo);


	

}
