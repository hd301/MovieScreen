package com.icia.ms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dao.ScreensDAO;
import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.ScreensDTO;
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.dto.TheaterDTO;

@Service
public class ScreensService {
	
	private ModelAndView mav;
	 
	@Autowired
	private ScreensDAO scdao;

	public List<TheaterDTO> setThName() {
		
		List<TheaterDTO> list = scdao.setThName();
		
		return list;
	}

	public ModelAndView scRegister(ScreensDTO screens) {
		System.out.println("[2] controller → service : " + screens);
		mav = new ModelAndView();
		
		int result = scdao.scRegister(screens);
		System.out.println("[4] dao → service : " + result);
		
		if(result > 0) {
			mav.setViewName("redirect:scList");
		}else {
			mav.setViewName("index");
		}
		
		return mav;
	}

	public List<ScreensDTO> setScName(String thName) {
		System.out.println("[2] controller → service : " + thName);
		List<ScreensDTO> list = scdao.setScName(thName);
		System.out.println("[4] dao → service : " + list);
		
		return list;
	}

	public ModelAndView scList(int page, int limit) {
		System.out.println("[2] controller → service / page : " + page + ", limit : " + limit);
		mav = new ModelAndView();

		int block = 5;

		int count = scdao.scCount();

		int maxPage = (int) (Math.ceil((double) count / limit));

		int startRow = (page - 1) * limit + 1;

		int endRow = page * limit;

		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;

		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageDTO paging = new PageDTO();

		paging.setStartRow(startRow);
		paging.setEndRow(endRow);

		paging.setPage(page);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		List<ScreensDTO> screensList = scdao.scList(paging);
		List<TheaterDTO> theaterList = scdao.scThList();

		mav.addObject("theaterList", theaterList);
		mav.addObject("screensList", screensList);
		mav.addObject("paging", paging);

		mav.setViewName("screens/list");

		return mav;
	}

	public List<TheaterDTO> scViewName(String thName) {

		List<TheaterDTO> list = scdao.scViewName(thName);
		
		return list;
	}

	public ModelAndView scSearch(SearchDTO search) {
		System.out.println("[2] controller → service : " + search);
		mav = new ModelAndView();

		List<ScreensDTO> searchList = scdao.scSearch(search);
		System.out.println("[4] dao → service : " + searchList);

		mav.addObject("searchList", searchList);
		mav.setViewName("screens/search");

		return mav;
	}

	public ModelAndView scView(int scNo) {
		
		mav = new ModelAndView();
		
		ScreensDTO screensList = scdao.scView(scNo);
		System.out.println("[4] service : " + screensList);
		mav.addObject("view", screensList);
		mav.setViewName("screens/view");
		
		return mav;
	}

	public ModelAndView scModiForm(int scNo) {
		
		mav = new ModelAndView();
		
		ScreensDTO screens = scdao.scView(scNo);
		
		mav.addObject("modify", screens);
		mav.setViewName("screens/modify");
		
		return mav;
	}

	public ModelAndView scModify(ScreensDTO screens) {
		
		mav = new ModelAndView();
		
		int result = scdao.scModify(screens);
		
		if(result > 0) {
			mav.setViewName("redirect:scList");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}

	public ModelAndView scDelete(int scNo) {
		
		mav = new ModelAndView();
		
		int result = scdao.scDelete(scNo);
		
		if(result > 0) {
			mav.setViewName("redirect:scList");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}
	
	public List<String> setScreens1(String selectedThName) {
		System.out.println("#2 setScreens1");
		List<String> list = scdao.setScreens1(selectedThName);
		System.out.println("#4 setScreens1 : list = " + list);
		return list;
	}
	
	public int setScreens2(String selectedThName, String selectedScName) {
		System.out.println("#2 setScreens2 : selectedThName = " + selectedThName + ", selectedScName = " + selectedScName);
		ScreensDTO screens = new ScreensDTO();
		screens.setThName(selectedThName);
		screens.setScName(selectedScName);
		
		int data = scdao.setScreens2(screens);
		System.out.println("#4 setScreens2 : data = " + data);
		return data;
	}

}
