package com.icia.ms.dto;

import lombok.Data;

@Data
public class MovieTimeDTO {
	private int mtRn;
	private int mtNo;
	private String fmTitle;
	private String thName;	// DB에 없음
	private String mtDate;	
	private String scName;	// DB에 없음
	private String mtTime;
	private int mtCount;
	private int mtRemain;
	private int scNo;
}
