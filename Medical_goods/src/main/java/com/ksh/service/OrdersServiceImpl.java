package com.ksh.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.mapper.OrdersMapper;
import com.ksh.model.InventoryVO;
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
   /* @Override
    public List<OrdersVO> getAllOrders() {
        return om.getAllOrders();
    }*/
    
    public ArrayList<OrdersVO> requestList(OrdersVO orders) {
		return om.requestList(orders);
	}
    
    //모달열기
    public ArrayList<OrdersVO> getDataList(OrdersVO orders){
    	return om.getDataList(orders);
    }
    
    
    //------------------
    public void updateConfirm(List<OrdersVO> selectedItems) {
        for (OrdersVO order : selectedItems) {
          // DB에서 해당하는 데이터를 찾아서 confirm 열을 업데이트하는 작업 수행
         /* 
          * OrdersVO existingOrder = om.findOrderByItemDetails(order.getDept(), order.getRequestDate(), order.getItem_id());
          if (existingOrder != null) {
            existingOrder.setConfirm("Y");
            */
            om.updateConfirm(order);
         // }
        }
      }
    
    
    
    
}
