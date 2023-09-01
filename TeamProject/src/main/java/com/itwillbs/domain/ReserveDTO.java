package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReserveDTO {

private int reservationNum;
private int classNum;
private String reservationDate;
private String reservationId;
private int reservationAmount;
private String payComplete;

public int getReservationNum() {
	return reservationNum;
}
public void setReservationNum(int reservationNum) {
	this.reservationNum = reservationNum;
}
public int getClassNum() {
	return classNum;
}
public void setClassNum(int classNum) {
	this.classNum = classNum;
}

public String getReservationDate() {
	return reservationDate;
}
public void setReservationDate(String reservationDate) {
	this.reservationDate = reservationDate;
}
public String getReservationId() {
	return reservationId;
}
public void setReservationId(String reservationId) {
	this.reservationId = reservationId;
}
public int getReservationAmount() {
	return reservationAmount;
}
public void setReservationAmount(int reservationAmount) {
	this.reservationAmount = reservationAmount;
}
public String getPayComplete() {
	return payComplete;
}
public void setPayComplete(String payComplete) {
	this.payComplete = payComplete;
}



	
}
