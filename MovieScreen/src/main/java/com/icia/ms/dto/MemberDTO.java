package com.icia.ms.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class MemberDTO {
	
	// 회원가입에 필요한 필드			
	private String mId;				
	private String mPw;				
	private String mName;			
	private String mBirth;			
	private String mGender;			
	private String mEmail;			
	private String mPhone;
	private String mAddr;
	
	private MultipartFile mProfile;
	private String mProfileName;
}