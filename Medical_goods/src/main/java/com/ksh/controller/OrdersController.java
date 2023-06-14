package com.ksh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.model.OrdersVO;
import com.ksh.service.OrdersService;

@Controller
public class OrdersController {
	@Autowired
	OrdersService os;
	
	// 진료부서별 ->> 발주요청 insert
	
    @RequestMapping(value = "/purchase_request", method = RequestMethod.POST)
    public String purchaseRequest(List<OrdersVO> ordersList) {
        System.out.println("aaaaa");	
        System.out.println("ordersList=" + ordersList);
        os.insertOrders(ordersList);
        // 그냥 aside.jsp로 가면 서버주소에 insert하는 값이 남게됨
        // .jsp가 아닌 .jsp로 리턴되는 서버로 이동해야함
        return "redirect:/";
    }
	
	// 총무과  <<- 발주요청 select여러건<List> 
    @RequestMapping(value = "/get_orders", method = RequestMethod.GET)
    public String getOrders(Model model) {
        List<OrdersVO> ordersList = os.getAllOrders();
        System.out.println("ordersList=" + ordersList);
        model.addAttribute("ordersList", ordersList);
        return "orders"; //~.jsp
    }
	
	
}
