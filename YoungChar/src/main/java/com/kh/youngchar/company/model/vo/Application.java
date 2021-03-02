package com.kh.youngchar.company.model.vo;

import java.sql.Timestamp;

public class Application {
	
	private int rsrvtNo;
	private String memNm;
	private String memPhone;
	private String carName;
	private Timestamp testDriveDt;
	private String approvalStatus;
	public int getRsrvtNo() {
		return rsrvtNo;
	}
	public void setRsrvtNo(int rsrvtNo) {
		this.rsrvtNo = rsrvtNo;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public Timestamp getTestDriveDt() {
		return testDriveDt;
	}
	public void setTestDriveDt(Timestamp testDriveDt) {
		this.testDriveDt = testDriveDt;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	@Override
	public String toString() {
		return "ApplicationList [rsrvtNo=" + rsrvtNo + ", memNm=" + memNm + ", memPhone=" + memPhone + ", carName="
				+ carName + ", testDriveDt=" + testDriveDt + ", approvalStatus=" + approvalStatus + "]";
	}
	
	
	
	

}
