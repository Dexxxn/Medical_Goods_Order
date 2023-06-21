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
	
	public ArrayList<InventoryVO> ph(String dept, String name, String date);

	ArrayList<InventoryVO> getInventoryList();

	List<InventoryVO> si(String supplier, String name, String date);

	List<InventoryVO> getInventoryList1();
}