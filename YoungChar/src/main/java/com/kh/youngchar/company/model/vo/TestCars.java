package com.kh.youngchar.company.model.vo;

public class TestCars {
	private int testDrivecCarNo ;
	private int carNo ;
	private String carName;
	private String carModel;
	private int fileNo;
	private String filePath;
	private String fileName;
	private int memNo2;
	
	public TestCars() {}

	public int getTestDrivecCarNo() {
		return testDrivecCarNo;
	}

	public void setTestDrivecCarNo(int testDrivecCarNo) {
		this.testDrivecCarNo = testDrivecCarNo;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
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

	public int getMemNo2() {
		return memNo2;
	}

	public void setMemNo2(int memNo2) {
		this.memNo2 = memNo2;
	}

	@Override
	public String toString() {
		return "TestCars [testDrivecCarNo=" + testDrivecCarNo + ", carNo=" + carNo + ", carName=" + carName
				+ ", carModel=" + carModel + ", fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", memNo2=" + memNo2 + "]";
	}

	 
}