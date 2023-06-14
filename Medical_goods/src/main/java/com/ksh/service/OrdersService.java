package com.ksh.service;

import java.util.List;

import com.ksh.model.OrdersVO;

public interface OrdersService {
	// 진료부서별 ->> 발주요청 insert
	 public void insertOrders(List<OrdersVO> ordersList);
	
	// 총무과  <<- 발주요청 select 
	// orders 테이블에서 모든 데이터를 가져오는 메서드
	 public List<OrdersVO> getAllOrders();
}
