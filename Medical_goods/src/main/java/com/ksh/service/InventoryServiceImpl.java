package com.ksh.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.InventoryMapper;
import com.ksh.model.InventoryVO;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryMapper im;

	public ArrayList<InventoryVO> select1(InventoryVO inven) {
		return im.select1(inven);
	}

	public ArrayList<InventoryVO> useList(InventoryVO inven) {
		return im.useList(inven);
	}

	public void useInsert(InventoryVO inven) {
		im.useInsert(inven);
	}
	
	@Override
	public ArrayList<InventoryVO> ph(String dept, String name, String date) {
		// 서버에서 데이터 조회
		ArrayList<InventoryVO> inventoryList = im.ph(dept, name, date);
		System.out.println(inventoryList);

		return inventoryList;
	}

	@Override
	public ArrayList<InventoryVO> getInventoryList() {
		return im.getInventoryList();
	}

	public List<InventoryVO> si(String supplier, String name, String date) {
		List<InventoryVO> inventoryList1 = im.si(supplier, name, date);
		System.out.println(inventoryList1);

		return inventoryList1;
	}

	@Override
	public List<InventoryVO> getInventoryList1() {
		return im.getInventoryList1();
	}

}