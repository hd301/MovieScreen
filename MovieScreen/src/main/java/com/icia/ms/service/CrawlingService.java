package com.icia.ms.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.ms.dao.CrawlingDAO;
import com.icia.ms.dto.CrawlingDTO;

@Service
public class CrawlingService {

	@Autowired
	private CrawlingDAO cdao;
	
	public void crawl(CrawlingDTO crawling) throws IOException {
		System.out.println("#2 crawl : crawling = " + crawling);
		
		Document doc1 = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
		Elements titles = doc1.select(".title");
		int titlesSize = titles.size();
		Elements percents = doc1.select(".percent > span");
		Elements imgs = doc1.select(".thumb-image > img");
		Elements urls = doc1.select(".box-image > a");
		String url1 = "https://www.cgv.co.kr";
		String url2 = "";
		String newUrl = "";
		
		int cTrailLength = 0;
		String cTrailSrcNum = "";
		String cTrailSrc = "";
		List<String> cTrailSrcNumList = new ArrayList<String>();
		
		// CheckType ct = new CheckType();
		System.out.println("총 영화개수 : " + titlesSize);
		
		// 1) ccrawlingName, 2) cPercent, 3) cFileName, 4) cInfoSrc 5) TrailSrC
		for (int i = 0; i < titlesSize; i++) {
			System.out.println("No." + (i + 1) + " : " + titles.get(i).text());
			crawling.setCTitle(titles.get(i).text());
			System.out.println("예매율 : " + percents.get(i).text());
			crawling.setCPercent(percents.get(i).text());
			System.out.println("이미지 경로 : " + imgs.get(i).attr("src"));
			crawling.setCFileName(imgs.get(i).attr("src"));
			url2 = urls.get(i).attr("href");
			newUrl = url1 + url2;

			System.out.println("상세정보 경로 : " + newUrl);
			crawling.setCInfoSrc(newUrl);
			
			cTrailLength = url2.length();
			cTrailSrcNum = url2.substring(cTrailLength-5);
			cTrailSrcNumList.add(cTrailSrcNum);
			System.out.println("cTrailSrcNum : " + cTrailSrcNum);
			cTrailSrc = "http://www.cgv.co.kr/movies/detail-view/trailer.aspx?midx=" + cTrailSrcNum + "#menu";
			System.out.println("트레일러 경로 : " + cTrailSrc);
			crawling.setCTrailSrc(cTrailSrc);
			
			int resultInsert = cdao.cInsert(crawling);
			System.out.println("#4 영화제목, 예매율, 포스터, 상세정보경로, 트레일경로 insert 결과 : " + resultInsert);
		}
		
		for (int i = 0; i < titlesSize; i++) {
			// crawling 초기화
			crawling = new CrawlingDTO();
			String cInfoSrc = cdao.cInfoSrc(i+1);
			System.out.println("상세정보 페이지 : " + cInfoSrc);
			
			Document doc2 = Jsoup.connect(cInfoSrc).get();
			Elements cDirector = doc2.select(".spec dl dd a");
			Elements cBasicInfo1 = doc2.select(".on");
			String cDirectorName = "";
			String cActorNames = "";
			// 6) cDirectorName, 7) cActorName
			for (int j = 0; j < cDirector.size(); j++) {
				if (j == 0) {
					cDirectorName += cDirector.get(j).text();
					cActorNames = cBasicInfo1.get(j).text();
				}
			}
			crawling.setCNo(i+1);
			crawling.setCDirectorName(cDirectorName);
			crawling.setCActorName(cActorNames);
			System.out.println("감독 : " + crawling.getCDirectorName());
			System.out.println("배우 : " + crawling.getCActorName());
			int resultDnA = cdao.cDirectorActorNames(crawling);
			System.out.println("#4 영화감독, 배우 update 결과 : " + resultDnA);
			
			Elements cBasicInfo2 = doc2.select(".spec dl dt");
			String cGenre = "";
			String str = "";
			String strSub = "";
			String strTot = "";
			// 8) cGenre 
			for (int j = 0; j < cBasicInfo2.size(); j++) {
				// crawling 초기화
				crawling = new CrawlingDTO();
				str = cBasicInfo2.get(j).text();
				strSub = str.substring(0,2);
				if (strSub.equals("장르")) {
					String[] strSpl = str.split(";");
					for (int k = 0; k < strSpl.length; k++) {
						strTot += strSpl[k];
					}
					if (strTot.length() > 4) {
						cGenre = strTot.substring(5);
					}
					System.out.println(cGenre);
				}
			}
			crawling.setCNo(i+1);
			crawling.setCGenre(cGenre);
			int resultGenre = cdao.cGenre(crawling);
			System.out.println("#4 Genre update 결과 : " + resultGenre);
			
			String cGrade = "";
			String cRuntime = "";
			String cCountry = "";
			String cRelease = "";
			str = "";
			// 9) cGrade, 10) cRuntime, 11) cCountry, 12) cRelease
			for (int j = 0; j < cBasicInfo1.size(); j++) {
				// crawling 초기화
				crawling = new CrawlingDTO();
				str = cBasicInfo1.get(j).text();
				// 주석예정
				System.out.println("str[" + j + "] : " + str);
				if (j == 1) {
					String[] strSpl = str.split(",");
					if (strSpl.length > 2) {
						for (int k = 0; k < strSpl.length; k++) {
							cGrade = strSpl[0];
							cRuntime = strSpl[1].substring(0);
							cCountry = strSpl[2].substring(0);
						}
					}
				} else if (j == 2) {
					cRelease = str;
				}
			}
			
			Elements cContents = doc2.select(".sect-story-movie");
			String cContent = "";
			// 13) cContent
			for (int j = 0; j < cContents.size(); j++) {
				cContent += cContents.get(j).text();
			}
			crawling.setCNo(i+1);
			crawling.setCGrade(cGrade);
			crawling.setCRuntime(cRuntime);
			crawling.setCCountry(cCountry);
			crawling.setCRelease(cRelease);
			crawling.setCContent(cContent);
			int resultBasicInfo = cdao.cBasicInfo(crawling);
			System.out.println("#4 등급, 상영시간, 국가, 개봉일, 내용 update 결과 : " + resultBasicInfo);
		}
		
		// 14) cVideoName
		System.out.println("타이틀사이즈 : " + titlesSize);
		boolean run;
		String url3 = "http://h.vod.cgv.co.kr/vodCGVa/";
		// String url4 : 87617(cTrailSrcNumList.get(j))/87617(cTrailSrcNumList.get(j))_220002(cVideoSrcNumList.get(j))
		String url4 = "";
		String url5 = "_1200_128_960_540.mp4";
		String cVideoSrc = "";
		List<String> cVideoSrcNumList = new ArrayList<String>();
		for (int i = 0; i < titlesSize; i++) {
			// crawling 초기화
			crawling = new CrawlingDTO();
			cTrailSrc = cdao.cTrailSrc(i + 1);
			System.out.println("cTrailSrc 리턴값 : " + cTrailSrc);
			Document doc3 = Jsoup.connect(cTrailSrc).get();
			System.out.println("Jsoup connect 성공");
			Elements sectTrailer = doc3.select("div.sect-trailer *");
			Elements trailTitles = doc3.select("a.movie_player_popup");
			String cVideoIdx = "";

			System.out.println("sect-trailer 사이즈 : " + sectTrailer.size());
			String str = sectTrailer.get(0).text();
			System.out.println("sect-trailer 확인 : " + str);
			if (str.matches(".*0건.*")) {
				cVideoIdx = "0";
				cVideoSrcNumList.add("0");
			} else {
				run = true;
				while (run) {
					System.out.println("trailTitles size = " + trailTitles.size());
					cVideoIdx = "";
					for (int j = 0; j < trailTitles.size(); j++) {
						System.out.println("for문 실행");
						if (trailTitles.get(j).text().matches(".*예고편.*")) { 
							cVideoIdx = trailTitles.get(j).attr("data-gallery-idx");
							System.out.println("트레일러 제목 : " + trailTitles.get(j).text());
							System.out.println("비디오 인덱스 : " + cVideoIdx);
							cVideoSrcNumList.add(cVideoIdx);
							run = false;
							break;
						}
					}
				}
			}
			System.out.println("비디오 인덱스 확인 : " + cVideoIdx);
			crawling.setCNo(i+1);
			if (cVideoIdx.equals("71095")) {
				cVideoSrc = "http://mp4.cine21.com/cine21.com/movie/trailer/2009/01/darkknight_re_tr.mp4";
				System.out.println("비디오 Src : " + cVideoSrc);
				System.out.println("cNo : " + crawling.getCNo());
				crawling.setCVideoName(cVideoSrc);
				int result = cdao.cVideoName(crawling);
				System.out.println("#4 비디오 경로 저장결과 : result = " + result);
			} else if (cVideoIdx.equals("0")) {
				cVideoSrc = "0";
				System.out.println("비디오 Src : " + cVideoSrc);
				System.out.println("cNo : " + crawling.getCNo());
				crawling.setCVideoName(cVideoSrc);
				int result = cdao.cVideoName(crawling);
				System.out.println("#4 비디오 경로 저장결과 : result = " + result);
			} else {
				System.out.println("i : " + i);
				System.out.println("cTrailSrcNumList.size() : " + cTrailSrcNumList.size());
				System.out.println("cVideoSrcNumList.size() : " + cVideoSrcNumList.size());
				url4 = cTrailSrcNumList.get(i) + "/" + cTrailSrcNumList.get(i) + "_" + cVideoSrcNumList.get(i);
				System.out.println("check point1");
				cVideoSrc = url3 + url4 + url5;
				System.out.println("비디오 Src : " + cVideoSrc);
				System.out.println("cNo : " + crawling.getCNo());
				crawling.setCVideoName(cVideoSrc);
				int result = cdao.cVideoName(crawling);
				System.out.println("#4 비디오 경로 저장결과 : result = " + result);
			}
		}
	}
	
	public List<String> setTitles() {
		System.out.println("#2 setTitles");
		List<String> list = cdao.setTitles();
		System.out.println("#4 setTitles : list = " + list);
		return list;
	}

	public List<String> setContents(String fmTitle) {
		System.out.println("#2 setContents : fmTitle = " + fmTitle);
		List<String> list = cdao.setContents(fmTitle);
		System.out.println("#4 setContents : list = " + list);
		return list;
	}
	
	
	public List<String> fList() {
		List<String> list = cdao.fmList();
		return list;
	}

	public List<String> posting() {
		List<String> list = cdao.posting();
		return list;
	}
	
	public List<String> banner() {
		List<String> list = cdao.banner();
		return list;
	}


}
