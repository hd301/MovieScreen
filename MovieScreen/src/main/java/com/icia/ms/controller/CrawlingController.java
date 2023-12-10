package com.icia.ms.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.ms.dto.CrawlingDTO;
import com.icia.ms.service.CrawlingService;

@Controller
public class CrawlingController {
	@Autowired
	private CrawlingService csvc;
	
	@RequestMapping(value = "/crawling", method = RequestMethod.GET)
	public String crawling(@ModelAttribute CrawlingDTO crawling) throws IOException {
		System.out.println("#1 crwaling : 크롤링시작");
		csvc.crawl(crawling);
		return "index";
	}
	
	@RequestMapping(value = "/setTitles", method = RequestMethod.POST)
	public @ResponseBody List<String> setTitles() {
		List<String> list = csvc.setTitles();
		return list;
	}
	
	@RequestMapping(value = "/setContents", method = RequestMethod.POST)
	public @ResponseBody List<String> setContents(@RequestParam("fmTitle") String fmTitle) {
		List<String> list = csvc.setContents(fmTitle); 
		return list;
	}
	
	@RequestMapping(value = "/fmList", method = RequestMethod.POST)
	public @ResponseBody List<String> fmList() {
		
		List<String> list = csvc.fList();
		return list;
	}
	
	@RequestMapping(value = "/posting", method = RequestMethod.POST)
	public @ResponseBody List<String> posting() {
		
		List<String> list = csvc.posting();
		
		return list;
	}
	
	@RequestMapping(value = "/banner", method = RequestMethod.POST)
	public @ResponseBody List<String> banner() {
		
		List<String> list = csvc.banner();
		System.out.println(list);
		return list;
	}
	
}
