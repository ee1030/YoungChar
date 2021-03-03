package com.kh.youngchar.company.model.vo;

import java.sql.Timestamp;

public class Report {
	
	private int reportNo;
	private Timestamp reportDate;
	private String reportYn;
	private int reportType;
	private int reportBoardNo;
	private String reportContent;
	private int memNo;
	private String reportTypeName;
	
	public Report() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public Timestamp getReportDate() {
		return reportDate;
	}

	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportYn() {
		return reportYn;
	}

	public void setReportYn(String reportYn) {
		this.reportYn = reportYn;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public int getReportBoardNo() {
		return reportBoardNo;
	}

	public void setReportBoardNo(int reportBoardNo) {
		this.reportBoardNo = reportBoardNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getReportTypeName() {
		return reportTypeName;
	}

	public void setReportTypeName(String reportTypeName) {
		this.reportTypeName = reportTypeName;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportDate=" + reportDate + ", reportYn=" + reportYn
				+ ", reportType=" + reportType + ", reportBoardNo=" + reportBoardNo + ", reportContent=" + reportContent
				+ ", memNo=" + memNo + ", reportTypeName=" + reportTypeName + "]";
	}	
	
	
	

}
