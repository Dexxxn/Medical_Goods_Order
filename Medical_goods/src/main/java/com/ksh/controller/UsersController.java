package com.ksh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksh.model.UsersVO;
import com.ksh.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	UsersService us;

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String logIn(UsersVO users, HttpSession session, Model model) {
		System.out.println(users);
		System.out.println(us.logIn(users));
		if (us.logIn(users) == null) {
			model.addAttribute("msg", "정확한 아이디 또는 비밀번호를 입력하세요.");
			model.addAttribute("url", "/");
			return "alert";
		} else {
			session.setAttribute("login", us.logIn(users));
			String name = ((UsersVO) session.getAttribute("login")).getName();
			model.addAttribute("msg", name + "님으로 로그인 되었습니다.");
			model.addAttribute("url", "index");
			return "alert";
		}
	};

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
