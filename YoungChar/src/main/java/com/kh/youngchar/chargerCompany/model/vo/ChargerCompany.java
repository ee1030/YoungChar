package com.kh.youngchar.chargerCompany.model.vo;

public class ChargerCompany {
	
	private int companyNo;
	private String companyName;
	private String phone;
	private String fax;
	private String email;
	private String link;
	private String companyContent;
	private int memberNo;
	private String status;
	private String introduction;
	private String itemA;
	private String itemB;
	
	
	public ChargerCompany() {}


	public ChargerCompany(int companyNo, String companyName, String phone, String fax, String email, String link,
			String companyContent, int memberNo, String status, String introduction, String itemA, String itemB) {
		super();
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.phone = phone;
		this.fax = fax;
		this.email = email;
		this.link = link;
		this.companyContent = companyContent;
		this.memberNo = memberNo;
		this.status = status;
		this.introduction = introduction;
		this.itemA = itemA;
		this.itemB = itemB;
	}


	public int getCompanyNo() {
		return companyNo;
	}


	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getFax() {
		return fax;
	}


	public void setFax(String fax) {
		this.fax = fax;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public String getCompanyContent() {
		return companyContent;
	}


	public void setCompanyContent(String companyContent) {
		this.companyContent = companyContent;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}


	public String getItemA() {
		return itemA;
	}


	public void setItemA(String itemA) {
		this.itemA = itemA;
	}


	public String getItemB() {
		return itemB;
	}


	public void setItemB(String itemB) {
		this.itemB = itemB;
	}


	@Override
	public String toString() {
		return "ChargerCompany [companyNo=" + companyNo + ", companyName=" + companyName + ", phone=" + phone + ", fax="
				+ fax + ", email=" + email + ", link=" + link + ", companyContent=" + companyContent + ", memberNo="
				+ memberNo + ", status=" + status + ", introduction=" + introduction + ", itemA=" + itemA + ", itemB="
				+ itemB + "]";
	}
	
	

	
}
