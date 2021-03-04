package com.kh.youngchar.board.model.vo;

import java.util.Arrays;

public class Search {
	
	private String sk;
	private String sv;
	private String[] ct;
	private int boardType;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}

	public String getSk() {
		return sk;
	}

	public String getSv() {
		return sv;
	}

	public String[] getCt() {
		return ct;
	}

	public int getBoardType() {
		return boardType;
	}
	

	public void setSk(String sk) {
		this.sk = sk;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}

	public void setCt(String[] ct) {
		this.ct = ct;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", ct=" + Arrays.toString(ct) + ", boardType=" + boardType + "]";
	}
	
	
}
