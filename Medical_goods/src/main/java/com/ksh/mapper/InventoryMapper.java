package com.ksh.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ksh.model.InventoryVO;

public interface InventoryMapper {

	public ArrayList<InventoryVO> select1(InventoryVO inven);

	public ArrayList<InventoryVO> useList(InventoryVO inven);

	ArrayList<InventoryVO> ph(@Param("dept") String dept, @Param("name") String name, @Param("date") String date);

	ArrayList<InventoryVO> getInventoryList();
}