package com.icia.ms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dao.MovieTimeDAO;
import com.icia.ms.dao.TicketingDAO;
import com.icia.ms.dto.FilmDTO;
import com.icia.ms.dto.MovieTimeDTO;
import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.dto.TicketingDTO;

@Service
public class TicketingService {
	
	private ModelAndView mav;
	
	@Autowired
	private TicketingDAO tkdao;
	
	@Autowired
	private MovieTimeDAO mtdao;

	public List<FilmDTO> movieList() {
		
		List<FilmDTO> list = tkdao.movieList();
		
		return list;
	}

	public List<MovieTimeDTO> theaterList(String fmTitle) {
		List<MovieTimeDTO> list = tkdao.theaterList(fmTitle);
		
		return list;
	}

	public List<MovieTimeDTO> mtDateList(MovieTimeDTO movieTime) {
		System.out.println("[2] controller → service : " + movieTime);
		List<MovieTimeDTO> list = tkdao.mtDateList(movieTime);
		System.out.println("[4] dao → service : " + movieTime);
		
		return list;
	}

	public List<MovieTimeDTO> mtListFinal(MovieTimeDTO movieTime) {
		System.out.println("[2] controller → service : " + movieTime);
		List<MovieTimeDTO> list = tkdao.mtListFinal(movieTime);
		System.out.println("[4] dao → service : " + movieTime);
		
		return list;
	}
	
	public int mtRemain(MovieTimeDTO movietime) {
		System.out.println("#2 mtRemain : movietime = " + movietime);
		int data = tkdao.mtRemain(movietime);
		System.out.println("#4 mtRemain : data = " + data);
		
		return data;
	}

	public ModelAndView tkRegister(TicketingDTO ticketing) {
		System.out.println("#2 tkRegister");
		mav = new ModelAndView();
		
		int mtNo = tkdao.selectMtNo(ticketing);
		System.out.println("mtNo : " + mtNo);
		ticketing.setMtNo(mtNo);
		
		int result1 = tkdao.tkRegister(ticketing);
		System.out.println("#4 tkRegister : insert 결과 = " + result1);
		
		System.out.println("ticketing mtNo : " + ticketing.getMtNo());
		int mtCount = tkdao.selectMtCount(ticketing);
		System.out.println("select 결과 : mtCount1 = " + mtCount);
		mtCount += ticketing.getTkCount();
		System.out.println("mtCount2 = " + mtCount);
		MovieTimeDTO movietime = new MovieTimeDTO();
		movietime.setMtNo(ticketing.getMtNo());
		movietime.setMtCount(mtCount);
		
		int result2 = mtdao.updateMtCount(movietime);
		System.out.println("#4 tkRegister : mtCount update 결과 = " + result2);
		if (result2 > 0) {
			System.out.println("mtCount update 성공");
		} else {
			System.out.println("mtCount update 실패");
		}
		if(result1 > 0) {
		mav.setViewName("redirect:tkView?mId="+ticketing.getMId());
		} else {
		mav.setViewName("index");
		}
		return mav;
	}
	
public ModelAndView tkView(String mId) {
		System.out.println("#2 tkView");
		mav = new ModelAndView();
		
		List<TicketingDTO> ticketList = tkdao.tkView(mId);
		System.out.println("#4 tkView : ticketList = " + ticketList);
		mav.addObject("list", ticketList);
		mav.setViewName("ticketing/view");
		return mav;
	}

	public ModelAndView tkDelete(int tkNo) {
		
		mav = new ModelAndView();
		
		tkdao.tkDelete(tkNo);
		
		mav.setViewName("index");
		return mav;
	}

	public ModelAndView tkList(int page, int limit) {
		System.out.println("[2] controller → service / page : " + page + ", limit : " + limit);
		mav = new ModelAndView();

		int block = 5;

		int count = tkdao.tkCount();

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

		List<TicketingDTO> TicketingList = tkdao.tkList(paging);

		mav.addObject("TicketingList", TicketingList);
		mav.addObject("paging", paging);

		mav.setViewName("ticketing/list");

		return mav;
	}

	public ModelAndView tkSearch(SearchDTO search) {
		System.out.println("[2] controller → service : " + search);
		mav = new ModelAndView();

		List<TicketingDTO> searchList = tkdao.tkSearch(search);
		System.out.println("[4] dao → service : " + searchList);

		mav.addObject("searchList", searchList);
		mav.setViewName("ticketing/search");

		return mav;
	}

}