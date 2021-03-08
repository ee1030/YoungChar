package com.kh.youngchar.testDrive.model.vo;

public class CompanyMember {

	private int testDriveNo; 
	private int memberNo; //업체 회원 번호 
	private int carNo; //자동차번호
	private String cooName; //대리점명
	private String memPhone; //대리점 전화번호
	private String memberAddr; //대리점 주소
	private String brand; //브랜드이름
	
	
	public int getTestDriveNo() {
		return testDriveNo;
	}
	public void setTestDriveNo(int testDriveNo) {
		this.testDriveNo = testDriveNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCarNo() {
		return carNo;
	}
	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}
	public String getCooName() {
		return cooName;
	}
	public void setCooName(String cooName) {
		this.cooName = cooName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	@Override
	public String toString() {
		return "CompanyMember [testDriveNo=" + testDriveNo + ", memberNo=" + memberNo + ", carNo=" + carNo
				+ ", cooName=" + cooName + ", memPhone=" + memPhone + ", memberAddr=" + memberAddr + ", brand=" + brand
				+ "]";
	}
	
	
	
	
	
}
