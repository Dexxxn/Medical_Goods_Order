package com.ksh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/z", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "login";
	}

	/*
	 * @RequestMapping(value = "/index", method = RequestMethod.GET) public String
	 * index() { return "index"; }
	 */

	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart() {
		return "chart";
	}

	@RequestMapping(value = "/modal", method = RequestMethod.GET)
	public String modal() {
		return "modal";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return "notice";
	}

	@RequestMapping(value = "/spe", method = RequestMethod.GET)
	public String spe() {
		return "spe";
	}

	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public String pur() {
		return "purchase";
	}

	/*
	 * @RequestMapping(value = "/ts", method = RequestMethod.GET) public String ts()
	 * { return "ts"; }
	 */

	@RequestMapping(value = "/ph", method = RequestMethod.GET)
	public String ph() {
		return "ph";
	}

	/*
	 * @RequestMapping(value = "/ph_detail", method = RequestMethod.GET) public
	 * String ph1() { return "ph1"; }
	 */

	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String table() {
		return "table";
	}

	@RequestMapping(value = "/table_only", method = RequestMethod.GET)
	public String table_only() {
		return "table_only";
	}

	@RequestMapping(value = "/modal_alert", method = RequestMethod.GET)
	public String modal_alert() {
		return "modal_alert";
	}

	// 수량입력 품목 리스트
	@RequestMapping(value = "/useList", method = RequestMethod.GET)
	public String useList() {
		return "table_only";
	}
	
	// 발주요청서 리스트
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderRequest() {
		return "table";
	}

	// 총무("발주계획서작성" 첫페이지로 이동)
	@RequestMapping(value = "/purchasePlan", method = RequestMethod.GET)
	public String orderPlanning() {
		return "table";
	}
}
