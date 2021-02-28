package com.kh.youngchar.member.model.vo;

public class MemberFile {
	
	private int memImgNo;
	private String memImgPath;
	private String memImgName;
	private int memImgLevel;
	private int memNo;
	
	// 사이드메뉴에 필요해서 넣음
	private String cooName; 
	private String categoryNm;
	
	public MemberFile() {}
	
	
	// 일반 회원가입 프사용 생성자
	public MemberFile(String memImgPath, String memImgName, int memImgLevel, int memNo) {
		super();
		this.memImgPath = memImgPath;
		this.memImgName = memImgName;
		this.memImgLevel = memImgLevel;
		this.memNo = memNo;
	}



	public int getMemImgNo() {
		return memImgNo;
	}

	public void setMemImgNo(int memImgNo) {
		this.memImgNo = memImgNo;
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

	public int getMemImgLevel() {
		return memImgLevel;
	}

	public void setMemImgLevel(int memImgLevel) {
		this.memImgLevel = memImgLevel;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
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

	@Override
	public String toString() {
		return "MemberFile [memImgNo=" + memImgNo + ", memImgPath=" + memImgPath + ", memImgName=" + memImgName
				+ ", memImgLevel=" + memImgLevel + ", memNo=" + memNo + ", cooName=" + cooName + ", categoryNm="
				+ categoryNm + "]";
	}


	

}
