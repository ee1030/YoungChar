package com.kh.youngchar.company.model.vo;

import java.sql.Timestamp;

public class Reply {
	private int replyNo; 		 		// 댓글 번호
	private String replyContent; 		// 댓글 내용
	private Timestamp replyCreateDt;	// 댓글 작성일
	private String replyStatus;			// 댓글 상태
	private int boardNo;			// 댓글이 작성된 게시글 번호
	private int replyWriter;			// 댓글 작성 회원
	private String memNickname;			// 댓글 작성 회원 닉네임
	private int parentReplyNo;			// 부모 댓글 번호
	private int replyDepth;				// 댓글 깊이
	private String memImgPath;
	private String memImgName;
	private int boardCode;

	public Reply() {}

	
	
	public Reply(int replyNo, String replyContent, Timestamp replyCreateDt, String replyStatus, int boardNo,
			int replyWriter, String memNickname, int parentReplyNo, int replyDepth, String memImgPath,
			String memImgName, int boardCode) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDt = replyCreateDt;
		this.replyStatus = replyStatus;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
		this.memNickname = memNickname;
		this.parentReplyNo = parentReplyNo;
		this.replyDepth = replyDepth;
		this.memImgPath = memImgPath;
		this.memImgName = memImgName;
		this.boardCode = boardCode;
	}



	public int getBoardCode() {
		return boardCode;
	}


	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}


	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyCreateDt() {
		return replyCreateDt;
	}

	public void setReplyCreateDt(Timestamp replyCreateDt) {
		this.replyCreateDt = replyCreateDt;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(int replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	public int getReplyDepth() {
		return replyDepth;
	}

	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}

	public String getMemImgPath() {
		return memImgPath;
	}

	public void setMemImgPath(String memImgPath) {
		this.memImgPath = memImgPath;
	}

	public String getMemImgName() {
		return memImgName;
	}

	public void setMemImgName(String memImgName) {
		this.memImgName = memImgName;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDt=" + replyCreateDt
				+ ", replyStatus=" + replyStatus + ", boardNo=" + boardNo + ", replyWriter=" + replyWriter
				+ ", memNickname=" + memNickname + ", parentReplyNo=" + parentReplyNo + ", replyDepth=" + replyDepth
				+ ", memImgPath=" + memImgPath + ", memImgName=" + memImgName + ", boardCode=" + boardCode + "]";
	}

	
}
