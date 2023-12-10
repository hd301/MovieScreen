package com.icia.ms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ms.dto.MemberDTO;
import com.icia.ms.service.MemberService;

@Controller
public class MemberController {
	
	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/mloginForm", method = RequestMethod.GET)
	public String mloginForm() {
		System.out.println("/mJoinForm : 회원가입 페이지 이동");
		return "member/login";
	}
	
	// MJ01 : 회원가입 페이지 이동
	@RequestMapping(value = "/mJoinForm", method = RequestMethod.GET)
	public String mJoinForm() {
		System.out.println("/mJoinForm : 회원가입 페이지 이동");
		return "member/join";
	}
	
	// MJ02 : 아이디 중복 검사
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	// @RequestParam "mId"는 ajax에서 보낸 data의 key값과 맵핑
	public @ResponseBody String idCheck(@RequestParam("mId") String mId) {
		String result = msvc.idCheck(mId);
		return result;
	}
	
	// MJ03 : 비밀번호 확인
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public @ResponseBody String pwCheck(@RequestParam("mId") String mId,
			@RequestParam("mPw") String mPw) {
		System.out.println("[ajax] mId = " + mId + ", mPw = " + mPw);
		String result = msvc.pwCheck(mId, mPw);
		return result;
	}
	
	// MJ04 : 휴대폰 본인인증
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	public @ResponseBody String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		//난수 생성
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		msvc.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}
	
	
	
	// MJ05 : 회원가입 처리
	@RequestMapping(value = "/mJoin", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute MemberDTO member) {
		System.out.println("/mJoin : 회원가입");
		System.out.println("[1] jsp -> controller : member = " + member);
		mav = msvc.mJoin(member);
		System.out.println("[5] service -> controller : mav = " + mav);
		return mav;
	}
	
	// ML06 : 로그인 페이지 이동
	@RequestMapping(value = "/mLoginForm", method = RequestMethod.GET)
	public String mLoginForm() {
		System.out.println("/mLoginForm : 로그인 페이지 이동");
		return "member/login";
	}
	
	// ML07 : 로그인 처리
	@RequestMapping(value = "/mLogin", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute MemberDTO member) {
		System.out.println("/mLogin : 로그인");
		System.out.println("[1] jsp -> controller : member = " + member);
		mav = msvc.mLogin(member);
		System.out.println("[5] service -> jsp");
		return mav;
	}
	
	// ML08 : 로그아웃
	@RequestMapping(value = "/mLogout", method = RequestMethod.GET)
	public String mLogout() {
		System.out.println("/mLogout : 로그아웃");
		session.invalidate();
		return "index";
	}
	
	// MT09 : 회원목록
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	// required false : page에 담겨오는 값이 없으면 int page = defaultValue = 1
	public ModelAndView mList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
							  @RequestParam(value = "limit", required = false, defaultValue = "5") int limit) {
		System.out.println("/mList : 회원목록");
		System.out.println("[1] jsp -> controller : page = " + page + ", limit = " + limit);
		mav = msvc.mList(page, limit);
		System.out.println("[5] service -> jsp");
		return mav;
	}
	
	// MV10 : 회원정보 상세보기
	@RequestMapping(value = "/mView", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("mId") String mId) {
		System.out.println("/mView : 회원정보 상세보기");
		System.out.println("[1] jsp -> controller : mId = " + mId);
		mav = msvc.mView(mId);
		System.out.println("[5] service -> controller");
		return mav;
	}
	
	
	// MF11 : 회원정보 수정 페이지 이동
	@RequestMapping(value = "/mModiForm", method = RequestMethod.GET)
	public ModelAndView mModiForm(@RequestParam("mId") String mId) {
		System.out.println("/mModiForm : 회원정보 수정 페이지 이동");
		System.out.println("[1] jsp -> controller : mId = " + mId);
		mav = msvc.modiForm(mId);
		System.out.println("[5] service -> controller");
		return mav;
	}
	
	// MF12 : 회원정보 수정
	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public ModelAndView mModify(@ModelAttribute MemberDTO member) {
		System.out.println("/mModify : 회원정보 수정");
		System.out.println("[1] jsp -> controller");
		mav = msvc.mModify(member);
		System.out.println("[5] service -> controller : member = " + mav);
		return mav; 
	}
	
	// MD13 : 회원정보 삭제
	@RequestMapping(value = "/mDelete", method = RequestMethod.GET)
	public ModelAndView mDelete(@RequestParam("mId") String mId) {
		System.out.println("/mDelete : 회원정보 삭제");
		System.out.println("[1] jsp -> controller");
		mav = msvc.mDelete(mId);
		System.out.println("[5] service -> controller : member = " + mav);
		return mav;
	}
	
}














