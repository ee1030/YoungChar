package com.kh.youngchar.company.model.vo;

public class TestCars {
	private int testDrivecCarNo ; 
	private int carNo ; //자동차 번호
	private String carName; //자동차이름
	private String carModel; //모델
	private int fileNo; //사진
	private String filePath;
	private String fileName;
	private int memNo2; //업체 회원번호
	private String brand; //브랜드
	
	public TestCars() {}
	
	

	
	public TestCars(int testDrivecCarNo, int carNo, String carName, String carModel, int fileNo, String filePath,
			String fileName, int memNo2, String brand) {
		super();
		this.testDrivecCarNo = testDrivecCarNo;
		this.carNo = carNo;
		this.carName = carName;
		this.carModel = carModel;
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.memNo2 = memNo2;
		this.brand = brand;
	}




	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


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
				+ ", memNo2=" + memNo2 + ", brand=" + brand + "]";
	}


	
	

	 
}
