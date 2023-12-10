package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.FilmDTO;
import com.icia.ms.dto.MovieTimeDTO;
import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.dto.TicketingDTO;

@Repository
public class TicketingDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<FilmDTO> movieList() {
		
		return sql.selectList("Ticketing.movieList");
	}

	public List<MovieTimeDTO> theaterList(String fmTitle) {
		return sql.selectList("Ticketing.theaterList", fmTitle);
	}

	public List<MovieTimeDTO> mtDateList(MovieTimeDTO movieTime) {
		System.out.println("[3] service → dao : " + movieTime);
		return sql.selectList("Ticketing.mtDateList", movieTime);
	}

	public List<MovieTimeDTO> mtListFinal(MovieTimeDTO movieTime) {
		System.out.println("[3] service → dao : " + movieTime);
		return sql.selectList("Ticketing.mtListFinal", movieTime);
	}
	
	public int mtRemain(MovieTimeDTO movietime) {
		System.out.println("#3 mtRemain");
		return sql.selectOne("Ticketing.mtRemain", movietime);
	}

	public int tkRegister(TicketingDTO ticketing) {
		System.out.println("#3 tkRegister");
		return sql.insert("Ticketing.tkRegister", ticketing);
	}
	
	public List<TicketingDTO> tkView(String mId) {
		System.out.println("#3 tkView");
		return sql.selectList("Ticketing.tkView", mId);
	}

	public void mtCount(TicketingDTO ticketing) {
		sql.update("Ticketing.mtCount", ticketing);
		
	}

	public void tkDelete(int tkNo) {
		sql.delete("Ticketing.tkDelete", tkNo);
	}

	public int tkCount() {
		return sql.selectOne("Ticketing.tkCount");
	}

	public List<TicketingDTO> tkList(PageDTO paging) {
		return sql.selectList("Ticketing.tkList", paging);
	}

	public List<TicketingDTO> tkSearch(SearchDTO search) {
		return sql.selectList("ticketing.tkSearch", search);
	}

	public int selectMtNo(TicketingDTO ticketing) {
		return sql.selectOne("Ticketing.selectMtNo", ticketing);
	}
	
	public int selectMtCount(TicketingDTO ticketing) {
		System.out.println("mtCount select : mtNo = " + ticketing.getMtNo());
		return sql.selectOne("Ticketing.selectMtCount", ticketing);
	}

}