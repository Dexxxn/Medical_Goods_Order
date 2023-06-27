package com.ksh.model;

public class Form2VO {
	private String item_id; //의약품코드
	private String item_name; //의약품명
	private String supplier; //구매처명
	private String standard; //규격
	private String unit; //단위
	private int unit_price; //단가
	private int order_quantity; //발주수량
	private int supply_value; //공급가액(면세금액)("단가 * 발주수량")
	private int vat; //부가세
	private int total_amount; //(1품목구매)총액
	private String significant; //특이사항- "안전재고수 기준은 충족하였으나, 재고 불충분으로 발주 必"
	private String requestDate; //발주요청일자
	private String confirm; //총무과 최종확인발주일(date)
	
	private String dept;
	private String name;
	private String receiptDate; //입고일자
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
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
	public int getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getSupply_value() {
		return supply_value;
	}
	public void setSupply_value(int supply_value) {
		this.supply_value = supply_value;
	}
	public int getVat() {
		return vat;
	}
	public void setVat(int vat) {
		this.vat = vat;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public String getSignificant() {
		return significant;
	}
	public void setSignificant(String significant) {
		this.significant = significant;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
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
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	@Override
	public String toString() {
		return "Form2VO [item_id=" + item_id + ", item_name=" + item_name + ", supplier=" + supplier + ", standard="
				+ standard + ", unit=" + unit + ", unit_price=" + unit_price + ", order_quantity=" + order_quantity
				+ ", supply_value=" + supply_value + ", vat=" + vat + ", total_amount=" + total_amount
				+ ", significant=" + significant + ", requestDate=" + requestDate + ", confirm=" + confirm + ", dept="
				+ dept + ", name=" + name + ", receiptDate=" + receiptDate + "]";
	}
	
	
}
