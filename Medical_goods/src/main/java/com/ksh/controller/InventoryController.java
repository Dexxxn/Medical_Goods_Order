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
		return new ResponseEntity<>(is.select1(inven),HttpStatus.OK); 
	}
	
	// 사용 수량 입력을 위한 의약품 리스트
	@RequestMapping(value = "/useList", method = RequestMethod.POST)
	public ResponseEntity <?> useList(InventoryVO inven){
		System.out.println(is.useList(inven));
		return new ResponseEntity<>(is.useList(inven),HttpStatus.OK); 
	}
	
	/*
	// 사용 수량 입력(insert)
	@RequestMapping(value = "/useInsert", method = RequestMethod.POST)
	public String useInsert(InventoryVO inven, HttpSession session, Model model) {
		//is.useInsert(inven);
		System.out.println(inven);// 어떤 값을 받았는지 콘솔에서 확인
		System.out.println(ms.useInsert(inven));// 로그인할때 입력한 정보가 null값인지 콘솔에서 확인
		if(ms.logIn(inven) == null) {
			model.addAttribute("msg", "정확한 아이디 또는 비밀번호를 입력하세요.");
			model.addAttribute("url", "/");
			return "alert";
		}
		else {
			session.setAttribute("login", is.useInsert(inven));			
			String s_name = ((InventoryVO) session.getAttribute("login")).getS_name();
			model.addAttribute("msg", s_name + "님으로 로그인 되었습니다.");
			model.addAttribute("url", "index");
			return "alert";	// return "redirect:'/'" 도 가능 -> redirect: '반드시 서버주소'
		}
	};
*/
	
}