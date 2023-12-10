package com.icia.ms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dao.MovieTimeDAO;
import com.icia.ms.dto.MovieTimeDTO;
import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.SearchDTO;

@Service
public class MovieTimeService {
	
	private ModelAndView mav;
	
	@Autowired
	private MovieTimeDAO mtdao;

	public ModelAndView mtRegister(MovieTimeDTO movietime) {
		System.out.println("#2 fRegister : movietime = " + movietime);
		mav = new ModelAndView();
		int scNo = mtdao.selectScNo(movietime);
		System.out.println("scNo : " + scNo);
		movietime.setScNo(scNo);
		int result = mtdao.mtRegister(movietime);
		System.out.println("#4 fRegister : insert 결과 = " + result);

		if (result > 0) {
			System.out.println("스케줄 등록 성공");
			mav.setViewName("redirect:mtList");
		} else {
			System.out.println("스케줄 등록 실패");
			mav.setViewName("index");
		}
		return mav;
	}
	
	public ModelAndView mtList(int page, int limit) {
		System.out.println("[2] controller → service / page : " + page + ", limit : " + limit);
		mav = new ModelAndView();

		int block = 5;

		int count = mtdao.mtCount();

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

		List<MovieTimeDTO> movieTimeList = mtdao.mtList(paging);

		mav.addObject("movieTimeList", movieTimeList);
		mav.addObject("paging", paging);

		mav.setViewName("movietime/list");

		return mav;
	}
	
	public ModelAndView mtSearch(SearchDTO search) {
		System.out.println("[2] controller → service : " + search);
		mav = new ModelAndView();

		List<MovieTimeDTO> searchList = mtdao.mtSearch(search);
		System.out.println("[4] dao → service : " + searchList);

		mav.addObject("searchList", searchList);
		mav.setViewName("movietime/search");

		return mav;
	}
	
	public ModelAndView mtView(int mtNo) {
		
		mav = new ModelAndView();
		
		MovieTimeDTO movieTimeList = mtdao.mtView(mtNo);
		System.out.println("[4] service : " + movieTimeList);
		mav.addObject("view", movieTimeList);
		mav.setViewName("movietime/view");
		
		return mav;
	}
	
	public ModelAndView mtDelete(int mtNo) {
		
		mav = new ModelAndView();
		
		int result = mtdao.mtDelete(mtNo);
		
		if(result > 0) {
			mav.setViewName("redirect:mtList");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}
}
