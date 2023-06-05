package com.ksh.model;

public class UsersVO {

	private String s_id;
	private String s_password;
	private String s_person_in_charge;
	private String s_dept;

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_password() {
		return s_password;
	}

	public void setS_password(String s_password) {
		this.s_password = s_password;
	}

	public String getS_person_in_charge() {
		return s_person_in_charge;
	}

	public void setS_person_in_charge(String s_person_in_charge) {
		this.s_person_in_charge = s_person_in_charge;
	}

	public String getS_dept() {
		return s_dept;
	}

	public void setS_dept(String s_dept) {
		this.s_dept = s_dept;
	}

	@Override
	public String toString() {
		return "UsersVO [s_id=" + s_id + ", s_password=" + s_password + ", s_person_in_charge=" + s_person_in_charge
				+ ", s_dept=" + s_dept + "]";
	}
}
