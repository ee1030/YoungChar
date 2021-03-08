package com.kh.youngchar.admin.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.admin.model.dao.AdminDAO;
import com.kh.youngchar.board.model.exception.InsertAttachmentFailException;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.board.model.vo.Reply;
import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

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
	
	// 신규 회원 목록 프로필사진 조회 Service 구현
	@Override
	public List<MemberFile> getNewMfList() {
		return dao.getNewMfList();
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
	@Transactional(rollbackFor = Exception.class)
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int allCompanyApproval(List<String> chkList) {
		return dao.allCompanyApproval(chkList);
	}

	// 모든 업체 페이지 선택 승인 취소 Service 구현
	@Transactional(rollbackFor = Exception.class)
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
	public PageInfo getBoardPageInfo(int cp, int type) {
		int listCount = dao.getBoardListCount(type);
		
		return new PageInfo(cp, listCount);
	}

	// 모든 게시글 목록 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Board> selectBoardList(PageInfo pInfo, int type) {
	
		return dao.getBoardList(pInfo, type);
	}
	
	// 모든 게시글 페이지 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int allBoardDelete(List<String> chkList) {
		return dao.allBoardDelete(chkList);
	}

	// 모든 게시글 페이지 복구 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int allBoardRestore(List<String> chkList) {
		return dao.allBoardRestore(chkList);
	}

	// 게시글 관리 검색 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchBoardPageInfo(int cp, Map<String, Object> map) {
		int listCount = dao.getSearchBoardPageInfo(map);
		
		return new PageInfo(cp, listCount);
	}

	// 게시글 관리 검색 Service 구현
	@Override
	public List<Board> selectSearchBoard(PageInfo pInfo, Map<String, Object> map) {
		return dao.selectSearchBoard(pInfo, map);
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertCar(Cars cars) {
		int result = 0;
		
		int carNo = dao.selectNextNo();
		
		if(carNo > 0) {
			cars.setCarNo(carNo);
			
			result = dao.insertCar(cars);
			
			if(result > 0) {
				result = carNo;
			}
		}
		
		return result;
	}

	// 차량 이미지 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertImages(int result, List<MultipartFile> carImgs, String savePath) {
		
		int carNo = result;
		
		List<CAttachment> uploadImages = new ArrayList<CAttachment>();
		
		String filePath = "/resources/carImages";
		
		for(int i = 0; i < carImgs.size(); i++) {
			// i == 인덱스 == fileLevel과 같은 값
			
			// 현재 접근한 images의 요소(MultipartFile)에 업로드된 파일이 있는지 확인
			if(!carImgs.get(i).getOriginalFilename().equals("")) {
				// 파일이 업로드 된 경우 == 업로드된 원본 파일명이 있는 경우
				
				// 원본 파일명 변경
				String fileName = rename(carImgs.get(i).getOriginalFilename());
				
				// Attachment 객체 생성
				CAttachment ca = new CAttachment(filePath, fileName, i, carNo);
				
				uploadImages.add(ca); // 리스트에 추가
			}
		}
		
		if(!uploadImages.isEmpty()) { // 업로드된 이미지가 있을 경우
			// 파일 정보 삽입 DAO 호출
			result = dao.insertAttachmentList(uploadImages);	
			// result == 삽입된 행의 개수
			
			// 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
			if(result == uploadImages.size()) {
				result = carNo; 
				// result에 carNo 저장
				// MultipartFile.transferTo(O)
				// -> multipartFile 객체에 저장된 파일을
				//	  저장된 경로에 실제 파일의 형태로 변환하여 저장하는 메소드
				
				int size = 0;
				
				size = uploadImages.size();
				
				for(int i = 0; i < size; i++) {
					
					// uploadImages : 업로드된 이미지 정보를 담고있는 Attachment가 모여있는 List
					// images : input type="file" 태그의 정보를 담은 MultipartFile이 모여있는 List
					
					// uploadImages를 만들 때 각 요소의 파일레벨은
					// images의 index를 이용해서 부여함
					
					try {
						carImgs.get(uploadImages.get(i).getFileLevel())
							.transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName()));
					} catch (Exception e) {
						e.printStackTrace();
						
						// .transferTo()는 IOException을 발생 시킴(Checked Exception)
						// -> 어쩔 수 없이 try-catch문 작성
						// --> 예외가 처리되버려서 @Transactional이 정상동작 하지 못함
						// --> 꼭 예외처리를 하지 않아도 되는 UncheckedException을 강제 발생시켜
						// 	   @Transactional이 예외가 발생했음을 감지하게 함
						// --> 상황에 맞는 사용자 정의 예외를 작성
						throw new InsertAttachmentFailException("파일 서버 저장 실패");
					}
				}
				
			} else { // 파일 정보를 DB에 삽입하는데 실패했을 때
				throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
			}
			
		} else { // 업로드된 이미지가 없을 경우
			result = carNo;
		}
		
		return result;
	}
	
	// 선택된 차량정보 삭제 Service 구현
	@Override
	public int selectedCarDelete(List<String> chkList) {
		return dao.selectedCarDelete(chkList);
	}
	
	// 댓글 목록 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getReplyPageInfo(int cp) {
		int listCount = dao.getReplyListCount();
		
		return new PageInfo(cp, listCount);
	}
	
	// 댓글 목록 조회 Service 구현
	@Override
	public List<Reply> selectReplyList(PageInfo pInfo) {
		return dao.selectReplyList(pInfo);
	}
	
	// 선택된 댓글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int replyDelete(List<String> chkList) {
		return dao.replyDelete(chkList);
	}

	// 선택된 댓글 복구 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int replyRestore(List<String> chkList) {
		return dao.replyRestore(chkList);
	}
	
	// 게시글 관리 검색 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchReplyPageInfo(int cp, String sv) {
		int listCount = dao.getSearchReplyCount(sv);
		
		return new PageInfo(cp, listCount);
	}

	// 게시글 관리 검색 Service 구현
	@Override
	public List<Reply> selectSearchReply(PageInfo pInfo, String sv) {
		return dao.selectSearchReply(pInfo, sv);
	}

	// 차량정보 수정용 데이터 조회 Service 구현
	@Override
	public Cars selectUpdateCar(int carNo) {
		return dao.selectUpdateCar(carNo);
	}
	
	// 차량 정보 수정 Service 구현
	@Override
	public int updateCarAction(Cars cars) {
		return dao.updateCarAction(cars);
	}
	
	// 차량 정보 검색 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchCarPageInfo(int cp, String sv) {
		int listCount = dao.getSearchCarCount(sv);
		
		return new PageInfo(cp, listCount);
	}
	
	// 차량 정보 검색 목록 조회 Service 구현
	@Override
	public List<Cars> selectSearchCarInfo(PageInfo pInfo, String sv) {
		return dao.selectSearchCarInfo(pInfo, sv);
	}
	
	
	// 신고 게시글 목록 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getRBPageInfo(int cp) {
		int listCount = dao.getRBCount();
		
		return new PageInfo(cp, listCount);
	}
	
	// 신고 게시글 목록 조회 Service 구현
	@Override
	public List<Board> selectRBList(PageInfo pInfo) {
		return dao.selectRBList(pInfo);
	}

	// 신고 게시글 관리 검색 페이징 정보 조회 Service 구현
	@Override
	public PageInfo getSearchRBPageInfo(int cp, String sv) {
		int listCount = dao.getSearchRBCount(sv);
		
		return new PageInfo(cp, listCount);
	}

	// 신고 게시글 관리 검색 Serivce 구현
	@Override
	public List<Board> selectSearchRB(PageInfo pInfo, String sv) {
		return dao.selectSearchRB(pInfo, sv);
	}
	
	// 신고 게시글 내용 확인 Service 구현
	@Override
	public Board selectReportBoard(int boardNo) {
		return dao.selectReportBoard(boardNo);
	}

	
	// 디비에 저장된 모든 이미지 파일 가져오기 Service 구현
	@Override
	public List<String> getDbList() {
		return dao.getDbList();
	}

	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}

}
