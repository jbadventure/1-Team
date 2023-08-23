package com.itwillbs.domain;

import java.sql.Timestamp;

public class PaymentDTO {

	private int paymentNum; // 결제번호
	private int reserveNum; // 예약 번호
	private int paymentPrice; // 결제 금액
	private int paymentMethod;// 결제 수단
	private Timestamp paymentDate; // 결제 일시
	
	public int getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(int paymentNum) {
		this.paymentNum = paymentNum;
	}
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public int getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(int paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}
	
	
}
