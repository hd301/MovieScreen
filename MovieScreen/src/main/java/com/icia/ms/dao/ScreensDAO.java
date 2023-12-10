package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.ScreensDTO;
import com.icia.ms.dto.SearchDTO;
import com.icia.ms.dto.TheaterDTO;

@Repository
public class ScreensDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public List<TheaterDTO> setThName() {
		return sql.selectList("Screens.setThName");
	}

	public int scRegister(ScreensDTO screens) {
		System.out.println("[3] service → dao : " + screens);
		return sql.insert("Screens.scRegister", screens);
	}

	public List<ScreensDTO> setScName(String thName) {
		System.out.println("[3] service → dao : " + thName);
		return sql.selectList("Screens.setScName", thName);
	}

	public int scCount() {
		return sql.selectOne("Screens.scCount");
	}

	public List<ScreensDTO> scList(PageDTO paging) {
		System.out.println("[3] service → dao : " + paging);
		return sql.selectList("Screens.scList", paging);
	}

	public List<TheaterDTO> scThList() {
		return sql.selectList("Screens.scThList");
	}

	public List<TheaterDTO> scViewName(String thName) {
		return sql.selectList("Screens.scViewName", thName);
	}

	public List<ScreensDTO> scSearch(SearchDTO search) {
		System.out.println("[3] service → dao : " + search);
		return sql.selectList("Screens.scSearch", search);
	}

	public ScreensDTO scView(int scNo) {
		
		return sql.selectOne("Screens.scView", scNo);
	}

	public int scModify(ScreensDTO screens) {
		
		return sql.update("Screens.scModify", screens);
	}

	public int scDelete(int scNo) {
		
		return sql.delete("Screens.scDelete", scNo);
	}

	public List<String> setScreens1(String selectedThName) {
		System.out.println("#3 setScreens1 : selectedThName = " + selectedThName);
		return sql.selectList("Screens.setScreens1", selectedThName);
	}

	public int setScreens2(ScreensDTO screens) {
		System.out.println("#3 setScreens2 : screens = " + screens);
		return sql.selectOne("Screens.setScreens2", screens);
	}

}
