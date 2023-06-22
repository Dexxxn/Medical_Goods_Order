package com.ksh.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ksh.model.OrdersVO;

public interface OrdersMapper {
	// 진료부서별 ->> 발주요청 insert
	public void insertOrder(OrdersVO orders);
	
	// 총무과  <<- 발주요청 select( orders 테이블에서 모든 데이터를 가져오는 메서드 )
	public ArrayList<OrdersVO> requestList(OrdersVO orders);
	
	//모달열기
	public ArrayList<OrdersVO> getDataList(OrdersVO orders);
	

	 //public void updateConfirmDateForItems(@Param("list") List<OrdersVO> orders);
	//각각의 OrdersVO를 개별적으로 처리하고 있어서, 중복된 SQL문이 생성되고 오류 발생 중...
	
	void updateConfirmDateForItem(OrdersVO order);
	
	
}