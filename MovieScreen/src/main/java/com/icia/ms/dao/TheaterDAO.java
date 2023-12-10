package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.TheaterDTO;

@Repository
public class TheaterDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	// TR02 : 영화관 등록
	public int tRegister(TheaterDTO theater) {
		System.out.println("[3] service → dao : " + theater);
		return sql.insert("Theater.tRegister", theater);
	}

	// TL03 : 영화관 목록
	public List<TheaterDTO> tList(PageDTO paging) {
		System.out.println("[3] service → dao : " + paging);
		return sql.selectList("Theater.tList", paging);
	}

	public int tCount() {
		return sql.selectOne("Theater.tCount");
	}

	// TV04 : 영화관 정보 상세보기
	public TheaterDTO tView(String thName) {
		System.out.println("[3] service → dao : " + thName);
		return sql.selectOne("Theater.tView", thName);
	}

	// TM06 : 영화관 정보 수정
	public int tModify(TheaterDTO theater) {
		System.out.println("[3] service → dao : " + theater);
		return sql.update("Theater.tModify", theater);
	}

	// TD07 : 영화관 삭제
	public int tDelete(int thNo) {
		System.out.println("[3] service → dao : " + thNo);
		return sql.delete("Theater.tDelete", thNo);
	}

	public TheaterDTO tViewNo(int thNo) {
		System.out.println("[3] service → dao : " + thNo);
		return sql.selectOne("Theater.tViewNo", thNo);
	}
	
	public List<String> setTheaters() {
		return sql.selectList("Theater.setTheaters");
	}

}
