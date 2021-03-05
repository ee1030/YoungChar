package com.kh.youngchar.cars.model.vo;

public class CAttachment {
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int carNo;
	
	public CAttachment() {}

	public CAttachment(int fileNo, String filePath, String fileName, int fileLevel, int carNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.carNo = carNo;
	}

	public CAttachment(String filePath, String fileName, int fileLevel, int carNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.carNo = carNo;
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

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	@Override
	public String toString() {
		return "CAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", carNo=" + carNo + "]";
	}

}
