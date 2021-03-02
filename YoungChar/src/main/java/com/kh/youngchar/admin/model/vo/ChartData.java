package com.kh.youngchar.admin.model.vo;

public class ChartData {
	
	private String dataName;
	private int value;
	
	public ChartData() {}

	public ChartData(String dataName, int value) {
		super();
		this.dataName = dataName;
		this.value = value;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "ChartData [dataName=" + dataName + ", value=" + value + "]";
	}
}
