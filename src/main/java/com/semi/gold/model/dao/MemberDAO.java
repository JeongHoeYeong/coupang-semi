package com.semi.gold.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.stereotype.Repository;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;
import com.semi.gold.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int registerMember(Member vo) {
		return session.insert("memberMapper.registerMember",vo);
	}
	
	public Member getMemberById(String id) {
		return session.selectOne("memberMapper.getMemberById", id);
	}
	
	// 회원정보 수정
	public int updateMember(Member vo) {
		return session.update("memberMapper.updateMember", vo);
	}
	
	// 회원탈퇴
	public int deleteMember(Member vo) {
		return session.delete("memberMapper.deleteMember", vo);
	}

	// 아이디 중복 체크
	public Member idCheck(String id) {
		return session.selectOne("memberMapper.idCheck", id);
	}
	public Member nicknameCheck(String nickname) {
		return session.selectOne("memberMapper.nicknameCheck", nickname);
	}
	
	// 유저 아이디 찾기
	public String searchUserid(String email) {
		return session.selectOne("memberMapper.searchUserid", email);
	}
	
}

