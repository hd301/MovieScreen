package com.icia.ms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ms.dto.MemberDTO;
import com.icia.ms.dto.PageDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	// MJ02 : 아이디 중복 검사
	public String idCheck(String mId) {
		System.out.println("[3 idCheck] service -> dao : mId = " + mId);
		return sql.selectOne("Member.idCheck", mId);
	}

	// MJ05 : 회원가입 처리
	public int mJoin(MemberDTO member) {
		System.out.println("[3 mJoin] service -> dao : member = " + member);
		return sql.insert("Member.mJoin", member);
	}

	// ML07 : 로그인 처리
	public String mLogin(String mId) {
		System.out.println("[3 mLogin] service -> dao : mId = " + mId);
		return sql.selectOne("Member.mLogin", mId);
	}
	

	public int mCount() {		
		System.out.println("[3 mCount] service -> dao");
		return sql.selectOne("Member.mCount");
	}

	// MT09 : 회원목록
	public List<MemberDTO> mList(PageDTO paging) {
		System.out.println("[3 mList] service -> dao : paging = " + paging);
		System.out.println("startrow = " + paging.getStartRow() + ", endrow = " + paging.getEndRow());
		return sql.selectList("Member.mList", paging);
	}

	// MV10 : 회원정보 상세보기
	public MemberDTO mView(String mId) {
		System.out.println("[3] service -> dao : mId = " + mId);
		return sql.selectOne("Member.mView", mId);
	}

	// MF12 : 회원정보 수정
	public int mModify(MemberDTO member) {
		System.out.println("[3 mModify] service -> dao");
		return sql.update("Member.mModify", member);
	}

	public String mProfile(String mId) {
		System.out.println("[3 mProfile] service -> dao");
		return sql.selectOne("Member.mProfile", mId);
	}

	// MD13 : 회원정보 삭제
	public int mDelete(String mId) {
		System.out.println("[3 mDelete] service -> dao : mId = " + mId);
		return sql.delete("Member.mDelete", mId);
	}
}
