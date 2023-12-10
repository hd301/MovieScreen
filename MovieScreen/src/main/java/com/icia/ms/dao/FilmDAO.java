package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.FilmDTO;
import com.icia.ms.dto.PageDTO;

@Repository
public class FilmDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	// FR02 : 영화정보 등록
	public int fRegister(FilmDTO film) {
		System.out.println("[3] service → dao : " + film);
		return sql.insert("Film.fRegister", film);
	}

	// FL03 : 영화갯수 카운트
	public int fCount() {
		return sql.selectOne("Film.fCount");
	}
	
	// FL03 : 영화목록
	public List<FilmDTO> fList(PageDTO paging) {
		System.out.println("[3] service → dao : " + paging);
		return sql.selectList("Film.fList", paging);
	}

	// FV04 : 영화정보 상세보기
	public FilmDTO fView(int fmNo) {
		System.out.println("[3] service → dao : " + fmNo);
		return sql.selectOne("Film.fView", fmNo);
	}

	// FM06 : 영화정보 수정
	public int fModify(FilmDTO film) {
		System.out.println("[3] service → dao : " + film);
		return sql.update("Film.fModify", film);
	}

	// FD07 : 영화정보 삭제
	public int fDelete(int fmNo) {
		System.out.println("[3] service → dao : " + fmNo);
		return sql.delete("Film.fDelete", fmNo);
	}
	
	public int selectFmTitle(String fmTitle) {
		System.out.println("#3 selectFmTitle");
		return sql.selectOne("Film.selectFmTitle", fmTitle);
	}
	
	public List<String> setFmTitles() {
		System.out.println("#3 setFmTitles");
		return sql.selectList("Film.setFmTitles");
	}

}
