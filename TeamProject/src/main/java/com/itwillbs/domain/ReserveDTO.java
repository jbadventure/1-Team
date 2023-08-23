package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReserveDTO {

	private int reserveNum; // 예약 번호
	private int classNum; // 해당 클래스 번호
	private Timestamp reserveDate; // 예약일시
	private int reserveGuestNum; // 예약자 회원 번호 
	private int theNumOfReserveGuest; // 예약 인수
	
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public Timestamp getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Timestamp reserveDate) {
		this.reserveDate = reserveDate;
	}
	public int getReserveGuestNum() {
		return reserveGuestNum;
	}
	public void setReserveGuestNum(int reserveGuestNum) {
		this.reserveGuestNum = reserveGuestNum;
	}
	public int getTheNumOfReserveGuest() {
		return theNumOfReserveGuest;
	}
	public void setTheNumOfReserveGuest(int theNumOfReserveGuest) {
		this.theNumOfReserveGuest = theNumOfReserveGuest;
	}
	
	
	
}
