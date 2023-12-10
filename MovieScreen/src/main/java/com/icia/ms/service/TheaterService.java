package com.icia.ms.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dao.TheaterDAO;
import com.icia.ms.dto.PageDTO;
import com.icia.ms.dto.TheaterDTO;

@Service
public class TheaterService {

	@Autowired
	private TheaterDAO tdao;

	private ModelAndView mav;

	@Autowired
	private HttpServletRequest request;

	// TR02 : 영화관 등록
	public ModelAndView tRegister(TheaterDTO theater) {
		System.out.println("[2] controller → service : " + theater);
		mav = new ModelAndView();

		MultipartFile thFile = theater.getThFile();

		if (!thFile.getOriginalFilename().isEmpty()) {

			UUID uuid = UUID.randomUUID();

			String thFileName = uuid.toString().substring(0, 8) + "_" + thFile.getOriginalFilename();

			theater.setThFileName(thFileName);

			String savePath = "C:\\MyWorkspace\\Spring\\MovieScreen\\src\\main\\webapp\\resources\\fileUpload\\";

			try {
				thFile.transferTo(new File(savePath + thFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		String thAddr = "(" + theater.getAddr1() + ") " + theater.getAddr2() + ", " + theater.getAddr3();

		theater.setThAddr(thAddr);

		int result = tdao.tRegister(theater);
		System.out.println("[4] dao → service : " + result);

		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	// TL03 : 영화관 목록
	public ModelAndView tList(int page, int limit) {
		System.out.println("[2] jsp → controller / page : " + page + ", limit : " + limit);
		mav = new ModelAndView();

		int block = 5;

		int count = tdao.tCount();

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

		List<TheaterDTO> theaterList = tdao.tList(paging);
		System.out.println("[4] dao → service : " + theaterList);

		mav.addObject("theaterList", theaterList);
		mav.addObject("paging", paging);

		mav.setViewName("theater/list");

		return mav;

	}

	// TV04 : 영화관 정보 상세보기
	public ModelAndView tView(String thName) {
		System.out.println("[2] controller → service : " + thName);
		mav = new ModelAndView();

		TheaterDTO theater = tdao.tView(thName);
		System.out.println("[4] dao → service : " + theater);

		mav.addObject("view", theater);
		mav.setViewName("theater/view");

		return mav;
	}

	// TM06 : 영화관 정보 수정
	public ModelAndView tModify(TheaterDTO theater) {
		System.out.println("[2] controller → service : " + theater);
		mav = new ModelAndView();

		String savePath = request.getServletContext().getRealPath("src/main/webapp/resources/fileUpload/")
				.replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps", "");
		MultipartFile thFile = theater.getThFile();

		String FileName = theater.getThFileName();

		if (!thFile.isEmpty()) {
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String fileName = thFile.getOriginalFilename();
			String thFileName = uuid + "_" + fileName;
			theater.setThFileName(thFileName);

			try {
				thFile.transferTo(new File(savePath + thFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		String thAddr = "(" + theater.getAddr1() + ") " + theater.getAddr2() + ", " + theater.getAddr3();

		theater.setThAddr(thAddr);

		int result = tdao.tModify(theater);
		System.out.println("[4] dao → service : " + result);

		if (result > 0) {
			mav.setViewName("redirect:tList");

			if (fileDelete(FileName)) {
				System.out.println("파일 삭제 성공");
			} else {
				System.out.println("파일 삭제 실패");
			}
		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	public boolean fileDelete(String fileName) {
		boolean result = false;

		// 저장경로
		String savePath = request.getServletContext().getRealPath("src/main/webapp/resources/profile/")
				.replace("\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps", "");

		// 삭제할 파일
		File deleteFile = new File(savePath + fileName);

		// 파일 존재여부 확인
		if (deleteFile.exists()) {
			System.out.println("파일 존재");

			// 파일 삭제
			if (deleteFile.delete()) {
				result = true;
			}
		} else {
			System.out.println("파일 존재 x");
		}

		return result;
	}

	// TM05 : 영화관정보 수정페이지 이동
	public ModelAndView tModiForm(int thNo) {
		System.out.println("[2] controller → service : " + thNo);
		mav = new ModelAndView();

		TheaterDTO theater = tdao.tViewNo(thNo);

		System.out.println("[4] dao → service : " + theater);

		mav.addObject("modify", theater);
		mav.setViewName("theater/modify");

		return mav;
	}

	// TD07 : 영화관 삭제
	public ModelAndView tDelete(int thNo) {
		System.out.println("[2] controller → service : " + thNo);
		mav = new ModelAndView();

		int result = tdao.tDelete(thNo);

		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}
	
	public List<String> setTheaters() {
		System.out.println("#2 controller to service");
		List<String> list = tdao.setTheaters();
		System.out.println(list);
		return list;
	}

}
