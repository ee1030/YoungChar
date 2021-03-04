package com.kh.youngchar.cars.model.vo;

public class Cars {
	private int carNo;
	private String carName;
	private String carModel;
	private String drivingSystem;
	private int personnel;
	private double consumpt;
	private int minPrice;
	private int maxPrice;
	private String fuel;
	private double mileage;
	private double capacity;
	private double maxPower;
	private double maxTorque;
	private double maxSpeed;
	private double performance;
	private int categoryCode;
	private String categoryName;
	
	public Cars() {}

	public Cars(int carNo, String carName, String carModel, String drivingSystem, int personnel, double consumpt,
			int minPrice, int maxPrice, String fuel, double mileage, double capacity, double maxPower, double maxTorque,
			double maxSpeed, double performance, int categoryCode, String categoryName) {
		super();
		this.carNo = carNo;
		this.carName = carName;
		this.carModel = carModel;
		this.drivingSystem = drivingSystem;
		this.personnel = personnel;
		this.consumpt = consumpt;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.fuel = fuel;
		this.mileage = mileage;
		this.capacity = capacity;
		this.maxPower = maxPower;
		this.maxTorque = maxTorque;
		this.maxSpeed = maxSpeed;
		this.performance = performance;
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
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

	public String getDrivingSystem() {
		return drivingSystem;
	}

	public void setDrivingSystem(String drivingSystem) {
		this.drivingSystem = drivingSystem;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public double getConsumpt() {
		return consumpt;
	}

	public void setConsumpt(double consumpt) {
		this.consumpt = consumpt;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public double getMileage() {
		return mileage;
	}

	public void setMileage(double mileage) {
		this.mileage = mileage;
	}

	public double getCapacity() {
		return capacity;
	}

	public void setCapacity(double capacity) {
		this.capacity = capacity;
	}

	public double getMaxPower() {
		return maxPower;
	}

	public void setMaxPower(double maxPower) {
		this.maxPower = maxPower;
	}

	public double getMaxTorque() {
		return maxTorque;
	}

	public void setMaxTorque(double maxTorque) {
		this.maxTorque = maxTorque;
	}

	public double getMaxSpeed() {
		return maxSpeed;
	}

	public void setMaxSpeed(double maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	public double getPerformance() {
		return performance;
	}

	public void setPerformance(double performance) {
		this.performance = performance;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "CarsDAO [carNo=" + carNo + ", carName=" + carName + ", carModel=" + carModel + ", drivingSystem="
				+ drivingSystem + ", personnel=" + personnel + ", consumpt=" + consumpt + ", minPrice=" + minPrice
				+ ", maxPrice=" + maxPrice + ", fuel=" + fuel + ", mileage=" + mileage + ", capacity=" + capacity
				+ ", maxPower=" + maxPower + ", maxTorque=" + maxTorque + ", maxSpeed=" + maxSpeed + ", performance="
				+ performance + ", categoryCode=" + categoryCode + ", categoryName=" + categoryName + "]";
	}
}
