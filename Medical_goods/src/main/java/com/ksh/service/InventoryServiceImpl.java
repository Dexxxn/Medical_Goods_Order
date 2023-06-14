package com.ksh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.InventoryMapper;
import com.ksh.model.InventoryVO;

@Service
public class InventoryServiceImpl implements InventoryService{

	@Autowired
	InventoryMapper im;
	
	public ArrayList<InventoryVO> select1(InventoryVO inven) {
		return im.select1(inven);
	}
	
	public ArrayList<InventoryVO> useList(InventoryVO inven){
		return im.useList(inven);
	}
}