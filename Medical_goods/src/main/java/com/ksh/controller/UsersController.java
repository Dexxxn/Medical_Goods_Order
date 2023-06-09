package com.ksh.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.model.UsersVO;
import com.ksh.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	UsersService us;

	@RequestMapping(value = "/ph/{dept}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<UsersVO>> getList(@PathVariable("dept") String dept) {
		UsersVO uvo = new UsersVO();
		uvo.setDept(dept);
		System.out.println(uvo);
		return new ResponseEntity<>(us.users1(uvo), HttpStatus.OK);
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String logIn(UsersVO users, HttpSession session, Model model) {
		if (us.logIn(users) == null) {
			model.addAttribute("msg", "정확한 아이디 또는 비밀번호를 입력하세요.");
			model.addAttribute("url", "/");
			return "alert";
		} else {
			session.setAttribute("login", us.logIn(users));
			String name = ((UsersVO) session.getAttribute("login")).getName();
			String department = ((UsersVO) session.getAttribute("login")).getDept(); // 사용자의 병동 정보 가져오기
			model.addAttribute("msg", name + "님으로 로그인 되었습니다.");
			model.addAttribute("url", "index");

			// 세션에 병동 정보 저장
			session.setAttribute("department", department);
			System.out.println("세션에 저장된 병동 정보: " + department);
			return "alert";
		}
	}

	// index.jsp
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		if (session.getAttribute("login") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("url", "/");
			return "alert";
		} else {
			return "index";
		}
	}
}
