package com.ksh.service;

import java.util.ArrayList;
import java.util.List;

import com.ksh.model.InventoryVO;

public interface InventoryService {

	// 전체 재고 현황
	public ArrayList<InventoryVO> select1(InventoryVO inven);

	// 사용 수량 입력 리스트
	public ArrayList<InventoryVO> useList(InventoryVO inven);
	
	// 모달 전체 의약품 리스트
	public ArrayList<InventoryVO> modalList(InventoryVO inven);
	
	// 사용 수량 입력(insert)
	public void useInsert(InventoryVO inven);
	
	// 발주요청 리스트
	public ArrayList<InventoryVO> orderList(InventoryVO inven);
	
	
	public ArrayList<InventoryVO> ph(String dept, String name, String date);

	ArrayList<InventoryVO> getInventoryList();

	List<InventoryVO> si(String supplier, String name, String date);

	List<InventoryVO> getInventoryList1();

	List<String> getAllItems();

	List<String> getItemsByDept(String dept);

	List<String> getDateData(String dept, String item_name);

	List<Integer> qd(String dept, String item_name);

	List<String> top5(String dept);

}