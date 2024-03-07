package com.semi.gold.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.MemberDAO;
import com.semi.gold.model.vo.Member;

// Spring Security에서 제공하는 UserDetailsService 인터페이스 상속
@Service
public class MemberService implements UserDetailsService {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private MemberDAO dao;
	
	// -> 로그인 시 자동으로 이곳으로 온다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = dao.getMemberById(username);
		return member;
	}
	
	// 회원가입
	public int registerMember(Member vo) {
		//비밀번호 암호화 처리한 후 멤버 정보 다시 담아서 DAO에게 전달!
		String encodePw = bcpe.encode(vo.getPassword());
		vo.setPassword(encodePw);
		return dao.registerMember(vo);
	}
	
	// 정보 수정
	public int updateMember(Member vo) {
		String encodePw = bcpe.encode(vo.getPassword());
		vo.setPassword(encodePw);
		return dao.updateMember(vo);
	}
	
	// 회원 탈퇴
	public int deleteMember(Member vo) {
		return dao.deleteMember(vo);
	}
	
	// 아이디 중복체크
	public Member idCheck(String id) {
		return dao.idCheck(id);
	}
	public Member nicknameCheck(String nickname) {
		return dao.nicknameCheck(nickname);
	}
}
