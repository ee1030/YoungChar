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
	
	public ChargerCompany() {}

	public ChargerCompany(int companyNo, String companyName, String phone, String fax, String email, String link,
			String companyContent, int memberNo, String status) {
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

	@Override
	public String toString() {
		return "ChargerCompany [companyNo=" + companyNo + ", companyName=" + companyName + ", phone=" + phone + ", fax="
				+ fax + ", email=" + email + ", link=" + link + ", companyContent=" + companyContent + ", memberNo="
				+ memberNo + ", status=" + status + "]";
	}

	
	

}
