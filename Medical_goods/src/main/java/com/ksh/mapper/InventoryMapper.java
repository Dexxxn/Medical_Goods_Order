package com.ksh.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ksh.model.Form2VO;
import com.ksh.model.FormVO;
import com.ksh.model.InventoryVO;

public interface InventoryMapper {

	public ArrayList<InventoryVO> select1(InventoryVO inven);

	public ArrayList<InventoryVO> useList(InventoryVO inven);

	public ArrayList<InventoryVO> modalList(InventoryVO inven);

	public void useInsert(InventoryVO inven);
	
	public void useInsert(FormVO formvo);

	public ArrayList<InventoryVO> orderModal(InventoryVO inven);
	
	public ArrayList<InventoryVO> orderList(InventoryVO inven);

	public void orderInsert(Form2VO form2vo);

	ArrayList<InventoryVO> ph(@Param("dept") String dept, @Param("name") String name, @Param("date") String date);

	ArrayList<InventoryVO> getInventoryList();

	List<InventoryVO> si(@Param("supplier") String supplier, @Param("name") String name, @Param("date") String date);

	List<InventoryVO> getInventoryList1();

	List<String> getAllItems();

	List<String> getItemsByDept(@Param("dept") String dept);

	List<String> getDateData(@Param("dept") String dept, @Param("item_name") String item_name);

	List<Integer> qd(@Param("dept") String dept, @Param("item_name") String item_name);

	List<String> top5(@Param("dept") String dept);
}