package com.ksh.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ksh.model.InventoryVO;

public interface InventoryMapper {

	public ArrayList<InventoryVO> select1(InventoryVO inven);

	public ArrayList<InventoryVO> useList(InventoryVO inven);

	public ArrayList<InventoryVO> modalList(InventoryVO inven);
	
	public void useInsert(InventoryVO inven);
	
	ArrayList<InventoryVO> ph(@Param("dept") String dept, @Param("name") String name, @Param("date") String date);

	ArrayList<InventoryVO> getInventoryList();

	List<InventoryVO> si(@Param("supplier") String supplier, @Param("name") String name, @Param("date") String date);

	List<InventoryVO> getInventoryList1();
}