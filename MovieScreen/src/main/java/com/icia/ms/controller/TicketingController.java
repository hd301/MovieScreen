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
import com.icia.ms.dto.MovieTimeDTO; 
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.dto.TicketingDTO;
import com.icia.ms.service.TicketingService;

@Controller
public class TicketingController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private TicketingService tksvc;
	
	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public @ResponseBody List<FilmDTO> movieList() {
		System.out.println("[1] jsp → controller");
		List<FilmDTO> list = tksvc.movieList();
		System.out.println("[5] service → controller : " + list);

		return list;
	}
	
	@RequestMapping(value = "/theaterList", method = RequestMethod.GET)
	public @ResponseBody List<MovieTimeDTO> theaterList(@RequestParam("fmTitle") String fmTitle) {
		System.out.println("[1] jsp → controller");
		List<MovieTimeDTO> list = tksvc.theaterList(fmTitle);
		System.out.println("[5] service → controller : " + list);

		return list;
	}
	
	@RequestMapping(value = "/mtDateList", method = RequestMethod.GET)
	public @ResponseBody List<MovieTimeDTO> mtDateList(@ModelAttribute MovieTimeDTO movieTime) {
		System.out.println("[1] jsp → controller : " + movieTime);
		List<MovieTimeDTO> list = tksvc.mtDateList(movieTime);
		System.out.println("[5] service → controller : " + list);
		
		return list;
	}
	
	@RequestMapping(value = "/mtListFinal", method = RequestMethod.GET)
	public @ResponseBody List<MovieTimeDTO> mtListFinal(@ModelAttribute MovieTimeDTO movieTime) {
		System.out.println("[1] jsp → controller : " + movieTime);
		List<MovieTimeDTO> list = tksvc.mtListFinal(movieTime);
		System.out.println("[5] service → controller : " + list);
		
		return list;
	}
	
	@RequestMapping(value = "/mtRemain", method = RequestMethod.GET)
	public @ResponseBody int mtRemain(@ModelAttribute MovieTimeDTO movietime) {
		System.out.println("#1 mtRemain : movieiime = " + movietime);
		int data = tksvc.mtRemain(movietime);
		System.out.println("#5 mtRemain : data = " + data);
		return data;
	}
	
	@RequestMapping(value = "/tkBookForm", method = RequestMethod.GET)
	public String tkBookForm() {
		System.out.println("tkBookForm : 예매페이지 이동");
		return "ticketing/book";
	}
	
	@RequestMapping(value = "/tkRegister", method = RequestMethod.POST)
	public ModelAndView tkRegister(@ModelAttribute TicketingDTO ticketing) {
		System.out.println("#1 tkRegister : ticketing = " + ticketing);
		mav = tksvc.tkRegister(ticketing);

		return mav;
	}
	
	@RequestMapping(value = "/tkView", method = RequestMethod.GET)
	public ModelAndView tkView(@RequestParam("mId") String mId) {
		System.out.println("#1 tkView : mId = " + mId);
		mav = tksvc.tkView(mId);

		return mav;
	}
	
	@RequestMapping(value = "/tkDelete", method = RequestMethod.GET)
	public ModelAndView tkDelete(@RequestParam("tkNo") int tkNo) {
		
		mav = tksvc.tkDelete(tkNo);

		return mav;
	}
	
	@RequestMapping(value = "/tkList", method = RequestMethod.GET)
	public ModelAndView tkList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {
		System.out.println("[1] jsp → controller / page : " + page + ", limit : " + limit);

		mav = tksvc.tkList(page, limit);
		System.out.println("[5] service → controller : " + mav);

		return mav;
	}
	
	@RequestMapping(value="/tkSearch", method=RequestMethod.GET)
	public ModelAndView tkSearch(@ModelAttribute SearchDTO search) {
		System.out.println("[1] jsp → controller : " + search); 
			
		mav = tksvc.tkSearch(search);
		System.out.println("[5] service → controller : " + mav);
			
		return mav;
	}
}