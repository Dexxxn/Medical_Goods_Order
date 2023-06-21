package com.ksh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
    
    //총무과 진료과별&요청일자 로 발주리스트 select
    @RequestMapping(value = "/purchasePlan", method = RequestMethod.POST)
	public ResponseEntity<?> requestList(OrdersVO orders, Model model) {
    	System.out.println(orders);
		System.out.println(os.requestList(orders));
		
		List<OrdersVO> requestList = os.requestList(orders);
		model.addAttribute("orders", requestList);
		
		 return new ResponseEntity<>(requestList, HttpStatus.OK);
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
    
   
    
    @RequestMapping(value = "/requestList", method = RequestMethod.POST) 
    public String openRequestListModal() {
    	return "requestListModal";
    }
    
    //모달alert
    @RequestMapping(value = "/modal_alert_sendEmail", method = RequestMethod.GET) 
    public String sendEmail() {
    	return "modal_alert";
    }
    
    
    //모달alert
    @RequestMapping(value = "/modal_alert_ok", method = RequestMethod.GET) 
    public String sendEmailOK() {
    	return "modal_alert";
    }
    
  //여러개의 체크된 값들을 서버로 보내기 confirm열 하나에만 insert--------------------------------------------------------------------------------- 
    
  /*  @RequestMapping(value= "/insert_confirm", method = RequestMethod.POST)
    public ResponseEntity<String> handleSelectedItems(@RequestBody List<OrdersVO> selectedItems) {
        // 선택된 체크박스 값들에 대한 처리 로직을 구현합니다.
        // selectedItems 리스트를 이용하여 DB에 저장하고 confirm 열을 업데이트하는 등의 작업을 수행합니다.

    	
    	os.updateConfirm(selectedItems);
    	
        // 처리가 성공적으로 이루어졌을 경우 응답
        return ResponseEntity.ok("Data received successfully");
      }
    */
    
    //modal_alert.jsp에 okbutton()
  /*  @RequestMapping(value= "/updateOrders", method = RequestMethod.POST)
    public ResponseEntity<Void> updateOrders(@RequestBody List<String> itemIds) {
        try {
            os.updateConfirmDateForItems(itemIds);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            // Log the exception here
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    */
}
