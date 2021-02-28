package com.kh.youngchar.member.model.vo;

import java.sql.Timestamp;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberNm;
	private String nickName;
	private String memberEmail;
	private String phone;
	private String memberAddr;
	private String memberGrade;
	private String memberStatus;
	private Timestamp signDt;
	
	//-----------업체---------------
	
	private String cooNumber;
	private String brandCategory;
	
	
	public Member() {	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}


	public String getMemberNm() {
		return memberNm;
	}


	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMemberAddr() {
		return memberAddr;
	}


	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}


	public String getMemberGrade() {
		return memberGrade;
	}


	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}


	public String getMemberStatus() {
		return memberStatus;
	}


	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}


	public Timestamp getSignDt() {
		return signDt;
	}


	public void setSignDt(Timestamp signDt) {
		this.signDt = signDt;
	}


	public String getCooNumber() {
		return cooNumber;
	}


	public void setCooNumber(String cooNumber) {
		this.cooNumber = cooNumber;
	}


	public String getBrandCategory() {
		return brandCategory;
	}


	public void setBrandCategory(String brandCategory) {
		this.brandCategory = brandCategory;
	}


	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberNm="
				+ memberNm + ", nickName=" + nickName + ", memberEmail=" + memberEmail + ", phone=" + phone
				+ ", memberAddr=" + memberAddr + ", memberGrade=" + memberGrade + ", memberStatus=" + memberStatus
				+ ", signDt=" + signDt + ", cooNumber=" + cooNumber + ", brandCategory=" + brandCategory + "]";
	}
	
	
}
