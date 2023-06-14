package com.ksh.service;

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
    @Override
    public List<OrdersVO> getAllOrders() {
        return om.getAllOrders();
    }
}
