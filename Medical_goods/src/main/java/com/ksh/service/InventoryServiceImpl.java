package com.ksh.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.InventoryMapper;
import com.ksh.model.InventoryVO;
import com.ksh.model.OrdersVO;

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

	public ArrayList<InventoryVO> modalList(InventoryVO inven) {
		return im.modalList(inven);
	}
	
	public void useInsert(InventoryVO inven) {
		
		inven.getFormvo().forEach(formvo->{
			System.out.println("service="+formvo);
			
			// InventoryVO에 있는 dept를 가져와서 FormVO에 있는 dept에 저장
			formvo.setDept(inven.getDept());
			// InventoryVO에 있는 date를 가져와서 FormVO에 있는 date에 저장
			formvo.setDate(inven.getDate());
			// InventoryVO에 있는 name를 가져와서 FormVO에 있는 name에 저장
			formvo.setName(inven.getName());
			
			im.useInsert(formvo);
		});
	}
	
	public ArrayList<InventoryVO> orderModal(InventoryVO inven){
		return im.orderModal(inven);
	}; 
	
	public ArrayList<InventoryVO> orderList(InventoryVO inven){
		return im.orderList(inven);
	};

	public void orderInsert(OrdersVO orders) {
		
		orders.getFormordervo().forEach(form2vo->{
			System.out.println("service="+form2vo);
			
			// InventoryVO에 있는 dept를 가져와서 FormVO에 있는 dept에 저장
			form2vo.setDept(orders.getDept());
			// InventoryVO에 있는 date를 가져와서 FormVO에 있는 date에 저장
			form2vo.setRequestDate(orders.getRequestDate());
			// InventoryVO에 있는 name를 가져와서 FormVO에 있는 name에 저장
			form2vo.setName(orders.getName());
			
			im.orderInsert(form2vo);
		});
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

	@Override
	public List<String> getAllItems() {
		// 데이터베이스에서 모든 물품을 가져오는 로직을 구현합니다.
		// 구현 예시:
		return im.getAllItems();
	}

	@Override
	public List<String> getItemsByDept(String dept) {
		// 데이터베이스에서 해당 부서의 모든 물품을 가져오는 로직을 구현합니다.
		// 구현 예시:
		return im.getItemsByDept(dept);
	}

	@Override
	public List<String> getDateData(String dept, String item_name) {
		// 데이터베이스에서 해당 부서와 물품에 대한 날짜 데이터를 가져오는 로직을 구현합니다.
		// 구현 예시:
		return im.getDateData(dept, item_name);
	}

	@Override
	public List<Integer> qd(String dept, String item_name) {
		// 데이터베이스에서 해당 부서에 대한 수량 데이터를 가져오는 로직을 구현합니다.
		// 구현 예시:
		return im.qd(dept, item_name);
	}

	@Override
	public List<String> top5(String dept) {
		// 해당 부서에서 안전재고수량이 많은 상위 다섯 가지 물품을 가져오는 로직을 구현합니다.
		// 구현 예시:
		return im.top5(dept);
	}

}