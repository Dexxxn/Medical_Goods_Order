package com.ksh.service;

import java.util.ArrayList;

import com.ksh.model.InventoryVO;

public interface InventoryService {

	// 전체 재고 현황
	public ArrayList<InventoryVO> select1(InventoryVO inven);

	// 사용 수량 입력 리스트
	public ArrayList<InventoryVO> useList(InventoryVO inven);

	public ArrayList<InventoryVO> ph(String dept, String name, String date);

	ArrayList<InventoryVO> getInventoryList();
}