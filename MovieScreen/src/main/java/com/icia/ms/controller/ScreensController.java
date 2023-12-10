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

import com.icia.ms.dto.ScreensDTO;
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.dto.TheaterDTO;
import com.icia.ms.service.ScreensService;

@Controller
public class ScreensController {
	
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private ScreensService scsvc;
	
	@RequestMapping(value = "/setThName", method = RequestMethod.POST)
	public @ResponseBody List<TheaterDTO> setThName() {
		
		List<TheaterDTO> list = scsvc.setThName();

		return list;
	}
	
	@RequestMapping(value = "/scRegiForm", method = RequestMethod.GET)
	public String scRegiForm() {
		
		
		return "screens/register";
	}
	
	@RequestMapping(value = "/scRegister", method = RequestMethod.POST)
	public ModelAndView scRegister(@ModelAttribute ScreensDTO screens) {
		System.out.println("[1] jsp → controller : " + screens);
		mav = scsvc.scRegister(screens);
		System.out.println("[5] service → controller : " + mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/setScName", method = RequestMethod.GET)
	public @ResponseBody List<ScreensDTO> setScName(@RequestParam("thName") String thName) {
		System.out.println("[1] jsp → controller : " + thName);
		List<ScreensDTO> list = scsvc.setScName(thName);
		System.out.println("[5] service → controller : " + list);

		return list;
	}
	
	@RequestMapping(value = "/scList", method = RequestMethod.GET)
	public ModelAndView scList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {
		System.out.println("[1] jsp → controller / page : " + page + ", limit : " + limit);

		mav = scsvc.scList(page, limit);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/scViewName", method = RequestMethod.POST)
	public @ResponseBody List<TheaterDTO> scViewName(@RequestParam("thName") String thName) {
		
		List<TheaterDTO> list = scsvc.scViewName(thName);

		return list;
	}
	
	@RequestMapping(value="/scSearch", method=RequestMethod.GET)
	public ModelAndView bSearch(@ModelAttribute SearchDTO search) {
		System.out.println("[1] jsp → controller : " + search); 
			
		mav = scsvc.scSearch(search);
		System.out.println("[5] service → controller : " + mav);
			
		return mav;
	}
	
	@RequestMapping(value = "/scView", method = RequestMethod.GET)
	public ModelAndView scView(@RequestParam("scNo") int scNo) {
		System.out.println("[1] jsp → controller ");

		mav = scsvc.scView(scNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/scModiForm", method = RequestMethod.GET)
	public ModelAndView scModiForm(@RequestParam("scNo") int scNo) {
		System.out.println("[1] jsp → controller ");

		mav = scsvc.scModiForm(scNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/scModify", method = RequestMethod.POST)
	public ModelAndView scModify(@ModelAttribute ScreensDTO screens) {
		System.out.println("[1] jsp → controller : " + screens);
		mav = scsvc.scModify(screens);
		System.out.println("[5] service → controller : " + mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/scDelete", method = RequestMethod.GET)
	public ModelAndView scDelete(@RequestParam("scNo") int scNo) {
		System.out.println("[1] jsp → controller ");

		mav = scsvc.scDelete(scNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/setScreens1", method = RequestMethod.POST)
	public @ResponseBody List<String> setScreens1(@RequestParam("selectedThName") String selectedThName) {
		System.out.println("#1 setScreens1 : 상영관등록(ajax)1");
		List<String> list = scsvc.setScreens1(selectedThName);
		System.out.println("스크린 리스트 : " + list);
		return list;
	}
	
	@RequestMapping(value = "/setScreens2", method = RequestMethod.POST)
	public @ResponseBody int setScreens2(@RequestParam("selectedThName") String selectedThName,
			@RequestParam("selectedScName") String selectedScName) {
		System.out.println("#1 setScreens2 : 상영관등록(ajax)2");
		int data = scsvc.setScreens2(selectedThName, selectedScName);
		System.out.println("스크린 리스트 : " + data);
		return data;
	}
}
