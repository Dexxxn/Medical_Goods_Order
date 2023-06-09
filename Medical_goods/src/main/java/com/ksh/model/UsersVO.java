package com.ksh.model;

public class UsersVO {

	private String id;
	private String password;
	private String dept;
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "UsersVO [id=" + id + ", password=" + password + ", name=" + name + ", dept=" + dept + "]";
	}
}
