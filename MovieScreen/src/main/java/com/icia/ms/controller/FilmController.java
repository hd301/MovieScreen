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

import com.icia.ms.dto.FilmDTO;
import com.icia.ms.service.FilmService;

@Controller
public class FilmController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private FilmService fsvc;

	// FR01 : 영화정보 등록 페이지 이동
	@RequestMapping(value = "/fRegiForm", method = RequestMethod.GET)
	public String fRegiForm() {

		return "film/register";
	}

	// FR02 : 영화정보 등록
	@RequestMapping(value = "/fRegister", method = RequestMethod.POST)
	public ModelAndView fRegister(@ModelAttribute FilmDTO film) {
		System.out.println("[1] jsp → controller : " + film);
		mav = fsvc.fRegister(film);
		System.out.println("[5] service → controller : " + film);

		return mav;
	}

	// FL03 : 영화목록
	@RequestMapping(value = "/fList", method = RequestMethod.GET)
	public ModelAndView fList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "50") int limit) {
		System.out.println("[1] jsp → controller / page : " + page + ", limit : " + limit);

		mav = fsvc.fList(page, limit);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// FV04 : 영화정보 상세보기
	@RequestMapping(value = "/fView", method = RequestMethod.GET)
	public ModelAndView fView(@RequestParam("fmNo") int fmNo) {
		System.out.println("[1] jsp → controller : " + fmNo);

		mav = fsvc.fView(fmNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}

	// FM05 : 영화정보 수정 페이지 이동
	@RequestMapping(value = "/fModiForm", method = RequestMethod.GET)
	public ModelAndView fModiForm(@RequestParam("fmNo") int fmNo) {
		System.out.println("[1] jsp → controller : " + fmNo);

		mav = fsvc.fModiForm(fmNo);
		System.out.println("[5] service → controller : " + mav);
		
		return mav;
	}
	
	// FM06 : 영화정보 수정
	@RequestMapping(value = "/fModify", method = RequestMethod.POST)
	public ModelAndView fModify(@ModelAttribute FilmDTO film) {
		System.out.println("[1] jsp → controller : " + film);
		mav = fsvc.fModify(film);
		System.out.println("[5] service → controller : " + film);

		return mav;
	}
	
	// FD07 : 영화정보 삭제
	@RequestMapping(value = "/fDelete", method = RequestMethod.GET)
	public ModelAndView fDelete(@RequestParam("fmNo") int fmNo) {
		System.out.println("[1] jsp → controller : " + fmNo);

		mav = fsvc.fDelete(fmNo);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value = "/selectFmTitle", method = RequestMethod.POST)
	public @ResponseBody int selectFmTitle(@RequestParam("fmTitle") String fmTitle) {
		System.out.println("#1 selectFmTitle : 영화중복체크, fmTitle = " + fmTitle);
		int data = fsvc.selectFmTitle(fmTitle);
		return data;
	}
	
	@RequestMapping(value = "/setFmTitles", method = RequestMethod.POST)
	public @ResponseBody List<String> setFmTitles() {
		System.out.println("#1 setFmTitles : 영화제목등록(ajax)");
		List<String> list = fsvc.setFmTitles();
		System.out.println("#5 setFmTitles : list = " + list);
		return list;
	}
}
