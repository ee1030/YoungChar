package com.kh.youngchar.testDrive.model.vo;

import java.sql.Timestamp;

public class TestDrReservation {
	//RESERVATION_NO, TEST_DRIVE_CAR_NO, MEM_NO, TEST_DRIVE_DATE, APPROVAL_STATUS, CAR_NO, CAR_NAME,CAR_MODEL, FILE_NO, FILE_PATH, FILE_NAME, MEM_NO2

	private int reservationNo;
	private int testDriveCarNo;
	private String memNo;
	private Timestamp testDriveDate  ;
	private String approvalStatus;
	private int carNo;
	private String carName;
	private String carModel;
	private String brand;
	private int fileNo;
	private String filePath;
	private String fileName;
	private int memNo2;
	
	public TestDrReservation() {
		// TODO Auto-generated constructor stub
	}
	
	

	public TestDrReservation(int reservationNo, int testDriveCarNo, String memNo, Timestamp testDriveDate,
			String approvalStatus) {
		super();
		this.reservationNo = reservationNo;
		this.testDriveCarNo = testDriveCarNo;
		this.memNo = memNo;
		this.testDriveDate = testDriveDate;
		this.approvalStatus = approvalStatus;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getTestDriveCarNo() {
		return testDriveCarNo;
	}

	public void setTestDriveCarNo(int testDriveCarNo) {
		this.testDriveCarNo = testDriveCarNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public Timestamp getTestDriveDate() {
		return testDriveDate;
	}

	public void setTestDriveDate(Timestamp testDriveDate) {
		this.testDriveDate = testDriveDate;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
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
		return "TestDrReservation [reservationNo=" + reservationNo + ", testDriveCarNo=" + testDriveCarNo + ", memNo="
				+ memNo + ", testDriveDate=" + testDriveDate + ", approvalStatus=" + approvalStatus + ", carNo=" + carNo
				+ ", carName=" + carName + ", carModel=" + carModel + ", fileNo=" + fileNo + ", filePath=" + filePath
				+ ", fileName=" + fileName + ", memNo2=" + memNo2 + ", brand=" + brand + "]";
	}

	
	
	
}
