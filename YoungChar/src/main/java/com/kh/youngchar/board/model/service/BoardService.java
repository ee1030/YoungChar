package com.kh.youngchar.board.model.service;

import java.util.List;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.board.model.vo.PageInfo2;

public interface BoardService {

	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo2 getPageInfo(int type, int cp);

	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @param type 
	 * @return bList
	 */
	public abstract List<Board> selectList(PageInfo2 pInfo, int type);

	/** 썸네일 목록 조회 Service
	 * @param bList
	 * @return thList
	 */
	public abstract List<Attachment> selectThumbnailList(List<Board> bList);
	
	/** 게시글 상세 조회 Service
	 * @param boardNo
	 * @param type 
	 * @return board
	 */
	public abstract Board selectBoard(int boardNo, int type);

	/** 게시글에 포함된 이미지 목록 조회 Service
	 * @param boardNo
	 * @return attachmentList
	 */
	public abstract List<Attachment> selectAttachmentList(int boardNo);
	
	/** 게시글 삽입 (+ 파일 업로드) Service
	 * @param map
	 * @param savePath 
	 * @param images 
	 * @return result
	 */
	public abstract int insertBoard(Map<String, Object> map, List<MultipartFile> images, String savePath);

	/** 게시글 수정 Service
	 * @param updateBoard
	 * @param images
	 * @param savePath
	 * @param deleteImages
	 * @return result
	 */
	public abstract int updateBoard(Board updateBoard, List<MultipartFile> images, String savePath,
			boolean[] deleteImages);

	/** 썸머노트 파일 업로드 
	 * @param uploadFile
	 * @param savePath
	 * @return
	 */
	public abstract Attachment insertImage(MultipartFile uploadFile, String savePath);

	/** DB에 저장된 최근 3일 제외 파일 정보 조회 Service
	 * @return
	 */
	public abstract List<String> selectDBFileList();

	/** 카테고리 별 게시판 조회
	 * @param pInfo
	 * @param map
	 * @return bList
	 */
	public abstract List<Board> categoryBoardList(PageInfo2 pInfo, Map<String, Object> map);

	



}
