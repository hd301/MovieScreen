package com.icia.ms.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TheaterDTO {
	private int thNo;
	private String thName;
	private String thAddr;
	
	private String addr1;	// 우편번호
	private String addr2;	// 일반주소(도로명, 지번)
	private String addr3;	// 상세주소
	
	private MultipartFile thFile;
	private String thFileName;
}
