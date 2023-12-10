package com.icia.ms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dao.FilmDAO;
import com.icia.ms.dto.FilmDTO;
import com.icia.ms.dto.PageDTO;

@Service
public class FilmService {

	@Autowired
	private FilmDAO fdao;

	private ModelAndView mav;

	@Autowired
	private HttpServletRequest request;

	// FR02 : 영화정보 등록
	public ModelAndView fRegister(FilmDTO film) {

		mav = new ModelAndView();

		System.out.println("[2] controller → service => board : " + film);
		int result = fdao.fRegister(film);
		System.out.println("[4] dao → service : " + result);

		if (result > 0) {
			mav.setViewName("redirect:fList");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	// FL03 : 영화목록
	public ModelAndView fList(int page, int limit) {
		System.out.println("[2] controller → service / page : " + page + ", limit : " + limit);
		mav = new ModelAndView();

		int block = 5;

		int count = fdao.fCount();

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

		List<FilmDTO> filmList = fdao.fList(paging);
		System.out.println("[4] dao → service : " + filmList);

		mav.addObject("filmList", filmList);
		mav.addObject("paging", paging);

		mav.setViewName("film/list");

		return mav;
	}

	// FV04 : 영화정보 상세보기
	public ModelAndView fView(int fmNo) {
		System.out.println("[2] controller → service => board : " + fmNo);
		mav = new ModelAndView();

		FilmDTO film = fdao.fView(fmNo);
		System.out.println("[4] dao → service : " + film);

		mav.addObject("view", film);
		mav.setViewName("film/view");

		return mav;
	}

	// FM05 : 영화정보 수정 페이지 이동
	public ModelAndView fModiForm(int fmNo) {
		System.out.println("[2] controller → service => board : " + fmNo);
		mav = new ModelAndView();

		FilmDTO film = fdao.fView(fmNo);
		System.out.println("[4] dao → service : " + film);

		mav.addObject("modify", film);
		mav.setViewName("film/modify");

		return mav;
	}

	// FM06 : 영화정보 수정
	public ModelAndView fModify(FilmDTO film) {
		System.out.println("[2] controller → service => board : " + film);
		mav = new ModelAndView();

		int result = fdao.fModify(film);
		System.out.println("[4] dao → service : " + result);

		if (result > 0) {
			mav.setViewName("redirect:fView?fmNo=" + film.getFmNo());

		} else {
			mav.setViewName("index");
		}

		return mav;
	}


	// FD07 : 영화정보 삭제
	public ModelAndView fDelete(int fmNo) {
		System.out.println("[2] controller → service => board : " + fmNo);
		mav = new ModelAndView();

		int result = fdao.fDelete(fmNo);
		System.out.println("[4] dao → service : " + result);

		if (result > 0) {
			mav.setViewName("redirect:fList");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}
	
	public int selectFmTitle(String fmTitle) {
		System.out.println("#2 selectFmTitle");
		int data = fdao.selectFmTitle(fmTitle);
		return data;
	}
	
	public List<String> setFmTitles() {
		System.out.println("#2 setFmTitles");
		List<String> list = fdao.setFmTitles();
		return list;
	}

}
