package com.ksh.model;

public class FormVO {
	private String item_name;
	private String item_id;
	private String standard;
	private String unit;
	private int enter_quantity;
	private int available_stock;
	private int quantity_used;
	private int current_amount;
	private int safe_stock_quantity;
	private String significant;
	private String dept;
	private String date;
	private String name;
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getEnter_quantity() {
		return enter_quantity;
	}
	public void setEnter_quantity(int enter_quantity) {
		this.enter_quantity = enter_quantity;
	}
	public int getAvailable_stock() {
		return available_stock;
	}
	public void setAvailable_stock(int available_stock) {
		this.available_stock = available_stock;
	}
	public int getQuantity_used() {
		return quantity_used;
	}
	public void setQuantity_used(int quantity_used) {
		this.quantity_used = quantity_used;
	}
	public int getCurrent_amount() {
		return current_amount;
	}
	public void setCurrent_amount(int current_amount) {
		this.current_amount = current_amount;
	}
	public int getSafe_stock_quantity() {
		return safe_stock_quantity;
	}
	public void setSafe_stock_quantity(int safe_stock_quantity) {
		this.safe_stock_quantity = safe_stock_quantity;
	}
	public String getSignificant() {
		return significant;
	}
	public void setSignificant(String significant) {
		this.significant = significant;
	}
	@Override
	public String toString() {
		return "FormVO [item_name=" + item_name + ", item_id=" + item_id + ", standard=" + standard + ", unit=" + unit
				+ ", enter_quantity=" + enter_quantity + ", available_stock=" + available_stock + ", quantity_used="
				+ quantity_used + ", current_amount=" + current_amount + ", safe_stock_quantity=" + safe_stock_quantity
				+ ", significant=" + significant + ", dept=" + dept + ", date=" + date + ", name=" + name + "]";
	}
	
	
	
}
