package com.icia.ms.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dao.MemberDAO;
import com.icia.ms.dto.MemberDTO;
import com.icia.ms.dto.PageDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberService {

	private ModelAndView mav;
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private BCryptPasswordEncoder pwEnc;
	
	@Autowired
	private HttpSession session;
	
	// MJ02 : 아이디 중복 검사
	public String idCheck(String mId) {
		String result = null;
		String checkId = mdao.idCheck(mId);
		if (checkId == null) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}
	
	// MJ03 : 비밀번호 확인
	public String pwCheck(String mId, String mPw) {
		String result = null;
		// DB에서 입력한 mId에 대한 암호화된 비밀번호 mPw 불러오기
		String encPw = mdao.mLogin(mId);
		System.out.println("[4] dao -> service : encPw = " + encPw);

		// 입력한 비밀번호와 match 시킴
		if (pwEnc.matches(mPw, encPw)) {
			// 비밀번호 일치시
			result = "OK";
		} else {
			result = "NO";
		}
		System.out.println("비밀번호 확인 : result = " + result);
		return result;
	}
	
	// MJ04 : 휴대폰 본인인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "key";
		String api_secret = "secrete key";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber);    // 수신전화번호
		params.put("from", "01011112222");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// MJ05 : 회원가입 처리
	public ModelAndView mJoin(MemberDTO member) {
		System.out.println("[2] controller -> service");
		mav = new ModelAndView();
		  
		// 1) 비밀번호 암호화
		member.setMPw(pwEnc.encode(member.getMPw()));
 
		// 2) 파일 업로드 시작
		MultipartFile mFile = member.getMProfile();
		
		if (!mFile.getOriginalFilename().isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String mFileName = uuid.toString().substring(0, 8) + "-" + mFile.getOriginalFilename();
			member.setMProfileName(mFileName);
			String savePath = "C:\\MyWorkspace\\Spring\\MovieScreen\\src\\main\\webapp\\resources\\profile\\";
			
			try {
				mFile.transferTo(new File(savePath+mFileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 3) 파일 업로드 끝
		
		int result = mdao.mJoin(member);
		System.out.println("#4 mJoin : result = " + result);
		
		if (result > 0) {
			// 회원가입 성공시 로그인페이지로 이동
			mav.setViewName("/member/login");
		} else {
			// 회원가입 실패시 회원가입페이지로 이동
			mav.setViewName("/member/join");
		}
		return mav;
	}

	// ML07 : 로그인 처리
	public ModelAndView mLogin(MemberDTO member) {
		System.out.println("[2] controller -> service : member = " + member);
		mav = new ModelAndView();
		
		// DB에서 입력한 mId에 대한 암호화된 비밀번호 mPw 불러오기
		String encPw = mdao.mLogin(member.getMId());
		System.out.println("[4-1] dao -> service : ");
		
		// 입력한 비밀번호와 match 시킴
		String mPw = member.getMPw();
		
		if (pwEnc.matches(mPw, encPw)) {
			// 일치할 경우 mId에 대한 정보를 불러와서 session을 씌운다.
			MemberDTO loginMember = mdao.mView(member.getMId());
			session.setAttribute("login", loginMember);
			mav.setViewName("index");
		} else {
			// 로그인 실패시 로그인 페이지로 이동
			mav.setViewName("/member/login");
		}
		return mav;
	}

	// MT09 : 회원목록
	public ModelAndView mList(int page, int limit) {
		System.out.println("[2] controller -> service : page = " + page + ", limit = " + limit);
		mav = new ModelAndView();
		
		int block = 5;
		int count = mdao.mCount();
		int maxPage = (int)(Math.ceil((double)count / limit));
		int startRow = ((page - 1) * limit) + 1;
		int endRow = page * limit;
		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;
		int endPage = startPage + block - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageDTO paging = new PageDTO();
		// startRow, endRow는 DB로 보냄
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		paging.setPage(page);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);
		
		List<MemberDTO> memberList = mdao.mList(paging);
		System.out.println("[4] dao -> service : memberList = " + memberList);
		// 웹 화면에 띄워줄 회원목록의 내용(아이디, 이름 등)과
		mav.addObject("memberList", memberList);
		// 페이지 처리를 하기위한 paging 객체를 가지고
		mav.addObject("paging", paging);
		// list.jsp로 이동
		mav.setViewName("/member/list");
		return mav;
	}

	// MV10 : 회원정보 상세보기
	public ModelAndView mView(String mId) {
		System.out.println("[2] controller -> service : mId = " + mId);		
		mav = new ModelAndView();
		
		MemberDTO member = mdao.mView(mId);
		System.out.println("[4] dao -> service : member = " + member);
		mav.addObject("view", member);
		mav.setViewName("/member/view");
		return mav;
	}

	// MF11 : 회원정보 수정 페이지 이동
	public ModelAndView modiForm(String mId) {
		System.out.println("[2] controller -> service : mId = " + mId);
		mav = new ModelAndView();
		MemberDTO member = mdao.mView(mId);
		System.out.println("[4] dao -> service : member = " + member);
		mav.addObject("modify", member);
		mav.setViewName("/member/modify");
		return mav;
	}

	// MF12 : 회원정보 수정
	public ModelAndView mModify(MemberDTO member) {
		System.out.println("[2] controller -> service : member = " + member);
		mav = new ModelAndView();
		// 1) 비밀번호 암호화
		member.setMPw(pwEnc.encode(member.getMPw()));

		
		// 3) 파일 업로드 시작
		MultipartFile mFile = member.getMProfile();
		String profileName = member.getMProfileName();
		
		if (!mFile.getOriginalFilename().isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String mFileName = uuid.toString().substring(0, 8) + "-" + mFile.getOriginalFilename();
			member.setMProfileName(mFileName);
			String savePath = "C:\\MyWorkspace\\Spring\\MovieScreen\\src\\main\\webapp\\resources\\profile\\";
			
			try {
				mFile.transferTo(new File(savePath+mFileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 3) 파일 업로드 끝
		
		int result = mdao.mModify(member);
		System.out.println("[4] dao -> service : result = " + result);
		if (result > 0) {
			// 회원정보 수정 성공 시
			// redirect : setViewName이지만 .jsp 파일이 아닌 controller로 이동
			mav.setViewName("redirect:/mView?mId=" + member.getMId());
			// 기존 업로드 된 파일 삭제 메소드 실행
			if (fileDelete(profileName)) {
				System.out.println("파일 삭제 성공");
			} else {
				System.out.println("파일 삭제 실패");
			}
		} else {
			// 회원정보 수정 실패시 index 페이지로 이동
			mav.setViewName("index");
		}
		return mav;
	}
	
	// 업로드 파일 삭제 메소드
	public boolean fileDelete(String fileName) {
		boolean result = false;
		String savePath = "C:\\MyWorkspace\\Spring\\MovieScreen\\src\\main\\webapp\\resources\\profile\\";
		File deleteFile = new File(savePath + fileName);
		
		if (deleteFile.exists()) {
			System.out.println("파일 존재");
			// 파일 삭제
			if (deleteFile.delete()) {
				result = true;
			}
		} else {
			System.out.println("파일이 존재하지 않습니다!");
		}
		return result;
	}
	
	// MD13 : 회원정보 삭제
	public ModelAndView mDelete(String mId) {
		mav = new ModelAndView();
		String fileName = mdao.mProfile(mId);
		int result = mdao.mDelete(mId);
		
		if(result > 0) {
			mav.setViewName("redirect:/mLogout");
			if(fileDelete(fileName)) {
				System.out.println("파일 삭제 성공");
			} else {
				System.out.println("파일 삭제 실패");
			}
			
		} else {
			mav.setViewName("redirect:/mView?mid=" + mId);
		}
		return mav;
	}

}
