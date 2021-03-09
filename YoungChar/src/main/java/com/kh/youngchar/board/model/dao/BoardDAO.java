package com.kh.youngchar.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.company.model.vo.Report;

@Repository // 저장소 (DB) 연결 객체임을 알려줌 + bean 등록
public class BoardDAO {

//	마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 특정 게시판 전체 게시글 수 조회 DAO
	 * @param type
	 * @return listCount
	 */
	public int getListCount(int type) {
		
		return sqlSession.selectOne("boardMapper.getListCount", type);
	}

	/** 게시글 목록 조회 DAO
	 * @param pInfo
	 * @param type 
	 * @return bList
	 */
	public List<Board> selectList(PageInfo2 pInfo, int type) {
		
//		RowBounds 객체 : offset과 limit를 이용하여 조회 내용 중 일부 행만 조회하는 마이바티스 객체
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = null;
		
		if(type == 3) {
			rowBounds = new RowBounds(offset, pInfo.getLimit());
			
		}else {
			rowBounds = new RowBounds(offset, pInfo.getLimit() - 1);
			
		}
		
		return sqlSession.selectList("boardMapper.selectList", pInfo.getBoardType(), rowBounds);
	}
	

	/** 썸네일 목록 조회 dAO
	 * @param bList
	 * @return thList
	 */
	public List<Attachment> selectThumbnailList(List<Board> bList) {
		return sqlSession.selectList("boardMapper.selectThumbnailList", bList);
	}


	/** 게시글 상세조회 DAO
	 * @param temp
	 * @return board
	 */
	public Board selectBoard(Board temp) {
		return sqlSession.selectOne("boardMapper.selectBoard", temp);
	}

	/** 조회수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int increaseReadCount(int boardNo) {
		return sqlSession.update("boardMapper.increaseReadCount", boardNo);
	}

	/** 게시글에 포함된 이미지 목록 조회 DAO
	 * @param boardNo
	 * @return attachmentList
	 */
	public List<Attachment> selectAttachmentList(int boardNo) {
		return sqlSession.selectList("boardMapper.selectAttachmentList", boardNo);
	}
	
	
	/** 다음 게시글 번호 얻어오기 DAO
	 * @return boardNo
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("boardMapper.selectNextNo");
	}

	/** 게시글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("boardMapper.insertBoard", map);
	}

	/** 파일 정보 삽입 DAO
	 * @param uploadImages
	 * @return result(성공한 행의 개수)
	 */
	public int insertAttachmentList(List<Attachment> uploadImages) {
		return sqlSession.insert("boardMapper.insertAttachmentList", uploadImages);
	}

	/** 게시글 수정 DAO
	 * @param updateBoard 
	 * @return result
	 */
	public int updateBoard(Board updateBoard) {
		return sqlSession.update("boardMapper.updateBoard",updateBoard);
	}

	/** 파일 정보 수정 DAO
	 * @param at
	 * @return result
	 */
	public int updateAttachment(Attachment at) {
		return sqlSession.update("boardMapper.updateAttachment", at);
	}
	
	/** 파일 정보 삽입 DAO
	 * @param at
	 * @return result
	 */
	public int insertAttachment(Attachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}

	/** 파일 정보 삭제 DAO
	 * @param fileNo
	 * @return result
	 */
	public int deleteAttachment(int fileNo) {
		return sqlSession.delete("boardMapper.deleteAttachment",fileNo);
	}

	/** DB에 저장된 최근 3일 제외 파일 정보 조회 DAO
	 * @return dbFileList
	 */
	public List<String> selectDBFileList() {
		return sqlSession.selectList("boardMapper.selectDBFileList");
	}

	/** 카테고리별 게시판 조회
	 * @param pInfo
	 * @param map
	 * @return bList
	 */
	public List<Board> categoryBoardList(PageInfo2 pInfo, Map<String, Object> map) {
		
//		RowBounds 객체 : offset과 limit를 이용하여 조회 내용 중 일부 행만 조회하는 마이바티스 객체
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = null;
		
		if((int)map.get("type") == 3) {
			rowBounds = new RowBounds(offset, pInfo.getLimit());
			
		}else {
			rowBounds = new RowBounds(offset, pInfo.getLimit() - 1);
			
		}
		
		return sqlSession.selectList("boardMapper.categoryBoardList", map, rowBounds);
		
	}

	/** 파일 정보 일괄 삭제 DAO
	 * @param deleteFileNoList
	 * @return result 
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("boardMapper.deleteAttachmentList", deleteFileNoList);
	}

	/** 검색 조건에 맞는 게시글 수 조회 DAO
	 * @param search
	 * @return listCount
	 */
	public int getSearchListCount(Search search) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", search);
	}

	/** 검색 조건이 포함된 게시글 목록 조회 DAO
	 * @param search
	 * @param pInfo
	 * @return bList
	 */
	public List<Board> selectSearchList(Search search, PageInfo2 pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = null;
		
		if(pInfo.getBoardType() == 3) {
			rowBounds = new RowBounds(offset, pInfo.getLimit());
			
		}else {
			rowBounds = new RowBounds(offset, pInfo.getLimit() - 1);
			
		}
		return sqlSession.selectList("boardMapper.selectSearchList", search, rowBounds);
	}

	/** 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	public int delBoard(int boardNo) {
		return sqlSession.update("boardMapper.delBoard",boardNo);
	}

	
	public int selectReport(Report report) {
		return sqlSession.selectOne("boardMapper.selectReport", report);
	}

	public int insertReport(Report report) {
		return sqlSession.insert("boardMapper.insertReport", report);
	}
 
	/** 현재 게시글 신고 수 조회
	 * @param report
	 * @return
	 */
	public int selectReportCount(Report report) {
		return sqlSession.selectOne("boardMapper.selectReportCount" , report);
	}

	/** 신고 누적으로 상테 업데이트
	 * @param report
	 * @return
	 */
	public int updateReviewStatus(Report report) {
		return sqlSession.update("boardMapper.updateReviewStatus" , report);
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
