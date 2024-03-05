package com.semi.gold.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
