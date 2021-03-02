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
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체 페이지 및 시승후기 관련 ServiceImpl
 * @author jeonga
 *
 */
@Service
public class DriveReviewServiceImpl implements DriveReviewService{
	
	@Autowired
	private DriveReviewDAO dao;
	private Logger logger = LoggerFactory.getLogger(DriveReviewController.class);


	@Override
	public MemberFile getCompanyProfile(int memberNo) {
		return dao.getCompanyProfile(memberNo);
	}

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
	public DriveReview driveReview(int boardNo) {
		
		DriveReview board = dao.selectBoard(boardNo);
		
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
			
			result = dao.insertBoard(board);
			
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
