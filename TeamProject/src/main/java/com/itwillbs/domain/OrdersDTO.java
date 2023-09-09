package com.itwillbs.domain;

import java.sql.Timestamp;

public class OrdersDTO {
	
	private int ordersNum;
	private String ordersId;
	private int classNum;
	private String ordersDate;
	private int ordersAmount;
	private int totalPrice;
	private String payDate;
	private String payMethod;
	private String classSubject;
	private String classFile; // 클래스 첨부파일
	
	public int getOrdersNum() {
		return ordersNum;
	}
	public void setOrdersNum(int ordersNum) {
		this.ordersNum = ordersNum;
	}
	public String getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}
	public int getOrdersAmount() {
		return ordersAmount;
	}
	public void setOrdersAmount(int ordersAmount) {
		this.ordersAmount = ordersAmount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getClassSubject() {
		return classSubject;
	}
	public void setClassSubject(String classSubject) {
		this.classSubject = classSubject;
	}
	public String getClassFile() {
		return classFile;
	}
	public void setClassFile(String classFile) {
		this.classFile = classFile;
	}
	
	

}
