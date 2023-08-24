package com.itwillbs.domain;

public class MemberDTO {
	
	private int memberNum; // 게스트 회원 번호
	private String memberId; // 게스트 아이디
	private String memberPassword; // 게스트 패스워드
	private String memberName; // 게스트 이름
	private String memberNickname; // 게스트 닉네임
	private String memberGender; // 게스트 성별
	private String memberBirthday; // 게스트 생년월일
	private String memberPhoneNum; // 게스트 휴대 전화번호
	private String memberEmail; // 게스트 이메일
	private String memberType; // 회원 타입(guest, host)
	private String memberLocation; // 게스트 선호 지역
	private String businessNum; // 사업자 번호
	private String mailOrderNum; // 통신판매업 신고번호
	private String memberProfileImagePath; // 게스트 프로필 사진 경로
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberBirthday() {
		return memberBirthday;
	}
	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	public String getMemberPhoneNum() {
		return memberPhoneNum;
	}
	public void setMemberPhoneNum(String memberPhoneNum) {
		this.memberPhoneNum = memberPhoneNum;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getMemberLocation() {
		return memberLocation;
	}
	public void setMemberLocation(String memberLocation) {
		this.memberLocation = memberLocation;
	}
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getMailOrderNum() {
		return mailOrderNum;
	}
	public void setMailOrderNum(String mailOrderNum) {
		this.mailOrderNum = mailOrderNum;
	}
	public String getMemberProfileImagePath() {
		return memberProfileImagePath;
	}
	public void setMemberProfileImagePath(String memberProfileImagePath) {
		this.memberProfileImagePath = memberProfileImagePath;
	}
	
	
}
