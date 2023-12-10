package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.MovieTimeDTO;
import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.SearchDTO;

@Repository
public class MovieTimeDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int mtRegister(MovieTimeDTO movietime) {
		System.out.println("#3 fRegister");
		return sql.insert("MovieTime.mtRegister", movietime);
	}

	public int mtCount() {
		return sql.selectOne("MovieTime.mtCount");
	}

	public List<MovieTimeDTO> mtList(PageDTO paging) {
		return sql.selectList("MovieTime.mtList", paging);
	}
	
	public MovieTimeDTO mtView(int mtNo) {
		
		return sql.selectOne("MovieTime.mtView", mtNo);
	}
	
	public List<MovieTimeDTO> mtSearch(SearchDTO search) {
		System.out.println("[3] service → dao : " + search);
		return sql.selectList("MovieTime.mtSearch", search);
	}
	
	public int mtDelete(int mtNo) {
		
		return sql.delete("MovieTime.mtDelete", mtNo);
	}

	public int selectScNo(MovieTimeDTO movietime) {
		System.out.println("selectScNo");
		return sql.selectOne("MovieTime.selectScNo", movietime);
	}

	public int updateMtCount(MovieTimeDTO movietime) {
		System.out.println("mtCount update");
		return sql.update("MovieTime.updateMtCount", movietime);
	}

}
