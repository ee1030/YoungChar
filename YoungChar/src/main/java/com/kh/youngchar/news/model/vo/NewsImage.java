package com.kh.youngchar.news.model.vo;

public class NewsImage {
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int newsNo;
	
	public NewsImage() {}
	

	public NewsImage(String filePath, String fileName, int fileLevel, int newsNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.newsNo = newsNo;
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

	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	@Override
	public String toString() {
		return "NewsImage [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", newsNo=" + newsNo + "]";
	}
	
	

}
