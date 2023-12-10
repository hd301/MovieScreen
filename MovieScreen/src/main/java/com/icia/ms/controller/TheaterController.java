package com.icia.ms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dto.TheaterDTO;
import com.icia.ms.service.TheaterService;

@Controller
public class TheaterController {

	private ModelAndView mav;

	@Autowired
	private TheaterService tsvc;

	// TR01 : 영화관 등록 페이지 이동
	@RequestMapping(value = "/tRegiForm", method = RequestMethod.GET)
	public String tRegiForm() {

		return "theater/register";
	}

	// TR02 : 영화관 등록
	@RequestMapping(value = "/tRegister", method = RequestMethod.POST)
	public ModelAndView tRegister(@ModelAttribute TheaterDTO theater) {
		System.out.println("[1] jsp → controller : " + theater);
		mav = tsvc.tRegister(theater);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// TL03 : 영화관 목록
	@RequestMapping(value = "/tList", method = RequestMethod.GET)
	public ModelAndView tList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "tList", required = false, defaultValue = "5") int limit) {
		System.out.println("[1] jsp → controller / page : " + page + ", limit : " + limit);

		mav = tsvc.tList(page, limit);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// TV04 : 영화관 정보 상세보기
	@RequestMapping(value = "/tView", method = RequestMethod.GET)
	public ModelAndView tView(@RequestParam("thName") String thName) {
		System.out.println("[1] jsp → controller : " + thName);

		mav = tsvc.tView(thName);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// TM05 : 영화관정보 수정페이지 이동
	@RequestMapping(value = "/tModiForm", method = RequestMethod.GET)
	public ModelAndView tModiForm(@RequestParam("thNo") int thNo) {
		System.out.println("[1] jsp → controller : " + thNo);
		mav = tsvc.tModiForm(thNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// TM06 : 영화관 정보 수정
	@RequestMapping(value = "/tModify", method = RequestMethod.POST)
	public ModelAndView tModify(@ModelAttribute TheaterDTO theater) {
		System.out.println("[1] jsp → controller : " + theater);
		mav = tsvc.tModify(theater);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// TD07 : 영화관 삭제
	@RequestMapping(value = "/tDelete", method = RequestMethod.GET)
	public ModelAndView tDelete(@RequestParam("thNo") int thNo) {
		System.out.println("[1] jsp → controller : " + thNo);
		mav = tsvc.tDelete(thNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/setTheaters", method = RequestMethod.POST)
	public @ResponseBody List<String> setTheaters() {
		List<String> list = tsvc.setTheaters();
		return list;
	}
}
