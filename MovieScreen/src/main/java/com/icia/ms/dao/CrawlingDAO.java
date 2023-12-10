package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.CrawlingDTO;

@Repository
public class CrawlingDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	public int cInsert(CrawlingDTO crawling) {
		System.out.println("#3 cInsert : crawling = " + crawling);
		return sql.insert("Crawling.cInsert", crawling);
	}

	public String cInfoSrc(int cNo) {
		System.out.println("#3 cInfoSrc : cNo = " + cNo);
		return sql.selectOne("Crawling.cInfoSrc", cNo);
	}

	public int cDirectorActorNames(CrawlingDTO crawling) {
		System.out.println("#3 cDirectorActorNames : crawling = " + crawling);
		return sql.update("Crawling.cDirectorActorNames", crawling);
	}

	public int cGenre(CrawlingDTO crawling) {
		System.out.println("#3 cGenre : crawling = " + crawling);
		return sql.update("Crawling.cGenre", crawling);
	}

	public int cBasicInfo(CrawlingDTO crawling) {
		System.out.println("#3 cBasicInfo : crawling = " + crawling);
		return sql.update("Crawling.cBasicInfo", crawling);
	}
	
	public List<String> setTitles() {
		System.out.println("#3 setTitles");
		return sql.selectList("Crawling.setTitles");
	}

	public List<String> setContents(String fmTitle) {
		return sql.selectList("Crawling.setContents", fmTitle);
	}
	
	public List<String> fmList() {
		System.out.println("#3 fmList");
		return sql.selectList("Crawling.fmList");
	}

	public List<String> posting() {
		System.out.println("#3 fmList");
		return sql.selectList("Crawling.posting");
	}
	
	public List<String> banner() {
		System.out.println("#3 fmVideo");
		return sql.selectList("Crawling.banner");
	}
	
	public String cTrailSrc(int cNo) {
		System.out.println("#3 cTrailSrc");
		return sql.selectOne("Crawling.cTrailSrc", cNo);
	}

	public int cVideoName(CrawlingDTO crawling) {
		return sql.update("Crawling.cVideoName", crawling);
	}

}
