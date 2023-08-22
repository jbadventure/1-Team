package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	
//	alt - shift - s  => shift s
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", date=" + date + "]";
	}
	
//	alt - shift - s => r
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
