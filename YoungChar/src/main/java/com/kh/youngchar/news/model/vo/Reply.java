package com.kh.youngchar.news.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private String replyContent;
	private Date replyCreateDate;
	private String replyStatus;
	private int memberImageNo;
	private int newsNo;
	
	public Reply() {
		
	}

	public Reply(int replyNo, String replyContent, Date replyCreateDate, String replyStatus, int memberImageNo,
			int newsNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyStatus = replyStatus;
		this.memberImageNo = memberImageNo;
		this.newsNo = newsNo;
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

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getMemberImageNo() {
		return memberImageNo;
	}

	public void setMemberImageNo(int memberImageNo) {
		this.memberImageNo = memberImageNo;
	}

	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyStatus=" + replyStatus + ", memberImageNo=" + memberImageNo + ", newsNo=" + newsNo + "]";
	}
	
	

}
