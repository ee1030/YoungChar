package com.kh.youngchar.company.model.service;

import java.util.List;
import java.util.Map;

import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체 페이지 및 시승후기 관련 Service
 * @author jeonga
 *
 */
public interface DriveReviewService{

	MemberFile getCompanyProfile(int memberNo);

	PageInfo getPageInfo(int cp);

	List<DriveReview> selectList(PageInfo pInfo);

	Map<String, Object> driveReview(int boardNo);

	List<Reply> selectReplyList(int boardNo);

}
