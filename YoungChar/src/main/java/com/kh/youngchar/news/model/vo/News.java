package com.kh.youngchar.news.model.vo;

import java.sql.Date;

public class News {
	
	private int newsNo;
	private String newsTitle;
	private String press;
	private String reporter;
	private String newsContent;
	private Date newsCreateDate;
	private String newsStatus;
	private int memberNo;
	private int readCount;
	private int best;
	private int worst;
	
	public News() {}

	public News(int newsNo, String newsTitle, String press, String reporter, String newsContent, Date newsCreateDate,
			String newsStatus, int memberNo, int readCount, int best, int worst) {
		super();
		this.newsNo = newsNo;
		this.newsTitle = newsTitle;
		this.press = press;
		this.reporter = reporter;
		this.newsContent = newsContent;
		this.newsCreateDate = newsCreateDate;
		this.newsStatus = newsStatus;
		this.memberNo = memberNo;
		this.readCount = readCount;
		this.best = best;
		this.worst = worst;
	}

	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public Date getNewsCreateDate() {
		return newsCreateDate;
	}

	public void setNewsCreateDate(Date newsCreateDate) {
		this.newsCreateDate = newsCreateDate;
	}

	public String getNewsStatus() {
		return newsStatus;
	}

	public void setNewsStatus(String newsStatus) {
		this.newsStatus = newsStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getBest() {
		return best;
	}

	public void setBest(int best) {
		this.best = best;
	}

	public int getWorst() {
		return worst;
	}

	public void setWorst(int worst) {
		this.worst = worst;
	}

	@Override
	public String toString() {
		return "News [newsNo=" + newsNo + ", newsTitle=" + newsTitle + ", press=" + press + ", reporter=" + reporter
				+ ", newsContent=" + newsContent + ", newsCreateDate=" + newsCreateDate + ", newsStatus=" + newsStatus
				+ ", memberNo=" + memberNo + ", readCount=" + readCount + ", best=" + best + ", worst=" + worst + "]";
	}
	
	

}
