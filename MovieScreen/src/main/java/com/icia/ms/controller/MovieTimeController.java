package com.icia.ms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dto.MovieTimeDTO;
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.service.MovieTimeService;

@Controller
public class MovieTimeController {
	
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MovieTimeService mtsvc;

	@RequestMapping(value = "/mtRegiForm", method = RequestMethod.GET)
	public String mtRegiForm() {
		System.out.println("mtRegiForm : 스케줄 등록 페이지 이동");
		return "movietime/register";
	}
	
	@RequestMapping(value = "/mtRegister", method = RequestMethod.POST)
	public ModelAndView mtRegister(MovieTimeDTO movietime) {
		System.out.println("#1 fRegister : 스케줄 등록");
		mav = mtsvc.mtRegister(movietime);
		return mav;
	}
	
	@RequestMapping(value = "/mtList", method = RequestMethod.GET)
	public ModelAndView mtList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {
		System.out.println("[1] jsp → controller / page : " + page + ", limit : " + limit);

		mav = mtsvc.mtList(page, limit);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value="/mtSearch", method=RequestMethod.GET)
	public ModelAndView mtSearch(@ModelAttribute SearchDTO search) {
		System.out.println("[1] jsp → controller : " + search); 
			
		mav = mtsvc.mtSearch(search);
		System.out.println("[5] service → controller : " + mav);
			
		return mav;
	}
	
	@RequestMapping(value = "/mtView", method = RequestMethod.GET)
	public ModelAndView mtView(@RequestParam("mtNo") int mtNo) {
		System.out.println("[1] jsp → controller ");

		mav = mtsvc.mtView(mtNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/mtDelete", method = RequestMethod.GET)
	public ModelAndView mtDelete(@RequestParam("mtNo") int mtNo) {
		System.out.println("[1] jsp → controller ");

		mav = mtsvc.mtDelete(mtNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
}
