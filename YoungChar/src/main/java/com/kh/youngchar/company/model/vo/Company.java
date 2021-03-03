package com.kh.youngchar.company.model.vo;

public class Company {
	
	private int memNo;
	private String memId;
	private String cooName; 
	private String categoryNm;
	private String cooNo;
	private String memImgPath;
	private String memImgName;
	
	public Company() {}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getCooName() {
		return cooName;
	}

	public void setCooName(String cooName) {
		this.cooName = cooName;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public String getCooNo() {
		return cooNo;
	}

	public void setCooNo(String cooNo) {
		this.cooNo = cooNo;
	}

	public String getMemImgPath() {
		return memImgPath;
	}

	public void setMemImgPath(String memImgPath) {
		this.memImgPath = memImgPath;
	}

	public String getMemImgName() {
		return memImgName;
	}

	public void setMemImgName(String memImgName) {
		this.memImgName = memImgName;
	}

	@Override
	public String toString() {
		return "Company [memNo=" + memNo + ", memId=" + memId + ", cooName=" + cooName + ", categoryNm=" + categoryNm
				+ ", cooNo=" + cooNo + ", memImgPath=" + memImgPath + ", memImgName=" + memImgName + "]";
	}

	
	
	

	

}
