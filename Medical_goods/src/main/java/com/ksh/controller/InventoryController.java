package com.ksh.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.model.InventoryVO;
import com.ksh.service.InventoryService;

@Controller
public class InventoryController {
	
	// 비즈니스 모델을 컨트롤러에 연결하기
	@Autowired
	InventoryService is;
	
/*	@RequestMapping(value = "/inventory-status", method = RequestMethod.GET)
	// ResponseEntity: 비동기식은 결과가 js로 가기때문에 통신상태를 확인하기 위해 통신상태를 함께 보냄
	public ResponseEntity<ArrayList<InventoryVO>> getList(@PathVariable("dept") String dept){
		InventoryVO ivo = new InventoryVO();	// mapper.xml(if문 가공)에서 String dept(단순 변수) 처리 못함 반드시 VO에담아서 전달해야함
		ivo.setDept(dept);	//setter: VO에 데이터 저장하기 위함
		System.out.println(ivo);
		// 로그인 session값도 넘겨야겠지
		// model.addAttribute("data", fetchedData);
		return new ResponseEntity<>(is.select1(ivo),HttpStatus.OK);
		// return is.select1(ivo) // 이렇게해도 되지만 서버 통신상태를 확인하기 위해서는 위 코드를 쓸것
	}*/
	
	// 전체 재고 현황
	@RequestMapping(value = "/table_only", method = RequestMethod.POST)
	public ResponseEntity <?> select1(InventoryVO inven){
		System.out.println(is.select1(inven));
		return new ResponseEntity<>(is.select1(inven),HttpStatus.OK);// 
	}
	
}