package com.kh.youngchar.company.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;
import com.kh.youngchar.company.model.vo.Report;
import com.kh.youngchar.member.model.vo.MemberFile;

@Repository
public class DriveReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("driveReviewMapper.getListCount");
	}

	public List<DriveReview> selectList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("driveReviewMapper.selectList", null, rowBounds);
		
	}

	public DriveReview selectBoard(int boardNo) {
		return sqlSession.selectOne("driveReviewMapper.selectBoard", boardNo);
	}


	public int increaseReadCount(int boardNo) {
		return sqlSession.update("driveReviewMapper.increaseReadCount", boardNo);
	}

	public List<Reply> selectReplyList(int boardNo) {
		return sqlSession.selectList("driveReviewMapper.selectReplyList", boardNo);
	}

	public DriveReview selectReservation(int rsrvtNo) {
		return sqlSession.selectOne("driveReviewMapper.selectReservation", rsrvtNo);
	}

	public int selectNextNo() {
		return sqlSession.selectOne("driveReviewMapper.selectNextNo");
	}

	public int insertBoard(DriveReview board) {
		return sqlSession.insert("driveReviewMapper.insertBoard", board);
	}

	public int insertDriveReview(DriveReview board) {
		return sqlSession.insert("driveReviewMapper.insertDriveReview", board);
	}

	public int insertAttachmentList(List<Attachment> uploadImages) {
		return sqlSession.insert("driveReviewMapper.insertAttachmentList", uploadImages);
	}

	public int selectReport(Report report) {
		return sqlSession.selectOne("driveReviewMapper.selectReport", report);
	}

	public int insertReport(Report report) {
		return sqlSession.insert("driveReviewMapper.insertReport", report);
	}



}
