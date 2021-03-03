package com.kh.youngchar.chargerCompany.model.vo;

public class CompanyImage {
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int companyNo;
	
	public CompanyImage() {}

	public CompanyImage(String filePath, String fileName, int fileLevel, int companyNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.companyNo = companyNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "CompanyImage [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", companyNo=" + companyNo + "]";
	}
	
	

}
