package com.itwillbs.domain;

import java.sql.Timestamp;

public class PayDTO {

	private int payNum; // 결제번호
	private int reservationNum; // 예약 번호
	private int payPrice; // 결제 금액
	private String payMethod;// 결제 수단
	private Timestamp payDate; // 결제 일시
	
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public int getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	
	
	
}
