package com.kh.youngchar.news.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.news.model.vo.Reply;

@Repository // 저장소 관련 + Bean 등록
public class NewsReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param parentBoardNo
	 * @return rList
	 */
	public List<Reply> selectReplyList(int newNo) {
		return sqlSession.selectList("newsReplyMapper.selectReplyList" , newNo);
	}

	/** 댓글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertReply(Map<String, Object> map) {
		
		return sqlSession.insert("newsReplyMapper.insertReply", map);
	}

	/** 댓글 수정 DAO
	 * @param updateReply
	 * @return result
	 */
	public int updateReply(Reply updateReply) {
		return sqlSession.update("newsReplyMapper.updateReply", updateReply);
	}

	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return result
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("newsReplyMapper.deleteReply", replyNo);
	}


}
