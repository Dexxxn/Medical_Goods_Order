package com.ksh.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.mapper.OrdersMapper;
import com.ksh.model.OrdersVO;

@Service
public class OrdersServiceImpl implements OrdersService{
    
    @Autowired
    OrdersMapper om;

    @Override
    @Transactional
    public void insertOrders(List<OrdersVO> ordersList) {
        for (OrdersVO orders : ordersList) {
        	om.insertOrder(orders);
        }
    }
    
    // 총무과  <<- 발주요청 select
    public ArrayList<OrdersVO> requestList(OrdersVO orders) {
		return om.requestList(orders);
	}
    
    //모달열기
    public ArrayList<OrdersVO> getDataList(OrdersVO orders){
    	return om.getDataList(orders);
    }
    
    
 
    /*public void updateConfirmDateForItems(List<OrdersVO> orders) {
    	om.updateConfirmDateForItems(orders);
    }*/
    
    public void updateConfirmDateForItems(List<OrdersVO> orders) {
        for (OrdersVO order : orders) {
            om.updateConfirmDateForItem(order);
        }
    }
    
    
    
}