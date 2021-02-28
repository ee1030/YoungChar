package com.kh.youngchar.company.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class DriveReview {
	
	private int boardNo;
	private int csat;
	private String categoryNm;
	private String cooName;
	private String carName;
	private String boardTitle;
	private String boardContent;
	private int memNo;
	private String memNickname;
	private Timestamp boardCreateDt;
	private int replyCount;
	private int readCount;
	
	public DriveReview() {}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCsat() {
		return csat;
	}

	public void setCsat(int csat) {
		this.csat = csat;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public String getCooName() {
		return cooName;
	}

	public void setCooName(String cooName) {
		this.cooName = cooName;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public Timestamp getBoardCreateDt() {
		return boardCreateDt;
	}

	public void setBoardCreateDt(Timestamp boardCreateDt) {
		this.boardCreateDt = boardCreateDt;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "DriveReview [boardNo=" + boardNo + ", csat=" + csat + ", categoryNm=" + categoryNm + ", cooName="
				+ cooName + ", carName=" + carName + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memNo=" + memNo + ", memNickname=" + memNickname + ", boardCreateDt=" + boardCreateDt
				+ ", replyCount=" + replyCount + ", readCount=" + readCount + "]";
	}


	
	
	
	
	
}
