package com.ksh.model;

public class ItemsVO {
	private String item_name;
	private String item_id;
	private String standard;
	private String unit;
	private String item_description;
	private String category;
	private String supplier;
	private String TEL;
	private String CRN;
	private String address;
	private int unit_price;
	private int minimum_purchase_quantity;

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

	public String getItem_description() {
		return item_description;
	}

	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getCRN() {
		return CRN;
	}

	public void setCRN(String cRN) {
		CRN = cRN;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}

	public int getMinimum_purchase_quantity() {
		return minimum_purchase_quantity;
	}

	public void setMinimum_purchase_quantity(int minimum_purchase_quantity) {
		this.minimum_purchase_quantity = minimum_purchase_quantity;
	}

	@Override
	public String toString() {
		return "itemsVO [item_name=" + item_name + ", item_id=" + item_id + ", standard=" + standard + ", unit=" + unit
				+ ", item_description=" + item_description + ", category=" + category + ", supplier=" + supplier
				+ ", TEL=" + TEL + ", CRN=" + CRN + ", address=" + address + ", unit_price=" + unit_price
				+ ", minimum_purchase_quantity=" + minimum_purchase_quantity + "]";
	}

}
