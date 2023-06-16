package com.ksh.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    /*@RequestMapping(value = "/get_orders", method = RequestMethod.GET)
    public String getOrders(Model model) {
        List<OrdersVO> ordersList = os.getAllOrders();
        System.out.println("ordersList=" + ordersList);
        model.addAttribute("ordersList", ordersList);
        return "orders"; //~.jsp
    }*/
    
    //총무과 진료과별&요청일자 로 발주리스트 select
    @RequestMapping(value = "/purchasePlan", method = RequestMethod.POST)
	public ResponseEntity<?> requestList(OrdersVO orders) {
    	System.out.println(orders);
		System.out.println(os.requestList(orders));
		//model.addAttribute("dept_manager_name", orders);
		
		/*	ArrayList<OrdersVO> or = os.requestList(orders);
		if (or == null) {
		    // 조회 데이터가 없는 경우
		    model.addAttribute("msg", "조회 데이터 없음");
		    // model.addAttribute("url", "table");
		    
		    // 클라이언트에게 alert 띄우는 JavaScript 코드
		    String script = "<script>alert('조회 데이터 없음');</script>";
		    model.addAttribute("script", script);
		
		    return new ResponseEntity<>(os.requestList(orders), HttpStatus.OK);
		}*/
		
		return new ResponseEntity<>(os.requestList(orders), HttpStatus.OK);
	}
	
    @RequestMapping(value = "/requestListmodal", method = RequestMethod.GET) 
    public String modalOpen() {
    	return "requestListModal";
    }
  
    //"요청 조회" 클릭후 모달 열기
    @RequestMapping(value = "/requestListmodal", method = RequestMethod.POST)
    public ResponseEntity<?> getDataList(OrdersVO orders) {
    	System.out.println(orders);
    	System.out.println(os.getDataList(orders));
        // 데이터를 DB에서 가져오는 로직을 구현합니다. 
        // 가져온 데이터를 YourDataModel 타입의 리스트로 가정하겠습니다.
        //List<OrdersVO> dataList = os.getDataList(OrdersVO orders);

        // 가져온 데이터를 JSON 형식으로 변환하여 응답합니다.
        return new ResponseEntity<>(os.getDataList(orders), HttpStatus.OK);
    }
    
}
