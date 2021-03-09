package com.kh.youngchar.news.model.service;

import java.util.List;
import java.util.Map;

import com.kh.youngchar.news.model.vo.Reply;

public interface NewsReplyService {
	
	
	/** 댓글 목록 조회 Service 
	 * @param parentBoardNo
	 * @return rList
	 */
	public abstract  List<Reply> selectReplyList(int newsNo);

	/** 댓글 삽입 Service
	 * @param map
	 * @return result 
	 */ 
	public abstract int insertReply(Map<String, Object> map);

	/** 댓글 수정 Service
	 * @param updateReply
	 * @return result
	 */
	public abstract int updateReply(Reply updateReply);
 
	/** 댓글 삭제 Service
	 * @param replyNo 
	 * @return result
	 */
	public abstract int deleteReply(int replyNo);

}
