package com.kh.youngchar.company.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.board.model.exception.InsertAttachmentFailException;
import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.company.controller.DriveReviewController;
import com.kh.youngchar.company.model.dao.DriveReviewDAO;
import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;
import com.kh.youngchar.company.model.vo.Report;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 시승후기 관련 ServiceImpl
 * @author jeonga
 *
 */
@Service
public class DriveReviewServiceImpl implements DriveReviewService{
	
	@Autowired
	private DriveReviewDAO dao;
	private Logger logger = LoggerFactory.getLogger(DriveReviewController.class);


	@Override
	public PageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		return new PageInfo(cp, listCount);
	}

	@Override
	public List<DriveReview> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}
	

	@Override
	public List<Attachment> selectThumbnailList(List<DriveReview> bList) {
		return dao.selectThumbnailList(bList);
	}
	
	@Override
	public DriveReview selectBoard(int boardNo) {
		DriveReview board = dao.selectBoard(boardNo);
		return board;
	}

	@Override
	public DriveReview driveReview(int boardNo) {
		
		DriveReview board = selectBoard(boardNo);
		
		if(board != null) {

			int result = dao.increaseReadCount(boardNo);
			
			if(result > 0) {
				board.setReadCount(board.getReadCount() + 1);
			}
		}
		
		return board;
	}
	

	@Override
	public List<Reply> selectReplyList(int boardNo) {
		return dao.selectReplyList(boardNo);
	}

	@Override
	public DriveReview selectReservation(int rsrvtNo) {
		return dao.selectReservation(rsrvtNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(DriveReview board, String savePath) {
		int result = 0;
		
		int boardNo = dao.selectNextNo();
		
		if(boardNo> 0) {
			board.setBoardNo(boardNo);
			
			dao.insertBoard(board);
			result = dao.insertDriveReview(board);
			
			if(result > 0) {
				
				List<Attachment> uploadImages = new ArrayList<Attachment>();
				
				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
				
				// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher(board.getBoardContent());     
				 
				String filePath = null;
				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수
				
				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
				while(matcher.find()){
					src=  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
					
					filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
					
					fileName = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.
					
					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					Attachment at = new Attachment(filePath, fileName, 1, boardNo);
					uploadImages.add(at);
				}
				
				if(!uploadImages.isEmpty()) {
					
					Attachment temp = uploadImages.get(0);
					temp.setFileLevel(0);
					
					result = dao.insertAttachmentList(uploadImages);
					
					if(result == uploadImages.size()) {
						result = boardNo;
					}else {
						throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
					}
					
				}else {
					result = boardNo;
				}
				
			}
		}
		
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public Attachment insertImage(MultipartFile uploadFile, String savePath) {
		
		String fileName = rename(uploadFile.getOriginalFilename());
		
		String filePath = "/resources/reviewImages";
		
		Attachment at = new Attachment();
		at.setFileName(fileName);
		at.setFilePath(filePath);
		
		try {
			uploadFile.transferTo( new File(savePath + "/" + fileName));
		}catch(Exception e) {
			e.printStackTrace();
			
			throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
		}
		
		return at;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(DriveReview board, String savePath) {
		
		int result = 0;
		
		result = dao.updateBoard(board);
			
		if(result > 0) {
			
			// 파일수정 ========================================================================================
			
			List<Attachment> oldFiles = dao.selectAttachmentList(board.getBoardNo());
			
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	
			// src 속성을 이용해서 파일명 얻어오기
			Matcher matcher = pattern.matcher(board.getBoardContent());
			
			// 이미지 파일명만 얻어와 모아둘 List 선언
			List<String> fileNameList = new ArrayList<String>();
			
			String src = null; // matcher에 저장된 src를 꺼내서 임시 저장할 변수
			String fileName = null; // src에서 파일명을 추출해서 임시 저장할 변수
			String filePath = "/resources/reviewImages";
			
			// matcher를 하나씩 꺼내옴
			while(matcher.find()) {
				src = matcher.group(1); // /youngchar/board/resources/reviewImages/abc.jpg
				fileName = src.substring(src.lastIndexOf("/") + 1); // 마지막 / 까지 잘라낸다.
				fileNameList.add(fileName);
			}
			
			
			// DB에 새로 추가할 이미지파일 정보를 모아둘 List 생성
			List<Attachment> newAttachmentList = new ArrayList<Attachment>();
			
			// DB에서 삭제할 이미지 파일 번호를 모아둘 List 생성
			List<Integer> deleteFileNoList = new ArrayList<Integer>(); 
			
			// 수정된 게시글 파일명 목록(fileNameList)과 수정 전 파일정보 목록(oldFiles)를 비교해서 
			// 수정된 게시글 파일명 하나를 기준으로 하여 수정 전 파일명과 순차적 비교 진행
			// --> 수정된 게시글 파일명과 일치하는 수정 전 파일명이 없다면
			//		== 새로 삽입된 이미지임을 의미함.
			
			for(String fName : fileNameList) {
				
				boolean flag = true;
				
				for(Attachment oldAt : oldFiles) {
	
					if(fName.equals(oldAt.getFileName())) { // 수정 후/수정 전 같은 파일이 있다.
						flag = false;
						break;
					}
				}
				
				// flag == true == 새로 추가된 이미지 
				if(flag) {
					Attachment at = new Attachment(filePath, fName, 1, board.getBoardNo());
					newAttachmentList.add(at);
				}
			}
			
			// 수정 전 파일정보 목록(oldFiles) 수정된 게시글 파일명 목록(fileNameList)를 비교해서 
			// 수정 전 파일명 하나를 기준으로 하여 수정 후 파일명과 순차적 비교 진행
			// --> 수정 전 게시글 파일명과 일치하는 수정 후 파일명이 없다면
			//		== 기존 이미지가 삭제됨 의미함.
			for(Attachment oldAt : oldFiles) {
				
				boolean flag = true;
				
				for(String fName : fileNameList) {
					if(oldAt.getFileName().equals(fName)) {
						flag = false;
						break;
					}
				}
				
				if(flag) {
					deleteFileNoList.add(oldAt.getFileNo());
				}
			}
			
			Attachment temp = null;
			
			// 뉴파일리스트가 비어있지 않으면 올드파일리스트의 0번 파일레벨을 불러와서
			// src의 0번째 파일네임과 다르면
			// 올드파일리스트의 파일레벨을 1번으로 바꿔주고
			// src의 0번째 파일네임의 레벨을 0으로 바꿔준다.
			
			if(!newAttachmentList.isEmpty()) {
				
				if(!oldFiles.isEmpty()) {
					for(Attachment oldAt : oldFiles) {
						if(oldAt.getFileLevel() == 0) {
							temp = oldAt;
							break;
						}
					}
				}
				
				
				if(temp != null && !temp.getFileName().equals(fileNameList.get(0))) {
					temp.setFileLevel(1);
					
					for(Attachment newFile : newAttachmentList) {
						if(fileNameList.get(0).equals(newFile.getFileName())){
							newFile.setFileLevel(0);
						}
					}
					result = dao.updateAttachment(temp);
				}else if(oldFiles.isEmpty()) {
					newAttachmentList.get(0).setFileLevel(0);
				}else {
					temp = null;
					newAttachmentList.get(0).setFileLevel(1);
				}
				
				
				if(result > 0) {
					result = dao.insertAttachmentList(newAttachmentList);
				}
			
				if(result != newAttachmentList.size()) {
					throw new InsertAttachmentFailException("파일 정보 삽입 중 오류 발생");
				}
			}
			
			// 딜리트 파일리스트 중에 파일레벨 0번이 있고 파일네임리스트가 비어있지 않다면
			// 파일네임리스트의 첫번째 파일네임을 가져와 파일레벨 0번으로 업데이트 해준다.
			
			if(!deleteFileNoList.isEmpty()) {
				
				for(int deleteFileNo : deleteFileNoList) {
					
					for(Attachment oldAt : oldFiles) {
						if(deleteFileNo == oldAt.getFileNo() && oldAt.getFileLevel() == 0) {
							
							if(!fileNameList.isEmpty()) {
								
								result = dao.updateAttachment2(fileNameList.get(0));
							}
							break;
						}
					}
				}
				
				if(result > 0 ) {
					result = dao.deleteAttachmentList(deleteFileNoList);
				}
				
				if(result != deleteFileNoList.size()) {
					throw new InsertAttachmentFailException("파일 정보 삭제 중 오류 발생");
				}
			}
		
		}
		
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(int boardNo) {
		
		int result = dao.deleteBoard(boardNo);
		List<Integer> deleteFileNoList = new ArrayList<Integer>();
		
		if(result > 0) {
			List<Attachment> oldFiles = dao.selectAttachmentList(boardNo);
			
			if (!oldFiles.isEmpty()) {
				
				for(Attachment file : oldFiles) {
					deleteFileNoList.add(file.getFileNo());
				}
				
				result = dao.deleteAttachmentList(deleteFileNoList);
			}
		}
		
		return result;
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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reportBoard(Report report) {
		
		int result = 1;
		result = dao.selectReport(report);
		
		if(result == 0) {
			
			result = dao.insertReport(report);
			
			// 현재 게시글 신고 수 조회
			int reportCount = dao.selectReportCount(report);
			
			if(reportCount > 9) {
				// 신고수 10개 이상이면 상태 업데이트
				result = dao.updateReviewStatus(report);
			}
			
		}else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public PageInfo getSearchPageInfo(Search search, int cp) {
		
		int listCount = dao.getSearchListCount(search);
		
		return new PageInfo(cp, listCount);
	}

	@Override
	public List<DriveReview> selectSearchList(Search search, PageInfo pInfo) {
		return dao.selectSearchList(search, pInfo);
	}








}
