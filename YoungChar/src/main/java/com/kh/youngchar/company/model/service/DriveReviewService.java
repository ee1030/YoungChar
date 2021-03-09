package com.kh.youngchar.company.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;
import com.kh.youngchar.company.model.vo.Report;
import com.kh.youngchar.board.model.vo.Search;

/** 업체 페이지 및 시승후기 관련 Service
 * @author jeonga
 *
 */
public interface DriveReviewService{

	PageInfo getPageInfo(int cp);

	List<DriveReview> selectList(PageInfo pInfo);

	List<Attachment> selectThumbnailList(List<DriveReview> bList);

	DriveReview selectBoard(int boardNo);

	DriveReview driveReview(int boardNo);

	List<Reply> selectReplyList(int boardNo);

	DriveReview selectReservation(int rsrvtNo);

	int insertBoard(DriveReview board, String savePath);

	Attachment insertImage(MultipartFile uploadFile, String savePath);

	int updateBoard(DriveReview board, String savePath);
	
	int deleteBoard(int boardNo);

	int reportBoard(Report report);

	PageInfo getSearchPageInfo(Search search, int cp);

	List<DriveReview> selectSearchList(Search search, PageInfo pInfo);





}
