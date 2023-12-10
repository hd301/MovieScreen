package com.icia.ms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {

		
		return "index";
	}
	
	@RequestMapping(value = "/crawlingForm", method = RequestMethod.GET)
	public String crawling() {
		
		
		return "crawling/crawling";
	}
	
	@RequestMapping(value = "/questionForm", method = RequestMethod.GET)
	public String questionForm() {

		
		return "question/write";
	}
	
}
