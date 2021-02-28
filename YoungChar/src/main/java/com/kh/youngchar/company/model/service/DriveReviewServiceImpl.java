package com.kh.youngchar.company.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Map<String, Object> driveReview(int boardNo) {
		
		DriveReview board = dao.selectBoard(boardNo);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(board != null) {
			MemberFile mFile = dao.getMemberProfile(board.getMemNo());
			map.put("board", board);
			map.put("mFile", mFile);

			int result = dao.increaseReadCount(boardNo);
			
			if(result > 0) {
				board.setReadCount(board.getReadCount() + 1);
			}
		}
		
		return map;
	}

	@Override
	public List<Reply> selectReplyList(int boardNo) {
		return dao.selectReplyList(boardNo);
	}

}
